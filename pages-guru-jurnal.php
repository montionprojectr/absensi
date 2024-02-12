<div class="pagetitle">
  <h1>Laporan</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="index.html">Laporan</a></li>
      <li class="breadcrumb-item active">Jurnal</li>
    </ol>
  </nav>
</div><!-- End Page Title -->
<div class="col-sm-12">
  <div class="card">
    <div class="card-header">
      <h5 class="card-title">DATA JURNAL GURU</h5>
    </div>
    <div class="card-body">
      <table class="table table-borderless table-bordered table-striped datatable mt-3">
        <thead>
          <tr>
            <th>ID Jurnal</th>
            <th>Rombel</th>
            <th>Kode Mapel</th>
            <th>Nama Mapel</th>
            <th>Hari dan Tanggal</th>
            <th>Wkt Kehadiran</th>   
            <th>Hadir</th>
            <th>Alpa</th>
            <th>Ijin</th>
            <th>Sakit</th> 
          </tr>
        </thead>
          <?php 
          $query = mysqli_query($koneksi, "select * from tb_jurnal_kelas x inner join tb_user y on y.id_user = x.id_user inner join tb_mapel z on z.kode_mapel = x.kode_mapel where x.id_user = '".$user['id_user']."'");
          while ($data = mysqli_fetch_array($query)) { 
            $in = mysqli_query($koneksi, "select id_rombel, x.id_kelas, name_kelas, x.id_jurusan, name_jurusan, rombel, concat_ws(' - ', name_kelas, singkat_jurusan, rombel) as kelas from tb_kel_jur_rombel x inner join tb_kelas y on y.id_kelas = x.id_kelas inner join tb_jurusan z on z.id_jurusan = x.id_jurusan where id_rombel = '".$data['id_rombel']."'");
            $dt = mysqli_fetch_array($in);
            ?>
            <tr>
              <td><?= $data['id_jurnal']; ?></td>
              <td><?= $dt['kelas']; ?></td>
              <td><?= $data['kode_mapel'] ?></td>
              <td><?= $data['name_mapel'] ?></td>
              <td><?= $data['hari_dantgl'] ?></td>
              <td><?= $data['time_mulai']." - ".$data['time_akhir']; ?></td>
              <td><?= $data['hadir'] ?></td>
              <td><?= $data['alpa'] ?></td>
              <td><?= $data['ijin'] ?></td>
              <td><?= $data['sakit'] ?></td>
            </tr>
          <?php }
          ?>
        <tbody>
          
        </tbody>
      </table>
    </div>
  </div>
</div>