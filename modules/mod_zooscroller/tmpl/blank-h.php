<?php
/**
* @package   ZOO Scroller Module
* @file      blank-h.php
* @version   1.5.0 May 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

?>
<div class="<?php echo $theme ?>">
	<div id="<?php echo $scroller_id ?>" class="yoo-scroller" style="<?php echo $css_module_width . $css_module_height ?>">
	
		<div class="panel-container" style="<?php echo $css_module_width ?>">
			<div class="panel-container-bg">

				<div class="panel" style="<?php echo $css_panel_width . $css_panel_height ?>">
					<div style="<?php echo $css_total_panel_width ?>">
					<?php foreach ($items as $item) : ?>
						<div class="slide" style="<?php echo $css_slide_width ?>">
							<div class="item"><?php echo $renderer->render('item.'.$layout, compact('item', 'params')); ?></div>
						</div>
					<?php endforeach; ?>
					</div>
				</div>
				
				<?php if ($scrollbar) : ?>
				<div class="scrollarea" style="<?php echo $css_scrollarea_width ?>">
					<div class="scrollarea-l">
						<div class="scrollarea-r" style="<?php echo $css_scrollarea_height ?>">
						
							<div class="back"></div>
							<div class="scrollbar" style="<?php echo $css_scrollbar_width . $css_scrollbar_height ?>">
								<div class="scrollknob scrollknob-size">
									<div class="scrollknob-r">
										<div class="scrollknob-m">
										</div>
									</div>
								</div>
							</div>
							<div class="forward"></div>
							
						</div>
					</div>
				</div>
				<?php endif; ?>
			
			</div>
		</div>
										
	</div>
</div>