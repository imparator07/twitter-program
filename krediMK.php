<?php
//Yucel Ozalp

$baglan = mysql_connect("localhost","insomnia_twit","deniz.17");
 
if (! $baglan) die ("<em>MySQL</em>'e Bağlanılamıyor");
 
mysql_select_db("veritabanim", $baglan);
 
$guncelle = mysql_query("UPDATE uyelikler SET kredi = '4'");
 
if($guncelle){
 
echo "Güncellendi";
 
}else{
 
echo "Güncellenemedi";
 
}
 
mysql_close($baglan);
 
?>