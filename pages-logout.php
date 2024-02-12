<?php 
session_start();
unset($_SESSION['login']);
// unset($_SESSION['nama_lengkap']);
//atau
session_destroy();

header("location: index.php");
?>