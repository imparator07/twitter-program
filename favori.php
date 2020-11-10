<?php
    include('../functions.php');
	include('../ayarlar.php');
	include('../ayarlar/db.php');
	
	include("../ayarlar/EpiCurl.php");
	include('../ayarlar/EpiOAuth.php');
	include '../ayarlar/EpiTwitter.php';
if(isset($_POST["url"]))	{
if (empty($_POST["url"])) { 
               echo '<div class="alert alert-danger">
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
													Url boş birakilmaz!
												</strong>
											</p>
											</div>';	
											exit;
}		
function curlCek($URL) {
		
		$c = curl_init(  );
		curl_setopt( $c, CURLOPT_CONNECTTIMEOUT, 10 );
		curl_setopt( $c, CURLOPT_TIMEOUT, 10 );
		curl_setopt( $c, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt( $c, CURLOPT_SSL_VERIFYPEER, FALSE );
		curl_setopt( $c, CURLOPT_COOKIEFILE, 'cokkie.txt' );
		curl_setopt( $c, CURLOPT_COOKIEJAR, 'cookie.txt' );
		curl_setopt( $c, CURLOPT_REFERER, 'facebook.com' );
		curl_setopt( $c, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; tr; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13' );
		curl_setopt( $c, CURLOPT_URL, $URL );
		
		$contents = curl_exec( $c );
		
		$err = curl_getinfo( $c, CURLINFO_HTTP_CODE );
		curl_close( $c );

		if ($contents) {
			return $contents;
		}

		return FALSE;
	}
$favori_array = array();	
$krediCek = DB::getRow("SELECT * FROM uyelikler WHERE username = '".$_SESSION['user']."' ");
$appCek = DB::getRow("SELECT * FROM ayarlar WHERE id = '1' ");

$twitter = parse_url($_POST["url"]);
$twitterID = explode('/', $twitter['path']);
if($_POST["islem"]== 1) {
	
$onay = $krediCek->favoriKredi;
}else {
$onay = $krediCek->kredi;
}
if($onay>0) {

$twitterObj = new EpiTwitter($appCek->consumer_key, $appCek->consumer_secret_key);
$twitterObj->useAsynchronous(true);
$sorgu = mysql_query("select * from uyeHesap order by rand() ") or die("Hata Olustu!");
if(@mysql_num_rows($sorgu)!=0)
{
$i=0;
	while ($veri = mysql_fetch_array($sorgu)){  
		$access_token[$i] = $veri['access_token'];
		$access_token_secret[$i] = $veri['access_token_secret'];
		$screen_name[$i] = $veri['screen_name'];
		$i++; 
	} 
}
else
{ 
	echo '<div class="alert alert-danger">
<button type="button" class="close" data-dismiss="alert">
<i class="ace-icon fa fa-times"></i>
</button>
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
													Sistemde hesap yok!
												</strong>
											</p>
											</div>';
	exit();
}
					
if($_POST["islem"]== 1) {

$cek = curlCek($_POST["url"]);	
preg_match("/data-screen-name\=\"(.*?)\"/", $cek, $output_array);
if (empty($output_array[1])) {
	echo '<div class="alert alert-danger">
<button type="button" class="close" data-dismiss="alert">
<i class="ace-icon fa fa-times"></i>
</button>
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
													Twitter ile ilgili bi sorun oluştu az sonra tekrar deneyin..
												</strong>
											</p>
											</div>';	
											exit();
}
$yetkiKontrol = DB::getVar("SELECT count(id) FROM yetkiler WHERE screen_name = '".$output_array[1]."' and favori='Var'");
if ( $yetkiKontrol == 0 )
{
	echo '<div class="alert alert-danger">
<button type="button" class="close" data-dismiss="alert">
<i class="ace-icon fa fa-times"></i>
</button>
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
													'.$output_array[1].' Hesabının Favori Yetkisi Yok.
												</strong>
											</p>
											</div>';	
											exit();
}
if($krediCek->favoriKredi == 0 ) {
	echo '<div class="alert alert-danger">
<button type="button" class="close" data-dismiss="alert">
<i class="ace-icon fa fa-times"></i>
</button>
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
													  Favori Krediniz Yetersiz.
												</strong>
											</p>
											</div>';	
											exit();	
	
	
}
$cikar = $krediCek->favoriKredi-1;
DB::exec("UPDATE uyelikler SET favoriKredi = '".$cikar."' WHERE username = '".$_SESSION['user']."'");
date_default_timezone_set('Europe/Istanbul');
$tarihi = date('d.m.Y H:i:s');
$ekle = DB::insert(
                        'INSERT INTO Log (tarih, icerik, islem, kullanici) VALUES (?, ?, ?, ?)',
                        array($tarihi, $_POST["url"], 'Favori(Kredili İşlem)', $_SESSION['user'])
);	
	
	for ($i=0;$i<mysql_num_rows($sorgu);$i++){
$twitterObj->setToken($access_token[$i],$access_token_secret[$i]);	
array_push($favori_array,$twitterObj->post("/favorites/create.json" ,array('id' => $twitterID[3])));	
}
}else{
$cek = curlCek($_POST["url"]);	
preg_match("/data-screen-name\=\"(.*?)\"/", $cek, $output_array);
if (empty($output_array[1])) {
	echo '<div class="alert alert-danger">
<button type="button" class="close" data-dismiss="alert">
<i class="ace-icon fa fa-times"></i>
</button>
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
													Twitter ile ilgili bi sorun oluştu az sonra tekrar deneyin.
												</strong>
											</p>
											</div>';	
											exit();
}
$yetkiKontrol = DB::getVar("SELECT count(id) FROM yetkiler WHERE screen_name = '".$output_array[1]."' and retweet='Var'");
if ( $yetkiKontrol == 0 )
{
	echo '<div class="alert alert-danger">
<button type="button" class="close" data-dismiss="alert">
<i class="ace-icon fa fa-times"></i>
</button>
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
													'.$output_array[1].' Hesabının Retweet Yetkisi Yok.
												</strong>
											</p>
											</div>';	
											exit();
}
if($krediCek->kredi == 0 ) {
	echo '<div class="alert alert-danger">
<button type="button" class="close" data-dismiss="alert">
<i class="ace-icon fa fa-times"></i>
</button>
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
													  Retweet Krediniz Yetersiz.
												</strong>
											</p>
											</div>';	
											exit();	
}											
$cikar = $krediCek->kredi-1;
DB::exec("UPDATE uyelikler SET kredi = '".$cikar."' WHERE username = '".$_SESSION['user']."'");
date_default_timezone_set('Europe/Istanbul');
$tarihi = date('d.m.Y H:i:s');
$ekle = DB::insert(
                        'INSERT INTO Log (tarih, icerik, islem, kullanici) VALUES (?, ?, ?, ?)',
                        array($tarihi, $_POST["url"], 'Retweet(Kredili İşlem)', $_SESSION['user'])
);
date_default_timezone_set('Europe/Istanbul');
$tarihi = date('d.m.Y H:i:s');	
$logtarih = date('H:i');	
for ($i=0;$i<mysql_num_rows($sorgu);$i++){
$twitterObj->setToken($access_token[$i],$access_token_secret[$i]);		
$tweetat= $twitterObj->post('/statuses/retweet/'.$twitterID[3].'.json');
$idEkle = DB::insert(
                        'INSERT INTO tweet_id (saat, tweet_id, username, durum, kacSaat) VALUES (?, ?, ?, ?, ?)',
                        array($logtarih,  $tweetat->id_str, $screen_name[$i], 'no', $appCek->kacSaat)
);
}
}
	echo '<div class="alert alert-block alert-success">
<button type="button" class="close" data-dismiss="alert">
<i class="ace-icon fa fa-times"></i>
</button>
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
														İşlem Tamamlandı! Hesabınızdan 1 Kredi Kesildi
												</strong>
											</p>
											</div>';	
	



}else {


$twitterObj = new EpiTwitter($appCek->consumer_key, $appCek->consumer_secret_key);
$twitterObj->useAsynchronous(true);	
$sorgu = mysql_query("select * from uyeHesap where  kullanici = '".$_SESSION['user']."' order by rand() ") or die("Hata Olustu!");
if(@mysql_num_rows($sorgu)!=0)
{
$i=0;
	while ($veri = mysql_fetch_array($sorgu)){  
		$access_token[$i] = $veri['access_token'];
		$access_token_secret[$i] = $veri['access_token_secret'];
		$screen_name[$i] = $veri['screen_name'];
		$i++; 
	} 
}
else
{ 
	echo '<div class="alert alert-danger">
<button type="button" class="close" data-dismiss="alert">
<i class="ace-icon fa fa-times"></i>
</button>
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
													Sistemde Hesabınız Yok!
												</strong>
											</p>
											</div>';
	exit();
}
date_default_timezone_set('Europe/Istanbul');
$tarihi = date('d.m.Y H:i:s');

	if($_POST["islem"]== 1) {
$cek = curlCek($_POST["url"]);	
preg_match("/data-screen-name\=\"(.*?)\"/", $cek, $output_array);
if (empty($output_array[1])) {
	echo '<div class="alert alert-danger">
<button type="button" class="close" data-dismiss="alert">
<i class="ace-icon fa fa-times"></i>
</button>
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
													Yetkisiz İşlem.
												</strong>
											</p>
											</div>';	
											exit();
}
$yetkiKontrol = DB::getVar("SELECT count(id) FROM yetkiler WHERE screen_name = '".$output_array[1]."' and favori='Var'");
if ( $yetkiKontrol == 0 )
{
	echo '<div class="alert alert-danger">
<button type="button" class="close" data-dismiss="alert">
<i class="ace-icon fa fa-times"></i>
</button>
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
													'.$output_array[1].' Hesabının Favori Yetkisi Yok.
												</strong>
											</p>
											</div>';	
											exit();
}
$ekle = DB::insert(
                        'INSERT INTO Log (tarih, icerik, islem, kullanici) VALUES (?, ?, ?, ?)',
                        array($tarihi, $_POST["url"], 'FAV(Kredisiz İşlem)', $_SESSION['user'])
                    );		
	for ($i=0;$i<mysql_num_rows($sorgu);$i++){
$twitterObj->setToken($access_token[$i],$access_token_secret[$i]);	
array_push($favori_array,$twitterObj->post("/favorites/create.json" ,array('id' => $twitterID[3])));	
	}
}else{
$cek = curlCek($_POST["url"]);	
preg_match("/data-screen-name\=\"(.*?)\"/", $cek, $output_array);
if (empty($output_array[1])) {
	echo '<div class="alert alert-danger">
<button type="button" class="close" data-dismiss="alert">
<i class="ace-icon fa fa-times"></i>
</button>
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
													Yetkisiz İşlem.
												</strong>
											</p>
											</div>';	
											exit();
}
$yetkiKontrol = DB::getVar("SELECT count(id) FROM yetkiler WHERE screen_name = '".$output_array[1]."' and retweet='Var'");
if ( $yetkiKontrol == 0 )
{
	echo '<div class="alert alert-danger">
<button type="button" class="close" data-dismiss="alert">
<i class="ace-icon fa fa-times"></i>
</button>
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
													'.$output_array[1].' Hesabının Retweet Yetkisi Yok.
												</strong>
											</p>
											</div>';	
											exit();
}
$ekle = DB::insert(
                        'INSERT INTO Log (tarih, icerik, islem, kullanici) VALUES (?, ?, ?, ?)',
                        array($tarihi, $_POST["url"], 'RT(Kredisiz İşlem)', $_SESSION['user'])
                    );		
date_default_timezone_set('Europe/Istanbul');
$tarihi = date('d.m.Y H:i:s');	
$logtarih = date('H:i');
for ($i=0;$i<mysql_num_rows($sorgu);$i++){
$twitterObj->setToken($access_token[$i],$access_token_secret[$i]);		
$tweetat = $twitterObj->post('/statuses/retweet/'.$twitterID[3].'.json');
$idEkle = DB::insert(
                        'INSERT INTO tweet_id (saat, tweet_id, username, durum, kacSaat) VALUES (?, ?, ?, ?, ?)',
                        array($logtarih,  $tweetat->id_str, $screen_name[$i], 'no', $appCek->kacSaat)
);
}
}
	
	echo '<div class="alert alert-block alert-success">
<button type="button" class="close" data-dismiss="alert">
<i class="ace-icon fa fa-times"></i>
</button>
<p>
												<strong>
													<i class="ace-icon fa fa-check"></i>
														Krediniz olmadığı için kendi hesaplarınızdan işlem yapıldı.
												</strong>
											</p>
											</div>';
}
	
}else {
echo "<script>alert('Post Geçersiz!');window.location.assign('islem');</script>";
echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('islem') . "';window.close();</script>";
}	
?>