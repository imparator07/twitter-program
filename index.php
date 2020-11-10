<?php
    require('functions.php');
	include 'ayarlar.php';
	include 'ayarlar/db.php';
	include 'ayarlar/oauths.php';
	$adminYetki = DB::getRow("SELECT * FROM uyelikler where username = '".$_SESSION['user']."' ");
	$akceCek = DB::getRow("SELECT * FROM uyelikler WHERE username = '".$_SESSION['user']."'");
	$toplamTakipci = DB::getVar("SELECT count(id) FROM uyeHesap where kullanici = '".$_SESSION['user']."' ");
	 if (!$adminYetki->yetki == 1)  {
	if ($toplamTakipci >0) {
	$row = mysql_fetch_array(mysql_query("SELECT SUM(takipcisi) FROM uyeHesap where kullanici = '".$_SESSION['user']."' "));
	}else {
	$row = "0";
	}
	
	}else {
	if ($toplamTakipci >0) {
	$row = mysql_fetch_array(mysql_query("SELECT SUM(takipcisi) FROM uyeHesap "));
	}else {
	$row = "0";
	}	
	
	}
	$toplamhesap = DB::getVar("SELECT count(id) FROM uyeHesap where kullanici = '".$_SESSION['user']."' ");
	$toplamislem = DB::getVar("SELECT count(id) FROM Log where kullanici = '".$_SESSION['user']."' ");
	if ($toplamhesap>=20){
			$renk = "grey";
			$uyelikTuru = "Platin Üyelik";
			}elseif ($toplamhesap>=15) {
			$renk = "#D4AF37";
			$uyelikTuru = "Altın Üyelik";
			}elseif ($toplamhesap>=10) {
			$renk = "#C0C0C0";	
			$uyelikTuru = "Gümüş Üyelik";
			}elseif ($toplamhesap>=5) {
			$renk = "#CD7F32";
			$uyelikTuru = "Bronz Üyelik";
			}elseif($toplamhesap<=4) {
			$renk = "black";
			$uyelikTuru = "Yeni Üyelik";
			}
    get_header();
?>
<div class="main-content">
<div class="main-content-inner">
<div class="breadcrumbs" id="breadcrumbs">
<script id="_wau40y">var _wau = _wau || [];
_wau.push(["tab", "vnjk295r2wys", "40y", "right-middle"]);
(function() {var s=document.createElement("script"); s.async=true;
s.src="http://widgets.amung.us/tab.js";
document.getElementsByTagName("head")[0].appendChild(s);
})();</script>
<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="<? echo base_url() ?>">Anasayfa</a>
							</li>
						</ul><!-- /.breadcrumb -->
						</div>
						<div class="page-content">
		<div class="row">
<div class="space-6"></div>
<div class="col-sm-12 infobox-container">
										<div class="infobox infobox-green">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-users"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number"><?php echo $toplamhesap?></span>
												<div class="infobox-content">Toplam Hesap</div>
											</div>

										</div>

										<div class="infobox infobox-blue">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-twitter"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number"><?php echo $toplamhesap?></span>
												<div class="infobox-content">Toplam İşlem</div>
											</div>
										</div>

										<div class="infobox infobox-red">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-drupal"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number"><?php echo $toplamhesap?></span>
												<div class="infobox-content"><?php echo $uyelikTuru ?></div>
											</div>
										</div>

										<div class="infobox infobox-pink">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-line-chart"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number"><?php echo $row['SUM(takipcisi)'] ?></span>
												<div class="infobox-content">Toplam Takipci</div>
											</div>
										</div>

										<div class="infobox infobox-black">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-turkish-lira"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number"><?php echo $akceCek->kredi?></span>
												<div class="infobox-content">Akçe</div>
											</div>
										</div>
									</div>

									<?php $toplamDuyuru = DB::getVar("SELECT count(id) FROM duyurular  ");
									if ($toplamDuyuru > 0) { ?>

									<div class="col-sm">
										<h3 class="header smaller lighter green">
											<i class="ace-icon fa fa-bullhorn"></i>
											Duyurular
										</h3>
									
									<?php } ?>
									
									
									<?php $duyurular = DB::query("SELECT * FROM duyurular ");
									$toplamDuyuru = DB::getVar("SELECT count(id) FROM duyurular  ");
                            foreach ($duyurular as $duyuru){
							$duyurutipi = $duyuru->duyurutipi;
							if ($duyurutipi == 1) {
							$duyururenk = "danger";
							$duyurubasligi = "Önemli!";
							}elseif ($duyurutipi == 2) {
							$duyururenk = "warning";
							$duyurubasligi = "Güncelleme!";
							}elseif ($duyurutipi == 3) {
							$duyururenk = "info";
							$duyurubasligi = "Bilgi!";	
							}
                             ?>
							 <div class="alert alert-<?php echo $duyururenk?>">
											<strong><?php echo $duyurubasligi ?></strong>

											<?php echo $duyuru->duyuru ?>
											<br />
										</div>
							 
							 <?php } ?> 
									</div><!-- /.col -->

		</div><!-- /.row -->

<?php
    
    get_footer();
?>