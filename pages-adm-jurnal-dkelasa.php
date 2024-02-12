<?php 
require_once('pages-config.php');

echo "<option value=''>Pilih Rombel</option>";

$id_kelas = $_POST['id_kelas'];

$query = mysqli_query($koneksi, "select id_rombel, x.id_kelas, name_kelas, x.id_jurusan, name_jurusan, rombel, concat_ws(' - ', name_kelas, singkat_jurusan, rombel) as kelas from tb_kel_jur_rombel x inner join tb_kelas y on y.id_kelas = x.id_kelas inner join tb_jurusan z on z.id_jurusan = x.id_jurusan where x.id_kelas = '".$id_kelas."'");
while ($data = mysqli_fetch_array($query)) {
	echo "<option value='".$data['id_rombel']."'>".$data['kelas']."</option>";
}
?>