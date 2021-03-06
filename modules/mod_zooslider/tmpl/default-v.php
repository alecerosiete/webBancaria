<?php
/**
* @package   ZOO Slider Module
* @file      default-v.php
* @version   1.5.0 May 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

?>
<div class="<?php echo $theme ?>">
	<div id="<?php echo $slider_id ?>" class="yoo-slider <?php echo $theme ?>" style="<?php echo $css_module_height ?>">

		<ul class="list">
		<?php $i = 0; ?>
		<?php foreach ($items as $item) : ?>
		
			<?php
			$item_class = "item item" . ($i + 1);
			if ($i == 0) $item_class .= " first";
			if ($i == $item_count - 1) $item_class .= " last";
			?>
			
			<li class="slide <?php echo $item_class ?>" style="<?php echo $css_item_height ?>">
				<div class="item-b" style="<?php echo $css_item_height_expanded ?>">
					<div class="item-t">
						<div class="item"><?php echo $renderer->render('item.'.$layout, compact('item', 'params')); ?></div>
					</div>
				</div>
			</li>
			<?php $i++; ?>
			
		<?php endforeach; ?>
		</ul>
	
	</div>
</div>