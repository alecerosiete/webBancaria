<?php
/**
* @package   ZOO Search Plugin
* @file      zoosearch.php
* @version   2.0.0 May 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/
/**
* @package   ZOO Search Plugin
* @file      zoosearch.php
* @version   2.0.0 May 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

// load config
require_once(JPATH_ADMINISTRATOR.'/components/com_zoo/config.php');

jimport('joomla.plugin.plugin');

class plgSearchZoosearch extends JPlugin {

	/* menu item mapping */
	var $menu;

	/*
		Function: plgSearchZoosearch
		  Constructor.

		Parameters:
	      $subject - Array
	      $params - Array
	
	   Returns:
	      Void
	*/    
	function plgSearchZoosearch($subject, $params) {
		parent::__construct($subject, $params);
	}

	/*
		Function: onSearchAreas
		  Get search areas.
	
	   Returns:
	      Array - Search areas
	*/	
	function onSearchAreas() {
		static $areas = array();
		return $areas;
	}

	/*
		Function: onSearch
		  Get search results. The sql must return the following fields that are used in a common display routine: href, title, section, created, text, browsernav

		Parameters:
	      $text - Target search string
	      $phrase - Matching option, exact|any|all
	      $ordering - Ordering option, newest|oldest|popular|alpha|category
	      $areas - An array if the search it to be restricted to areas, null if search all
	
	   Returns:
	      Array - Search results
	*/
	function onSearch($text, $phrase = '', $ordering = '', $areas = null) {

		// load config
		require_once(JPATH_ADMINISTRATOR.'/components/com_zoo/config.php');

		$db	  = JFactory::getDBO();
		$user = JFactory::getUser();
		$date = JFactory::getDate();

		// init vars
		$now  = $db->Quote($date->toMySQL());
		$null = $db->Quote($db->getNullDate());		
		$text = trim($text);
		
		// return empty array, if no search text provided
		if (empty($text)) {
			return array();
		}

		// get plugin info
	 	$plugin   = JPluginHelper::getPlugin('search', 'zoosearch');
	 	$params   = new JParameter($plugin->params);
		$fulltext = $params->get('search_fulltext', 1) && strlen($text) > 3 && intval($db->getVersion()) >= 4;
		$limit    = $params->get('search_limit', 50);

		// prepare search query
		switch ($phrase) {
			case 'exact':

				if ($fulltext) {
					$text    = $db->getEscaped($text);
					$where[] = "MATCH(a.name) AGAINST ('{$text}' IN BOOLEAN MODE)";
					$where[] = "MATCH(b.value) AGAINST ('{$text}' IN BOOLEAN MODE)";
					$where[] = "MATCH(c.name) AGAINST ('{$text}' IN BOOLEAN MODE)";
					$where   = implode(" OR ", $where);
				} else {
					$text	= $db->Quote('%'.$db->getEscaped($text, true).'%', false);
					$like   = array();
					$like[] = 'a.name LIKE '.$text;
					$like[] = 'b.value LIKE '.$text;
					$like[] = 'c.name LIKE '.$text;
					$where 	= '(' .implode(') OR (', $like).')';
				}

				break;

			case 'all':
			case 'any':
			default:

				if ($fulltext) {
					$text    = $db->getEscaped($text);
					$where[] = "MATCH(a.name) AGAINST ('{$text}' IN BOOLEAN MODE)";
					$where[] = "MATCH(b.value) AGAINST ('{$text}' IN BOOLEAN MODE)";
					$where[] = "MATCH(c.name) AGAINST ('{$text}' IN BOOLEAN MODE)";
					$where   = implode(" OR ", $where);
				} else {
					$words 	= explode(' ', $text);
					$wheres = array();

					foreach ($words as $word) {
						$word     = $db->Quote('%'.$db->getEscaped($word, true).'%', false);
						$like     = array();
						$like[]   = 'a.name LIKE '.$word;
						$like[]   = 'EXISTS (SELECT value FROM '.ZOO_TABLE_SEARCH.' WHERE a.id = item_id AND value LIKE '.$word.')';
						$like[]   = 'EXISTS (SELECT name FROM '.ZOO_TABLE_TAG.' WHERE a.id = item_id AND name LIKE '.$word.')';
						$wheres[] = implode(' OR ', $like);
					}

					$where = '('.implode(($phrase == 'all' ? ') AND (' : ') OR ('), $wheres).')';
				}
		}

		// set search ordering
		switch ($ordering) {
			case 'newest':
				$order = 'a.created DESC';
				break;

			case 'oldest':
				$order = 'a.created ASC';
				break;

			case 'popular':
				$order = 'a.hits DESC';
				break;

			case 'alpha':
			case 'category':
			default:
				$order = 'a.name ASC';
		}

		// set query options
		$select     = "DISTINCT a.*";
        $from       = ZOO_TABLE_ITEM." AS a"
			         ." LEFT JOIN ".ZOO_TABLE_SEARCH." AS b ON a.id = b.item_id"
		             ." LEFT JOIN ".ZOO_TABLE_TAG." AS c ON a.id = c.item_id";
		$conditions = array("(".$where.")"
                     ." AND a.searchable = 1"
                     ." AND a.access <= ".(int) $user->get('aid', 0)
                     ." AND (a.state = 1"
		             ." AND (a.publish_up = ".$null." OR a.publish_up <= ".$now.")"
		             ." AND (a.publish_down = ".$null." OR a.publish_down >= ".$now."))");

		// execute query
		$items = YTable::getInstance('item')->all(compact('select', 'from', 'conditions', 'order', 'limit'));

		// create search result rows
		$rows = array();
		if (!empty($items)) {

			// set renderer
			$renderer = new ItemRenderer();
			$renderer->addPath(array(dirname(__FILE__).DS.basename(__FILE__, '.php'), ZOO_SITE_PATH));

			foreach ($items as $item) {
				$row = new stdClass();
				$row->title = $item->name;
				$row->text = $renderer->render('item.default', array('item' => $item));
				$row->href = sprintf('index.php?option=com_zoo&task=item&item_id=%d', $item->id);
				$row->created = $item->created;
				$row->section = '';
				$row->browsernav = 2;
				$rows[] = $row;
			}
		}

		return $rows;
	}

}