<?php
// put full path to Smarty.class.php
require('/usr/share/php/Smarty/Smarty.class.php');
$smarty = new Smarty();
$smarty->compile_check = true;
#$smarty->debugging = true;
$smarty->template_dir = '/home/j/yangda/website/smarty/templates';
$smarty->compile_dir = '/home/j/yangda/website/smarty/templates_c';
$smarty->cache_dir = '/home/j/yangda/website/smarty/cache';
$smarty->config_dir = '/home/j/yangda/website/smarty/configs';
$blog_title="Coffee Talk Blog";
ini_set('display_errors', '1');
error_reporting(E_ALL | E_STRICT);
#ini_set('display_startup_errors', '1');
?>

