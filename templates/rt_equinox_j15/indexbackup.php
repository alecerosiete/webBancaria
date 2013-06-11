<?php
// no direct access
defined( '_JEXEC' ) or die( 'Restricted index access' );
define( 'YOURBASEPATH', dirname(__FILE__) );
require( YOURBASEPATH.DS."rt_styleswitcher.php");

$old = $this->baseurl.'/media/system/js/mootools.js';
$new = $this->baseurl.'/templates/'.$this->template.'/js/mootools.js';
$a = array();
foreach ($this->_scripts as $k => $v)
{
	if ($k == $old) {
		$a[$new] = $v;
	} else {
		$a[$k] = $v;
	}
}
$this->_scripts = $a;

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" >
<head>
<jdoc:include type="head" />
<?php
	$live_site        = $mainframe->getCfg('live_site');
	$default_style    = $this->params->get("defaultStyle", "style2");
	$sidebar_width	  = $this->params->get("sidebarWidth", "25%");
	$secondcol_width  = $this->params->get("secondcolWidth", "25%");
	$width_style      = $this->params->get("templateWidthStyle", "fixed"); 
	$template_width   = $this->params->get("templateWidth", "990"); 
	$menu_name        = $this->params->get("menuName", "mainmenu");
	$menu_type        = $this->params->get("menuType", "moomenu");
	$default_font     = $this->params->get("defaultFont", "default");
	$show_breadcrumbs = ($this->params->get("showBreadcrumbs", 0)  == 0)?"false":"true";

	// moomenu options
	$moo_bgiframe     = ($this->params->get("moo_bgiframe'","0") == 0)?"false":"true";
	$moo_delay        = $this->params->get("moo_delay", "500");
	$moo_duration     = $this->params->get("moo_duration", "400");
	$moo_fps          = $this->params->get("moo_fps", "100");
	$moo_transition   = $this->params->get("moo_transition", "Expo.easeOut");	

	// rokzoom options
	$enable_rokzoom   = ($this->params->get("enableRokzoom", 1)  == 0)?"false":"true";
	$zoom_resize_duration     = $this->params->get("zoom_resize_duration", "700");
	$zoom_opacity_duration     = $this->params->get("zoom_opacity_duration", "500");
	$zoom_transition   			  = $this->params->get("zoom_transition", "Cubic.easeOut");

	require(YOURBASEPATH .DS."rt_styleloader.php");
	require(YOURBASEPATH .DS."rt_utils.php");

?>
	<meta http-equiv="Content-Type" content="text/html; <?php echo _ISO; ?>" />
<script type="text/javascript" language="Javascript">
</script>
	<link rel="shortcut icon" href="<?php echo $this->baseurl; ?>/images/favicon.ico" />
	<?php if($mtype=="moomenu" or $mtype=="suckerfish") :?>
	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/css/rokmoomenu.css" rel="stylesheet" type="text/css" />
	<?php endif; ?>
		<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/css/template_css.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/css/<?php echo $tstyle; ?>.css" rel="stylesheet" type="text/css" />
	<?php if($enable_rokzoom=="true") :?>
	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/rokzoom/rokzoom.css" rel="stylesheet" type="text/css" />
	<?php endif; ?>
	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/css/rokslidestrip.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		div.wrapper { <?php echo $template_width; ?>
	font-family: Arial, Helvetica, sans-serif;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 9px;
	text-align: left;
}
		#sidecol { width: <?php echo $sidebar_width; ?>;}
		#secondcol { width: <?php echo $secondcol_width; ?>;}
		#content { margin-left: <?php echo $sidebar_width; ?>;margin-right: <?php echo $secondcol_width; ?>;}
		#bottommodules { margin-left: <?php echo $sidebar_width; ?>;}
	.Estilo1 {
	margin-left: 1px;
	color: #666;
}
    </style>	
	<?php if (isIe6()) :?>
	<!--[if lte IE 6]>
	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/css/template_ie6.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	img { behavior: url(<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/css/iepngfix.htc); } 
	</style>
	<![endif]-->
	<?php endif; ?>
	<?php if($enable_rokzoom=="true") :?>
