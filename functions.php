<?php
ini_set('memory_limit', '-1');	
ini_set('max_execution_time', 60);
ini_set('displayerrors', 0);
    ob_implicit_flush();
    error_reporting(E_ALL);
    ini_set("display_errors", 0);
    ignore_user_abort(false);
    $config = include 'config.php';
    extract($config);
    session_start();
    $Utilities = new Utilities;
	$main_controller = new main_controller;
    define('CR', "\r");          // Carriage Return: Mac
    define('LF', "\n");          // Line Feed: Unix
    define('CRLF', "\r\n");      // Carriage Return and Line Feed: Windows
    define('BR', '<br />' . LF); // HTML Break
    class Utilities {
        private static $instance;
        public $cache_time = 1800;
        private $con;
        private $result;
        private $ayarlar;
        public function __construct() {
            global $config;
            self::$instance = & $this;
            if (isset($config) && !empty($config) && is_array($config)) {
                extract($config);
                $this->con = new PDO("mysql:host=" . $DB_SERVER . ";dbname=" . $DB_DATABASE, $DB_USERNAME, $DB_PASSWORD);
                $this->con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
                $queries = array("SET NAMES 'utf8'");
                foreach ($queries as $query) {
                    $this->con->query($query);
                }
            }
        }
        public function __destruct() {
            $this->con = NULL;
            $this->result = NULL;
        }
        public function query($queryString, $bindValues = NULL, $fetch_style = PDO::FETCH_OBJ) {
            $result = NULL;
            $queryType = NULL;
            if (preg_match("/update\s([a-zA-Z0-9_]{1,20}+)\sset/siU", $queryString, $table_match)):
                $queryType = "UPDATE";
            elseif (preg_match("/insert\sinto\s([a-zA-Z0-9_]{1,20}+)/siU", $queryString, $table_match)):
                $queryType = "INSERT";
            elseif (preg_match("/delete\sfrom\s([a-zA-Z0-9_]{1,20}+)/siU", $queryString, $table_match)):
                $queryType = "DELETE";
            elseif (preg_match("/from\s*([a-zA-Z0-9_]{1,20}+)/siU", $queryString, $table_match)):
                $queryType = "SELECT";
            endif;
            $query = $this->con->prepare($queryString);
            if (isset($bindValues) && is_array($bindValues)) {
                foreach ($bindValues as $key => $value) {
                    $key = ":" . $key;
                    $query->bindValue($key, $value, PDO::PARAM_STR);
                }
            }
            $query->execute();
            if ($queryType == "INSERT"):
                $lastInsertId = $this->con->lastInsertId();
                return $lastInsertId;
            endif;
            $result = new stdClass();
            $rowCount = $query->rowCount();
            $result->rowCount = $rowCount;
            if ($queryType == "SELECT"):
                $result->fetchAll = $query->fetchAll($fetch_style);
                if (count($result->fetchAll) > 0):
                    $result->fetch = $result->fetchAll[0];
                endif;
            endif;
            return $result;
        }
        public function insert($table, $data) {
            $values = "";
            $i = 0;
            $keys = "";
            $bindValues = array();
            foreach ($data as $key => $val) {
                $bindValues[$key] = $val;
                $keys .= $i == 0 ? $key : ",$key";
                $values .= (($i == 0) ? ":$key" : ", :$key");
                $i++;
            }
            $sql = "INSERT INTO $table ($keys) values($values)";
            return $this->query($sql, $bindValues);
        }
        public function update($table, $data, $where = NULL) {
            $values = "";
            $bindValues = array();
            $i = 0;
            foreach ($data as $key => $val) {
                $bindValues[$key] = $val;
                $values .= $i == 0 ? "$key = :{$key}" : ",$key = :{$key}";
                $i++;
            }
            $sql = "UPDATE $table SET $values";
            if ((isset($where) && $where)) {
                if (is_array($where)) {
                    $_where = "";
                    $i = 0;
                    foreach ($where as $key => $value) {
                        $bindValues[$key] = $value;
                        $_where .= $i == 0 ? "{$key} = :$key" : " AND {$key} = :$key";
                        $i++;
                    }
                    $where = $_where;
                }
                $sql .= " WHERE $where ";
            }
            return $this->query($sql, $bindValues);
        }
        public function delete($table, $where = NULL, $bindValues = NULL) {
            $values = "";
            $i = 0;
            $sql = "DELETE FROM $table ";
            if ((isset($where) && $where)) {
                if (is_array($where)) {
                    $_where = "";
                    $i = 0;
                    foreach ($where as $key => $value) {
                        $bindValues[$key] = $value;
                        $_where .= $i == 0 ? "{$key} = :$key" : " AND {$key} = :$key";
                        $i++;
                    }
                    $where = $_where;
                }
                $sql .= " WHERE $where ";
            }
            return $this->query($sql, $bindValues);
        }
			}
    class main_controller {
        public $Model;
        public $Models;
        public function __construct() {
            global $Utilities, $ayarlar;
            $script_name = str_replace("/", "\\", $_SERVER["SCRIPT_FILENAME"]);
            $script_name = str_replace("\\", "/", $script_name);
            $script_name = str_replace(realpath(dirname(__FILE__)), "", $script_name);
            $scr = pathinfo($script_name);
            $base_name = $scr["basename"];
            $_do = $scr["basename"] . (isset($_GET["do"]) ? ("_" . $_GET["do"]) : "");
            $queryString = parse_url($_SERVER["REQUEST_URI"], PHP_URL_QUERY);
            parse_str($queryString, $queryString);
            if (isset($queryString) && count($queryString) > 0) {
                foreach ($queryString as $key => $val) {
                    if (!isset($_GET[$key]))
                        $_GET[$key] = $val;
                }
            }
            if ($scr["basename"] == "login.php") {
                if ($this->IsAuthenticated()) {
                    yonlendir(base_url());
                } elseif ($_SERVER["REQUEST_METHOD"] == "POST") {
                    $username = $_POST["username"];
                    $password = $_POST["password"];
					$giris = $Utilities->query("SELECT * FROM uyelikler WHERE username = :username and password = :password" , array("username" => $username, "password" => $password));
                            if ($giris->rowCount > 0){
                            $_SESSION["giris"] = TRUE;  
							$_SESSION['user'] = $username;
							date_default_timezone_set('Europe/Istanbul');
							$tarihi = date('d.m.Y H:i:s');
                            $update = array(
								"songiris" => $tarihi,
                                "ipadresi" => $_SERVER["REMOTE_ADDR"]
                            );
                            $Utilities->update("uyelikler", $update, array("username" => $username));
							yonlendir(base_url());
                            }else {
							 echo "<script>alert('Kullanıcı adı veya Şifre Yanlış!');window.location.assign('login.php');</script>";	
							}
                }
            }
            if ($this->IsAuthenticated()) {
                if ($_SERVER["REQUEST_METHOD"] == "POST") {
                    $redirect = NULL;
                    switch ($base_name):
                        default:
                            break;
                    endswitch;
                    if ($redirect):
                        yonlendir($redirect);
                    endif;
                } else {
                    $redirect = NULL;
                    switch ($_do):
                        case "index.php_logout":
                            session_destroy();
                            yonlendir(base_url());
                            break;
						case "otomatikEtkilesim.php_sil":
                            $id = $_GET["id"];
                            $tweet = $Utilities->query("SELECT * FROM otoetkilesim WHERE id = :id and kullanici =:kullanici", array("id" => $id, "kullanici" => $_SESSION['user']));
                            if ($tweet->rowCount > 0):
                                $Utilities->delete("otoetkilesim", array("id" => $id));
                                echo "<script>alert('islem Silindi!');window.location.assign('otoetkilesim.php');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('otoetkilesim') . "';window.close();</script>";
                            else:
                                 echo "<script>alert('islem Bulunamadı!');window.location.assign('otoetkilesim.php');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('otoetkilesim') . "';window.close();</script>";
                            endif;
                            $redirect = base_url("otomatikEtkilesim");
                            break;
						case "hesaplar.php_sil":
                            $id = $_GET["id"];
							$ayar = $Utilities->query("SELECT * FROM uyelikler WHERE username = :username", array("username" => $_SESSION['user']));
							$ayarla = $ayar->fetch;
							if ($ayarla->yetki == 1){
                            $tweet = $Utilities->query("SELECT * FROM uyeHesap WHERE id = :id ", array("id" => $id));
                            if ($tweet->rowCount > 0):
                                $Utilities->delete("uyeHesap", array("id" => $id));
                                echo "<script>alert('islem Silindi!');window.location.assign('Accounts');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('Accounts') . "';window.close();</script>";
                            else:
                                echo "<script>alert('islem Bulunamadı!');window.location.assign('Accounts');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('Accounts') . "';window.close();</script>";
                            endif;
                            $redirect = base_url("Accounts");
                            break;	
							}else {
							$redirect = base_url("Accounts");	
							}
							case "duyuruEkle.php_sil":
                            $id = $_GET["id"];
							$ayar = $Utilities->query("SELECT * FROM uyelikler WHERE username = :username", array("username" => $_SESSION['user']));
							$ayarla = $ayar->fetch;
							if ($ayarla->yetki == 1){
                            $tweet = $Utilities->query("SELECT * FROM duyurular WHERE id = :id ", array("id" => $id));
                            if ($tweet->rowCount > 0):
                               $Utilities->delete("duyurular", array("id" => $id));
                                echo "<script>alert('islem Silindi!');window.location.assign('adminDuyuru');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('adminDuyuru') . "';window.close();</script>";
                            else:
                                echo "<script>alert('islem Bulunamadı!');window.location.assign('adminDuyuru');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('adminDuyuru') . "';window.close();</script>";
                            endif;
                            $redirect = base_url("adminDuyuru");
                            break;	
							}else {
							$redirect = base_url("adminDuyuru");	
							break;
							}
						case "otomatikTweet.php_sil":
                            $id = $_GET["id"];
                            $tweet = $Utilities->query("SELECT * FROM ototweet WHERE id = :id and kullanici = :kullanici", array("id" => $id, "kullanici" => $_SESSION['user']));
                            if ($tweet->rowCount > 0):
                                $Utilities->delete("ototweet", array("id" => $id));
                                echo "<script>alert('islem Silindi!');window.location.assign('otomatikTweet.php');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('otomatikTweet') . "';window.close();</script>";
                            else:
                                echo "<script>alert('islem Bulunamadı!');window.location.assign('otomatikTweet.php');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('otomatikTweet') . "';window.close();</script>";
                            endif;
                            $redirect = base_url("otomatikTweet");
                            break;
					case "adminYetki.php_sil":
                            $id = $_GET["id"];
							$ayar = $Utilities->query("SELECT * FROM uyelikler WHERE username = :username", array("username" => $_SESSION['user']));
							$ayarla = $ayar->fetch;
							if ($ayarla->yetki == 1){
                            $tweet = $Utilities->query("SELECT * FROM yetkiler WHERE id = :id ", array("id" => $id));
                            if ($tweet->rowCount > 0):
                                $Utilities->delete("yetkiler", array("id" => $id));
                                echo "<script>alert('islem Silindi!');window.location.assign('adminYetki');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('adminYetki') . "';window.close();</script>";
                            else:
                                echo "<script>alert('islem Bulunamadı!');window.location.assign('adminYetki');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('adminYetki') . "';window.close();</script>";
                            endif;
							 echo "<script>window.location.assign('adminYetki');</script>";	
                            $redirect = base_url("adminYetki");
                            break;	
							}else {
								 echo "<script>window.location.assign('adminYetki');</script>";	
							$redirect = base_url("adminYetki");	
							break;
							}
						case "Favori.php_sil":
                            $id = $_GET["id"];
                            $tweet = $Utilities->query("SELECT * FROM anasayfaFav WHERE id = :id and kullanici = :kullanici", array("id" => $id, "kullanici" => $_SESSION['user']));
                            if ($tweet->rowCount > 0):
                                $Utilities->delete("anasayfaFav", array("id" => $id));
                                echo "<script>alert('islem Silindi!');window.location.assign('Favori.php');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('Favori') . "';window.close();</script>";
                            else:
                                echo "<script>alert('islem Bulunamadı!');window.location.assign('Favori.php');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('Favori') . "';window.close();</script>";
                            endif;
                            $redirect = base_url("Favori");
                            break;	
						case "otomatikHashtag.php_sil":
                            $id = $_GET["id"];
                            $tweet = $Utilities->query("SELECT * FROM hashtag WHERE id = :id and kullanici = :kullanici", array("id" => $id, "kullanici" => $_SESSION['user']));
                            if ($tweet->rowCount > 0):
                                $Utilities->delete("hashtag", array("id" => $id));
                                echo "<script>alert('islem Silindi!');window.location.assign('otomatikHashtag.php');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('otomatikHashtag') . "';window.close();</script>";
                            else:
                                echo "<script>alert('islem Bulunamadı!');window.location.assign('hesapYukle.php');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('otomatikHashtag') . "';window.close();</script>";
                            endif;
                            $redirect = base_url("otomatikHashtag");
                            break;	
						case "otomatikReklam.php_sil":
                            $id = $_GET["id"];
                            $tweet = $Utilities->query("SELECT * FROM mention WHERE id = :id and kullanici = :kullanici", array("id" => $id, "kullanici" => $_SESSION['user']));
                            if ($tweet->rowCount > 0):
                                $Utilities->delete("mention", array("id" => $id));
                                echo "<script>alert('islem Silindi!');window.location.assign('otomatikReklam.php');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('otomatikReklam') . "';window.close();</script>";
                            else:
                                echo "<script>alert('islem Bulunamadı!');window.location.assign('otomatikReklam.php');</script>";
								echo "<script type=\"text/javascript\">window.opener.location.href='" . base_url('otomatikReklam') . "';window.close();</script>";
                            endif;
                            $redirect = base_url("otomatikReklam");
                            break;		
                        default:
                            break;
                    endswitch;
                    if ($redirect):
                        yonlendir($redirect);
                    endif;
                }
            } elseif ($base_name != "login.php") {
                yonlendir(base_url("login"));
            }
        }
        function IsAuthenticated() {
            return isset($_SESSION["giris"]);
        }
    }
    function get_option($field = NULL) {
        global $ayarlar, $Utilities;
        if (!isset($ayarlar)) {
            $ayarlar = $Utilities->query("SELECT * FROM uyelikler where username = :username", array("username" => $_SESSION['user']));
            if ($ayarlar->rowCount == 0)
                exit("Ayarlar yüklenmedi!");
            $ayarlar = $ayarlar->fetch;
            if (isset($ayarlar)) {
                if (!empty($field)) {
                    return $ayarlar->{$field};
                }
                return $ayarlar;
            } else {
                return FALSE;
            }
        } else if (isset($ayarlar)) {
            if (!empty($field)) {
                return $ayarlar->{$field};
            }
            return $ayarlar;
        }
        return FALSE;
    }
	    function get_token($field = NULL) {
        global $ayarlar, $Utilities;
        if (!isset($ayarlar)) {
            $ayarlar = $Utilities->query("SELECT * FROM ayarlar where id = :id", array("id" => 1));
            if ($ayarlar->rowCount == 0)
                exit("Token yüklenmedi!");
            $ayarlar = $ayarlar->fetch;
            if (isset($ayarlar)) {
                if (!empty($field)) {
                    return $ayarlar->{$field};
                }
                return $ayarlar;
            } else {
                return FALSE;
            }
        } else if (isset($ayarlar)) {
            if (!empty($field)) {
                return $ayarlar->{$field};
            }
            return $ayarlar;
        }
        return FALSE;
    }
    function info_message($msg = null) {
        if (empty($msg)) {
            $__result = @$_SESSION['result'];
            unset($_SESSION['result']);
            return $__result;
        } else {
            $_SESSION['result'] = $msg;
        }
    }
    function is_url($l) {
        $script_name = str_replace("/", "\\", $_SERVER["SCRIPT_FILENAME"]);
        $script_name = str_replace("\\", "/", str_replace(realpath(dirname(__FILE__)), "", $script_name));
        $scr = pathinfo($script_name);
        $url = $scr["basename"] . (isset($_GET["do"]) ? "_" . $_GET["do"] : "");
        return ($url == $l ? true : false);
    }
    function yonlendir($url) {
        if (!headers_sent()) {
             @ob_clean();
            header("Location: " . $url, true, 302);
            exit;
        } else {
            echo "<meta http-equiv=\"refresh\" content=\"0;URL={$url}\">";
            exit;
        }
    }
    function is_url_active($l) {
        return (is_url($l) ? 'active' : "");
    }
	function twitter_get($url) {
        $ch = curl_init();
        curl_setopt_array($ch, array(
            CURLOPT_URL => $url,
            CURLOPT_SSL_VERIFYHOST => FALSE,
            CURLOPT_SSL_VERIFYPEER => FALSE,
            CURLOPT_USERAGENT => "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36",
            CURLOPT_HEADER => FALSE,
            CURLOPT_RETURNTRANSFER => TRUE,
            CURLOPT_FOLLOWLOCATION => TRUE,
            CURLOPT_MAXREDIRS => 5
        ));
        $exec = curl_exec($ch);
        curl_close($ch);
        unset($ch);
        return $exec;
    }
	function is_url_activeopen($l) {
        return (is_url($l) ? 'active open' : "");
    }
    function get_header() {
        global $Utilities, $ayarlar, $main;
        include('sayfalar/header.php');
    }
    function get_footer() {
        global $Utilities, $ayarlar, $main;
        include 'sayfalar/footer.php';
    }
    function base_url($url = "") {
        return $GLOBALS["BASE_URL"] . $url;
    }

?>