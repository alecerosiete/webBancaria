<?php
/**
* @package   ZOO Tag Module
* @file      list.php
* @version   2.0.0 May 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

// include css
JHTML::stylesheet('style.css', JURI::base().'modules/mod_zootag/tmpl/list/');

$count = count($tags);

?>

<div class="zoo-tag list">

	<?php if ($count) : ?>

		<ul>
			<?php $i = 0; foreach ($tags as $tag) : ?>
			<li class="weight<?php echo $tag->weight; ?> <?php if ($i % 2 == 0) { echo 'odd'; } else { echo 'even'; } ?>">
				<a href="<?php echo JRoute::_($tag->href); ?>"><?php echo $tag->name; ?></a>
			</li>
			<?php $i++; endforeach; ?>
		</ul>
	
	<?php else : ?>
		<?php echo JText::_('No tags found'); ?>
	<?php endif; ?>
	
</div>