<script type="text/javascript" src="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/rokzoom/rokzoom.js"></script>
	<?php endif; ?>
	<?php if($mtype=="moomenu") :?>
	<script type="text/javascript" src="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/js/rokmoomenu.js"></script>
	<script type="text/javascript" src="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/js/mootools.bgiframe.js"></script>
	<script type="text/javascript">
	window.addEvent('domready', function() {
		new Rokmoomenu($E('ul.menu'), {
			bgiframe: <?php echo $moo_bgiframe; ?>,
			delay: <?php echo $moo_delay; ?>,
			animate: {
				props: ['opacity', 'width', 'height'],
				opts: {
					duration:<?php echo $moo_duration; ?>,
					fps: <?php echo $moo_fps; ?>,
					transition: Fx.Transitions.<?php echo $moo_transition; ?>
				}
			}
		});
	});
	</script>
	<?php endif; ?>	
	<?php if($mtype=="suckerfish" or $mtype=="splitmenu") :
		echo "<!--[if IE]>\n";		
	  include_once( $this->baseurl ."/templates/" . $mainframe->getTemplate() . "/js/ie_suckerfish.js" );
	  echo "<![endif]-->\n";
	endif; ?>	
	<?php if($enable_rokzoom=="true") :?>
	<script type="text/javascript">
		window.addEvent('load', function() {
			RokZoom.init({
				imageDir: '<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/rokzoom/images/',
				resizeFX: {
					duration: <?php echo $zoom_resize_duration; ?>,
					transition: Fx.Transitions.<?php echo $zoom_transition; ?>,
					wait: true
				},
				opacityFX: {
					duration: <?php echo $zoom_opacity_duration; ?>,
					wait: false	
				}
			});
		});
	</script>
	<?php endif; ?>
	</head>
	<body class="<?php echo $fontstyle; ?> <?php echo $tstyle; ?>">
		<!-- start wrapper -->
		<div class="wrapper">

			<div id="masthead">

					<a href="<?php echo $this->baseurl; ?>" class="nounder"><img src="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/images/blank.gif" style="border:0;" alt="" id="logo" /></a>
					<?php if ($this->countModules('top')) : ?>
					<div id="mod-top">
						<div class="top2">
							<div class="top3">
								<div class="padding">
									<jdoc:include type="modules" name="top" style="xhtml" />
								</div>
							</div>
						</div>
					</div>
					<?php endif; ?>

			</div>
			<div id="primary-nav">
				<div class="nav2">
					<div class="nav3">
						<div id="horiz-menu" class="<?php echo $mtype; ?>">
							<?php if($mtype != "module") :
								echo $mainnav;
							else: ?>
								<jdoc:include type="modules" name="toolbar" style="none" />
					    <?php endif; ?>	
							<div class="clr"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- start mainbody -->
			<div id="mainbody">
				<!-- start main side column -->
				<?php if ($this->countModules('user1') or $subnav) : ?>
				<div id="sidecol">
					<div class="col1">
						<div class="col2">
							<?php if($subnav) : ?>
							<div id="sub-menu">
								<?php echo $subnav; ?>
							</div>
							<?php endif; ?>
							<jdoc:include type="modules" name="user1" style="rounded" />
						</div>
					</div>
				</div>
				<?php endif; ?>
				<!-- end main side column -->
				<!-- start inset header area -->
				<div id="inset">
					<jdoc:include type="modules" name="inset" style="none" />
				</div>
				<!-- end inset header area -->
				<!-- start secondary column area -->
				<?php if ($this->countModules('user2')) : ?>
				<div id="secondcol">
					<div class="col1">
						<div class="col2">
							<jdoc:include type="modules" name="user2" style="rounded" />
						</div>
					</div>
				</div>
				<?php endif; ?>
				<!-- end secondary column area -->
				<!-- start main content area -->
				<div id="content"<?php echo $extra_space; ?>>
					<?php if ($show_breadcrumbs == "true") : ?>
						<jdoc:include type="module" name="breadcrumbs" style="none" />
					<?php endif; ?>
					<?php if ($this->countModules('user3') or $this->countModules('user4')) : ?>
					<div id="topmodules" class="spacer<?php echo $topmod_width; ?>">
						<?php if ($this->countModules('user3')) : ?>
						<div class="block">
							<jdoc:include type="modules" name="user3" style="rounded" />
						</div>
						<?php endif; ?>
						<?php if ($this->countModules('user4')) : ?>
						<div class="block">
							<jdoc:include type="modules" name="user4" style="rounded" />
						</div>
						<?php endif; ?>
					</div>
					<?php endif; ?>
					<div id="component">
						<div class="padding">
							<div class="padding2">
								<jdoc:include type="component" />
								<div id="user5">
									<jdoc:include type="modules" name="user5" style="rounded" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end main content area -->
				<!-- start bottom modules -->
				<?php if ($this->countModules('user6') or $this->countModules('user7') or $this->countModules('user8')) : ?>
				<div id="bottommodules" class="spacer<?php echo $bottommod_width; ?>">
					<?php if ($this->countModules('user6')) : ?>
					<div class="block">
						<jdoc:include type="modules" name="user6" style="rounded" />
					</div>
					<?php endif; ?>
					<?php if ($this->countModules('user7')) : ?>
					<div class="block">
						<jdoc:include type="modules" name="user7" style="rounded" />
					</div>
					<?php endif; ?>
					<?php if ($this->countModules('user8')) : ?>
					<div class="block">
						<jdoc:include type="modules" name="user8" style="rounded" />
					</div>
					<?php endif; ?>
				</div>
				<?php endif; ?>
				<!-- end bottom modules -->
</div>
			<!-- end body -->

		</div>
		<p>
		  <!-- end wrapper -->
		  
		  <!-- start the bottom stuff -->
    </p>
	<div style=" background-image:url(<?php echo $this->baseurl; ?>/images/footer.jpg) ; height:90px;">
		<div style="height:100px; margin-left:260px; color: #CCC;">
		  <li style="font-family: Arial, Helvetica, sans-serif; font-size: 9px; color: #060; text-align: left; float:none; list-style-type: none; margin-top:30px"><img src="<?php echo $this->baseurl; ?>/images/logo2.png" width="40" height="36" /></li>
		<li style="font-family: Arial, Helvetica, sans-serif; font-size: 9px; color: #FFF; text-align: left; float:none; list-style-type: none; margin-top:0px">Caja de Jubilaciones y Pensiones de Empleados de Bancos y Afines del Paraguay &copy; 2010 - Todos los Derechos Reservados</li>
		<li style="font-family: Arial, Helvetica, sans-serif; font-size: 9px; color: #FFF; text-align: left; float:none; list-style-type: none;">Pol&iacute;tica de Privacidad - T&eacute;rminos y Condiciones de Uso - www.cajabancaria.gov.py - (595 21) 492 051 / 052 / 053 / 054</li>  
      </div>
   	</div>
		<!-- end the bottom stuff -->

	</body>	
</html>