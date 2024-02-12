<?php 
require_once('pages-config.php');

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
$huruf = "JRNL";
$kode = $huruf . sprintf("%010s", $urutan);


if (isset($_POST['simpan_presensi'])) {

	if ( (empty($_POST['id_rombel'])) || (empty($_POST['kode_mapel'])) || (empty($_POST['hari_dantgl'])) || (empty($_POST['time_mulai'])) || (empty($_POST['time_akhir'])) ) {
		echo "<script>
		alert('DATA BELUM TERSIMPAN, PASTIKAN SEMUA FORM SUDAH TERISI!');
		document.location.href = 'index.php';
		</script>";

	}else{


		$id_rombel = $_POST['id_rombel'];
		$id_user = $_POST['id_user'];
		$kode_mapel = $_POST['kode_mapel'];
		$hari_dantgl = $_POST['hari_dantgl'];
		$time_mulai = $_POST['time_mulai'];
		$time_akhir = $_POST['time_akhir'];

		$id_siswa = $_POST['id_siswa'];
		$Radios = $_POST['gridRadios'];

		$array = array_count_values($Radios);

		$count = count($id_siswa);
		
		for ($i=1; $i < $count; $i++) { 
			$kehadiran = $Radios[$i];
			$query1 = mysqli_query($koneksi, "insert into tb_jurnal_siswa(id_jurnal_siswa, id_jurnal, id_siswa, kehadiran) values('','".$kode."','".$id_siswa[$i]."','".$kehadiran."')");
		}


		//mengetahui jumlah hadir
		if (isset($array['hadir']) == true) {
			$hadir = $array['hadir'];
		}else if(isset($array['hadir']) == false){
			$hadir = 0;
		}

		//mengetahui jumlah alpa
		if (isset($array['alpa']) == true) {
			$alpa = $array['alpa'];
		}else if(isset($array['alpa']) == false){
			$alpa = 0;
		}

		//mengetahui jumlah ijin
		if (isset($array['ijin']) == true) {
			$ijin = $array['ijin'];
		}else if (isset($array['ijin']) == false) {
			$ijin = 0;
		}

		//mengetahui jumlah sakit
		if (isset($array['sakit']) == true) {
			$sakit = $array['sakit'];
		}else if (isset($array['sakit']) == false) {
			$sakit = 0;
		}

		//insert tb_jurnal_kelas
		$query = mysqli_query($koneksi, "insert into tb_jurnal_kelas(id_jurnal, id_rombel, id_user, kode_mapel, hari_dantgl, time_mulai, time_akhir, hadir, alpa, ijin, sakit, jumlah) values('".$kode."','".$id_rombel."','".$id_user."','".$kode_mapel."','".$hari_dantgl."','".$time_mulai."','".$time_akhir."','".$hadir."','".$alpa."','".$ijin."','".$sakit."','".$count."')");

		if ($query && $query1) {
			echo "<script>
			alert('DATA BERHASIL DISIMPAN');
			document.location.href = 'index.php?page=jurnal_guru';
			</script>";
		}
	
	}
}

?>