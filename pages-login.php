<?php 
session_start();
require_once('pages-config.php');

if (isset($_SESSION['login'])) {
    header("Location: index.php");
    exit();
}

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

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logosp1.jpg" alt="">
                  <span class="d-none d-lg-block">Absensi SMK Sapra1</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Masuk Akun</h5>
                    <p class="text-center small">Input username dan password</p>
                  </div>

                  <form class="row g-3 needs-validation" action="" method="POST" novalidate>

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Username</label>
                      <div class="input-group has-validation">
                        <span class="input-group-text" id="inputGroupPrepend">NIPY</span>
                        <input type="text" name="username" class="form-control" id="yourUsername" required>
                        <div class="invalid-feedback">Please enter your username.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Password</label>
                      <input type="password" name="password" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>

                    <div class="col-12">
                      
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit" name="login">Login</button>
                    </div>
                  </form>

                </div>
              </div>
              <?php 
              if (isset($_POST['login'])) {
                $username = $_POST['username'];
                $password = $_POST['password'];

                $query = mysqli_query($koneksi, "select * from tb_user where username = '".$username."' and password = '".$password."'");
                $result = mysqli_num_rows($query);
                if ($result > 0) {
                  $data = mysqli_fetch_array($query);
                  $cek = mysqli_query($koneksi, "select * from tb_rolsuser where id_user = '".$data['id_user']."'");
                  $rol = mysqli_fetch_array($cek);
                  $lv = mysqli_query($koneksi, "select * from tb_leveluser where id_level = '".$rol['id_level']."'");
                  $dlv = mysqli_fetch_array($lv);

                  if ($rol['id_level'] == '1') {
                    $_SESSION['name_level'] = $dlv['name_level'];
                    $_SESSION['id_user'] = $data['id_user'];
                    $_SESSION['login'] = 'login';
                      echo "<script>
                    alert('Anda login ke halaman admin.');
                    document.location.href = 'pages-admin.php';
                    </script>";
                  }else if($rol['id_level'] == '2'){
                    $_SESSION['name_level'] = $dlv['name_level'];
                    $_SESSION['id_user'] = $data['id_user'];
                    $_SESSION['login'] = 'login';
                    echo "<script>
                    alert('Anda login ke halaman guru.');
                    document.location.href = 'index.php';
                    </script>";
                  }
                  
                }else{
                  echo "<script>
                    alert('Maaf data akun tidak ada di database.');
                    document.location.href = 'index.php';
                    </script>";
                }

                // if ($username == 'admin' && $password == 'admin') {
                //   echo "<script>
                //     alert('Salamat Login anda berhasil.');
                //     document.location.href = 'index.php';
                //     </script>";
                //   }
              }
              ?>
              <div class="credits">
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
                Designed by <a href="">Montionprojectr</a>
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

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

</body>

</html>