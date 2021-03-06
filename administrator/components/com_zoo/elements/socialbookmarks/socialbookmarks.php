<?php
/**
* @package   ZOO Component
* @file      socialbookmarks.php
* @version   2.0.1 May 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

/*
   Class: ElementSocialBookmarks
       The ElementSocialBookmarks element class
*/
class ElementSocialBookmarks extends Element {

	/*
		Function: render
			Override. Renders the element.

	   Parameters:
            $params - render parameter

		Returns:
			String - html
	*/
	public function render($params = array()) {

		if ($this->_data->get('value')) {

			// init vars
			$bookmarks_config = $this->_config->get('bookmarks');
			$bookmarks 		  = array();

			// get active bookmarks
			foreach (self::getBookmarks() as $bookmark => $data) {
				if (isset($bookmarks_config[$bookmark]) && $bookmarks_config[$bookmark]) {
					$bookmarks[$bookmark] = $data;
				}
			}

			// render layout
			if ($layout = $this->getLayout()) {
				return self::renderLayout($layout, array('bookmarks' => $bookmarks));
			}
		}

		return null;
	}

	/*
	   Function: edit
	       Renders the edit form field.

	   Returns:
	       String - html
	*/
	public function edit() {
		
		return JHTML::_('select.booleanlist', 'elements[' . $this->identifier . '][value]', '', $this->_data->get('value', 1));
		
	}

	/*
		Function: getBookmarks
			Get array of supported bookmarks.

		Returns:
			Array - Bookmarks
	*/			
	public static function getBookmarks() {
		
		// Google
		$bookmarks['google']['link']  = "http://www.google.com/";
		$bookmarks['google']['click'] = "window.open('http://www.google.com/bookmarks/mark?op=add&hl=en&bkmk='+encodeURIComponent(location.href)+'&title='+encodeURIComponent(document.title));return false;";

		// Technorati
		$bookmarks['technorati']['link']  = "http://www.technorati.com/";
		$bookmarks['technorati']['click'] = "window.open('http://technorati.com/faves?add='+encodeURIComponent(location.href));return false;";

		// Yahoo
		$bookmarks['yahoo']['link']  = "http://www.yahoo.com/";
		$bookmarks['yahoo']['click'] = "window.open('http://myweb2.search.yahoo.com/myresults/bookmarklet?t='+encodeURIComponent(document.title)+'&u='+encodeURIComponent(location.href));return false;";

		// Delicious
		$bookmarks['delicious']['link']  = "http://del.icio.us/";
		$bookmarks['delicious']['click'] = "window.open('http://del.icio.us/post?v=2&url='+encodeURIComponent(location.href)+'&title='+encodeURIComponent(document.title));return false;";

		// StumbleUpon
		$bookmarks['stumbleupon']['link']  = "http://www.stumbleupon.com/";
		$bookmarks['stumbleupon']['click'] = "window.open('http://www.stumbleupon.com/submit?url='+encodeURIComponent(location.href)+'&title='+encodeURIComponent(document.title));return false;";

		// Digg
		$bookmarks['digg']['link']  = "http://digg.com/";
		$bookmarks['digg']['click'] = "window.open('http://digg.com/submit?phase=2&url='+encodeURIComponent(location.href)+'&bodytext=tags=title='+encodeURIComponent(document.title));return false;";

		// Facebook
		$bookmarks['facebook']['link']  = "http://www.facebook.com/";
		$bookmarks['facebook']['click'] = "window.open('http://www.facebook.com/sharer.php?u='+encodeURIComponent(location.href)+'&t='+encodeURIComponent(document.title));return false;";

		// Reddit
		$bookmarks['reddit']['link']  = "http://reddit.com/";
		$bookmarks['reddit']['click'] = "window.open('http://reddit.com/submit?url='+encodeURIComponent(location.href)+'&title='+encodeURIComponent(document.title));return false;";

		// Myspace
		$bookmarks['myspace']['link']  = "http://www.myspace.com/";
		$bookmarks['myspace']['click'] = "window.open('http://www.myspace.com/index.cfm?fuseaction=postto&'+'t='+encodeURIComponent(document.title)+'&c=u='+encodeURIComponent(location.href)+'&l=');return false;";

		// Windows live
		$bookmarks['live']['link']  = "http://www.live.com/";
		$bookmarks['live']['click'] = "window.open('https://favorites.live.com/quickadd.aspx?url='+encodeURIComponent(location.href)+'&title='+encodeURIComponent(document.title));return false;";

		// Twitter
		$bookmarks['twitter']['link']  = "http://twitter.com/";
		$bookmarks['twitter']['click'] = "window.open('http://twitter.com/home?status='+encodeURIComponent(document.title));return false;";

		// Email
		$bookmarks['email']['link']  = "";
		$bookmarks['email']['click'] = "this.href='mailto:?subject='+document.title+'&body='+encodeURIComponent(location.href);";

		return $bookmarks;
	}

	/*
		Function: bindConfig
			Binds the data array.

		Parameters:
			$data - data array
	        $ignore - An array or space separated list of fields not to bind

		Returns:
			Void
	*/
	public function bindConfig($data, $ignore = array()) {
		parent::bindConfig($data, $ignore);

		$bookmarks = array();
		
		foreach (self::getBookmarks() as $bookmark => $value) {
			if (isset($data[$bookmark])) {
				$bookmarks[$bookmark] = $data[$bookmark];
			}
		}

		$this->_config->set('bookmarks', $bookmarks);
	}

	/*
	   Function: loadConfig
	       Converts the XML to a Dataarray and calls the bind method.

	   Parameters:
	      XML - The XML for this Element
	*/
	public function loadConfig($xml) {
		parent::loadConfig($xml);

		$bookmarks = array();
		
		foreach (self::getBookmarks() as $bookmark => $value) {
			$bookmarks[$bookmark] = (string) $xml->attributes()->$bookmark;
		}

		$this->_config->set('bookmarks', $bookmarks);
	}

	/*
		Function: getConfigXML
			Get elements XML.

		Parameters:
	        $ignore - An array or space separated list of fields not to include

		Returns:
			Object - YXMLElement
	*/
	public function getConfigXML($ignore = array()) {

		$xml = parent::getConfigXML($ignore);
		
		$bookmarks = $this->_config->get('bookmarks');
		
		foreach (self::getBookmarks() as $bookmark => $value) {
			if (isset($bookmarks[$bookmark])) {
				$xml->addAttribute($bookmark, $bookmarks[$bookmark]);
			}
		}
		
		return $xml;
	}

}