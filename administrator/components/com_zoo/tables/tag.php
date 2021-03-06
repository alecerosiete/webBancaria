<?php
/**
* @package   ZOO Component
* @file      tag.php
* @version   2.0.1 May 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

/*
	Class: TagTable
		The table class for tags.
*/
class TagTable extends YTable {

	protected function __construct() {
		parent::__construct('stdClass', ZOO_TABLE_TAG, 'name');
	}

	/*
		Function: getAll
			Retrieve all tags.

		Returns:
			Array
	*/
	public function getAll($application_id = false, $search = "", $tag = "", $orderby = "", $offset = 0, $limit = 0, $published = false) {

		// get database
		$db = $this->getDBO();

		$query = "SELECT a.name, COUNT(a.item_id) AS items"
			." FROM ".$this->getTableName()." AS a".($application_id !== false ? ", ".ZOO_TABLE_ITEM." AS b" : "")
			." WHERE 1"
			.($application_id !== false ? " AND a.item_id = b.id AND b.application_id = ".(int) $application_id : "")
			.(!empty($search) ? " AND LOWER(a.name) LIKE ".$db->Quote('%'.$db->getEscaped($search, true).'%', false) : "")
			.(!empty($tag) ? " AND a.name = ".$db->Quote($tag) : "")
			.($published ? " AND b.state=1" : "")
			." GROUP BY a.name"
			.($orderby ? " ORDER BY ".$orderby : "")
			.(($limit ? " LIMIT ".(int)$offset.",".(int)$limit : ""));

		return $db->queryObjectList($query);
	}

	/*
		Function: getItemTags
			Method to retrieve all tags of an item.

		Parameters:
			$item_id - Item id

		Returns:
			Array - Array of tags
	*/
	public function getItemTags($item_id){

		$query = "SELECT name"
			." FROM ".$this->getTableName()
			." WHERE item_id = ".(int) $item_id;

		return $this->getDBO()->queryResultArray($query);
	}

	/*
		Function: save
			Save tags.
	*/
	public function save($item_id, $tags) {

		// get database
		$db = $this->getDBO();
		
		// delete old item tags
		$query = "DELETE FROM ".$this->getTableName()
				." WHERE item_id = ".(int) $item_id;
		$db->query($query);			

		// insert new item tags
		if (count($tags)) {
			foreach ($tags as $tag) {
				$values[] = sprintf("(%s, '%s')", (int) $item_id, $db->getEscaped($tag));
			}

			$query = "INSERT INTO ".$this->getTableName()
					." VALUES ".implode(", ", $values);
			$db->query($query);	
		}
	}	

	/*
		Function: update
			Update tags.
	*/
	public function update($application_id, $old, $new) {

		// get database
		$db = $this->getDBO();

		// get item ids
		$query = "SELECT a.* FROM ".$this->getTableName()." AS a"
		        ." LEFT JOIN ".ZOO_TABLE_ITEM." AS b ON a.item_id = b.id"
			    ." WHERE a.name = '".$db->getEscaped($old)."'"
			    ." AND b.application_id = ".(int) $application_id;
		$ids = $db->queryResultArray($query);
		
		if (count($ids)) {

			// remove all item tags which have the new tag already, to avoid duplicate keys
			$query = "DELETE FROM ".$this->getTableName()
				    ." WHERE name = '".$db->getEscaped($new)."'"
				    ." AND item_id IN (".implode(", ", $ids).")";
			$db->query($query);	
			
			// update all old tags
			$query = "UPDATE ".$this->getTableName()
			        ." SET name = '".$db->getEscaped($new)."'"
				    ." WHERE name = '".$db->getEscaped($old)."'"
				    ." AND item_id IN (".implode(", ", $ids).")";
			$db->query($query);	
		}
	}

	/*
		Function: delete
			Delete tags.

		Returns:
			Boolean.
	*/
	public function delete($application_id, $tags) {

		// get database
		$db = $this->getDBO();

		// delete item tags
		$query = "DELETE a"
			    ." FROM ".$this->getTableName()." AS a, ".ZOO_TABLE_ITEM." AS b"
				." WHERE a.item_id = b.id AND b.application_id = ".(int) $application_id
			    ." AND a.name ".(is_array($tags) ? "IN ('".implode("','", $tags)."')" : "= ".$db->Quote($tags));

		return $db->query($query);	
	}
	
}

/*
	Class: TagTableException
*/
class TagTableException extends YException {}