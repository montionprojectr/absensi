<?php 
session_start();
require_once('pages-config.php');

if (isset($_SESSION['login']) != "login") {
  header("Location: pages-login.php");
  exit();
}

$query = mysqli_query($koneksi, "select * from tb_user where id_user = '".$_SESSION['id_user']."'");
$user = mysqli_fetch_array($query);
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>ABSENSI SAPRA1</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/logosp1.jpg" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Jan 09 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/logosp1.jpg" alt="">
        <span class="d-none d-lg-block">ABSENSI SAPRA1</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->
        
        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2"><?= $user['nama_depan']; ?></span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6><?= $user['nama_depan']; ?></h6>
              <span><?= $_SESSION['name_level']; ?></span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <!-- <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li> -->

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-logout.php">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link" href="pages-admin.php">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="bi bi-gear-fill"></i>
          <span>Setelan</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-pencil-square"></i><span>Input Data</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="?page=data-kelas">
              <i class="bi bi-circle"></i><span>Data Kelas</span>
            </a>
          </li>
          <li>
            <a href="?page=data-jurusan">
              <i class="bi bi-circle"></i><span>Data Jurusan</span>
            </a>
          </li>
          <li>
            <a href="?page=data-mapel">
              <i class="bi bi-circle"></i><span>Data Mapel</span>
            </a>
          </li>
          <li>
            <a href="?page=data-guru">
              <i class="bi bi-circle"></i><span>Data Guru</span>
            </a>
          </li>
          <li>
            <a href="?page=data-siswa">
              <i class="bi bi-circle"></i><span>Data Siswa</span>
            </a>
          </li>
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>Laporan Jurnal</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="?page=jurnal-kelas">
              <i class="bi bi-circle"></i><span>Jurnal Kelas</span>
            </a>
          </li>
          <li>
            <a href="?page=jurnal-siswa">
              <i class="bi bi-circle"></i><span>Jurnal Siswa</span>
            </a>
          </li>
          <li>
            <a href="?page=jurnal-guru">
              <i class="bi bi-circle"></i><span>Jurnal Guru</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->
    </ul>

  </aside><!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">
        <?php 
        if (isset($_GET['page'])) {
          $pages = $_GET['page'];
          switch ($pages) {
            case 'data-kelas':
              require_once('data-kelas.php');
              break;
            case 'r-kelas':
              require_once('data-kelas-r.php');
              break;
            case 'data-jurusan':
              require_once('data-jurusan.php');
              break;
            case 'data-mapel':
              require_once('data-mapel.php');
              break;
            case 'data-guru':
              require_once('data-guru.php');
              break;
            case 'data-siswa':
              require_once('data-siswa.php');
              break;
            case 'jurnal-kelas':
              require_once('pages-adm-jurnal-kelas.php');
              break;
            case 'jurnal-siswa':
              require_once('pages-jurnal-siswa.php');
              break;
            
            default:
              require_once('pages-adm-default.php');
              break;
          }
        }else{
          require_once('pages-adm-home.php');
        }
        ?>

      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>SMK SATYA PRAJA 1 PETARUKAN</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="#">Montionprojectr</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  <script src="assets/js/jquery-3.7.1.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
    // $.ajax({
    //     type: 'POST',
    //     url: "data-kelas-r.php",
    //     cache: false, 
    //     success: function(msg){
    //       $("#contoh").html(msg);
    //     }
    // });

    $("#id_kelas").change(function(){
    var id_kelas = $("#id_kelas").val();
      $.ajax({
        type: 'POST',
          url: "pages-adm-jurnal-dkelasa.php",
          data: {id_kelas: id_kelas},
          cache: false,
          success: function(msg){
            $("#id_rombel").html(msg);
          }
      });
    });

    $("#id_rombel, #date_day").change(function(){
    var id_rombel = $("#id_rombel").val();
    var date_day = $("#date_day").val();
      $.ajax({
        type: 'POST',
          url: "pages-adm-jurnal-dkelasb.php",
          data: {id_rombel: id_rombel, date_day: date_day},
          cache: false,
          success: function(msg){
            $("#data-jurnal").html(msg);
          }
      });
    });
 
  });
</script>

</body>

</html>