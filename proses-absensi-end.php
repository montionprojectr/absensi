<?php 
require_once('pages-config.php');

if (isset($_POST['simpan_presensi'])) {
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
		echo $id_siswa[$i].", ".$kehadiran."<br>";
	}

	if (isset($array['hadir']) == true) {
		$hadir = $array['hadir'];
	}else if(isset($array['hadir']) == false){
		$hadir = 0;
	}

	if (isset($array['alpa']) == true) {
		$alpa = $array['alpa'];
	}else if(isset($array['alpa']) == false){
		$alpa = 0;
	}

	if (isset($array['ijin']) == true) {
		$ijin = $array['ijin'];
	}else if (isset($array['ijin']) == false) {
		$ijin = 0;
	}

	if (isset($array['sakit']) == true) {
		$sakit = $array['sakit'];
	}else if (isset($array['sakit']) == false) {
		$sakit = 0;
	}

	$query = mysqli_query($koneksi, "insert into tb_jurnal_kelas(id_jurnal, id_rombel, id_user, kode_mapel, hari_dantgl, time_mulai, time_akhir, hadir, alpa, ijin, sakit, jumlah) values('','".$id_rombel."','".$id_user."','".$kode_mapel."','".$hari_dantgl."','".$time_mulai."','".$time_akhir."','".$hadir."','".$alpa."','".$ijin."','".$sakit."','".$count."')");

	?>
	<div class="card">
		<div class="card-header">
			<?php 
			if ($query) {
				echo "DATA BERHASIL DISIMPAN";
			}
			?>
		</div>
		<div class="card-body">
		<form>
			<div class="row mb-3 mt-3">
	          <label for="inputText" class="col-sm-2 col-form-label">ID Rombel</label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" name="id_rombel" value="<?= $id_rombel; ?>" readonly>
	          </div>
	        </div>
			<div class="row mb-3">
	          <label for="inputText" class="col-sm-2 col-form-label">Nama Guru</label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" name="name_lengkap" value="<?= $user['nama_lengkap']; ?>" readonly>
	            <input type="text" name="id_user" value="<?= $user['id_user'] ?>" hidden>
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label for="inputText" class="col-sm-2 col-form-label">Kode Mapel</label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" name="kode_mapel" value="<?= $kode_mapel; ?>" readonly>
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label for="inputText" class="col-sm-2 col-form-label">Hari & Tgl</label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" name="hari_dantgl" value="<?= $hari_dantgl; ?>" readonly>
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label for="inputText" class="col-sm-2 col-form-label">Waktu Kehadiran</label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" name="hari_dantgl" value="<?= $time_mulai." - ". $time_akhir; ?>" readonly>
	          </div>
	        </div>
	        <div class="row mb-3">
	        	<label for="inputText" class="col-sm-2 col-form-label">Jumlah Siswa</label>
	        	<div class="col-sm-10">
	        		<table class="table table-bordered table-striped table-hover">
	        			<tr>
	        				<th>Hadir</th>
	        				<th>Alpa</th>
	        				<th>Ijin</th>
	        				<th>Sakit</th>
	        				<th>Jumlah</th>
	        			</tr>
	        			<tr>
	        				<td>
        					<?= $hadir; ?>
	        				</td>
	        				<td>
	        				<?= $alpa; ?>
	        				</td>
	        				<td>
	        				<?= $ijin; ?>
	        				</td>
	        				<td>
	        				<?= $sakit; ?>
	        				</td>
	        				<td>
	        				<?php 
	        				echo count($id_siswa);
	        				?>
	        				</td>
	        			</tr>
	        		</table>
	        	</div>
	        </div>
		</form>
		</div>
	</div>
	<?php  }
?>