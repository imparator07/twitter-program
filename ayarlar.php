<?php
ini_set('memory_limit', '-1');	
ini_set('max_execution_time', 0);

$veritabani_host	=	'localhost';

$veritabani_kullanici	=	'insomnia_twit';

$veritabani_sifre	=	'deniz.17';

$veritabani_isim	=	'insomnia_deneme';

$url = "http://deck.insomniaturk.com/";

$connect = mysql_connect($veritabani_host,$veritabani_kullanici,$veritabani_sifre);  

if (!$connect) {
	die('Veritabanýna Baðlanýlamadý : ' . mysql_error());
}else{
	mysql_select_db($veritabani_isim); 
	mysql_query("SET NAMES utf8");
	mysql_query("SET CHARACTER SET utf8");
	mysql_query("SET COLLATION_CONNECTION = 'utf8_general_ci'");
}
define("MYSQL_HOST", $veritabani_host);
define("MYSQL_USER", $veritabani_kullanici);
define("MYSQL_PASS", $veritabani_sifre);
define("MYSQL_DB", $veritabani_isim);
define("CHARSET", "UTF8");

?>