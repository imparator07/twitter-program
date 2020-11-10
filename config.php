<?php
    require('ayarlar.php');
    return array(
        'DB_SERVER' => $veritabani_host,
        'DB_USERNAME' => $veritabani_kullanici,
        'DB_PASSWORD' => $veritabani_sifre,
        'DB_DATABASE' => $veritabani_isim,
        "BASE_URL" => $url 
    );
	
?>