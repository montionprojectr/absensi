<?php 
require_once("pages-config.php");

// mengambil data barang dengan kode paling besar
$query = mysqli_query($koneksi, "SELECT max(id_jurnal) as kodeTerbesar FROM tb_jurnal_kelas");
$data = mysqli_fetch_array($query);
$kode = $data['kodeTerbesar'];

// mengambil angka dari kode barang terbesar, menggunakan fungsi substr
// dan diubah ke integer dengan (int)
$urutan = (int) substr($kode, 4, 10);

// bilangan yang diambil ini ditambah 1 untuk menentukan nomor urut berikutnya
$urutan++;

// membentuk kode barang baru
// perintah sprintf("%03s", $urutan); berguna untuk membuat string menjadi 3 karakter
// misalnya perintah sprintf("%03s", 15); maka akan menghasilkan '015'
// angka yang diambil tadi digabungkan dengan kode huruf yang kita inginkan, misalnya BRG 
$huruf = "JRNL";
$kode = $huruf . sprintf("%010s", $urutan);

echo $kode;

?>