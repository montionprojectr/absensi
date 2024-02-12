<?php 
require_once('pages-config.php');

echo "<option value=''>Pilih Rombel</option>";

$id_kelas = $_POST['id_kelas'];

$query = mysqli_query($koneksi, "SELECT id_rombel, x.id_kelas, name_kelas, x.id_jurusan, name_jurusan, rombel, CONCAT_WS(' - ', name_kelas, singkat_jurusan, rombel) AS kelas 
FROM tb_kel_jur_rombel X 
INNER JOIN tb_kelas Y ON y.id_kelas = x.id_kelas
INNER JOIN tb_jurusan z ON z.id_jurusan = x.id_jurusan
WHERE x.id_kelas = '".$id_kelas."'");
while ($data = mysqli_fetch_array($query)) {
	echo "<option value='".$data['id_rombel']."'>".$data['kelas']."</option>";
}
?>