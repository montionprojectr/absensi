<!-- Left side columns -->
<div class="col-lg-8">
  <div class="card">
    <div class="card-body">
      <h2 class="card-title text-center">INPUT DATA ABSENSI</h2>

      <form action="proses-absensi.php" method="post">
        <div class="row mb-3">
          <label for="inputText" class="col-sm-2 col-form-label">Kelas / Rombel</label>
          <div class="col-sm-10">
            <select class="form-select" aria-label="Default select example" id="select-kelas" name="id_rombel" required>
              <option value="">Pilih Kelas / Rombel</option>
              <?php 
              $query = mysqli_query($koneksi, "select id_rombel, x.id_kelas, name_kelas, x.id_jurusan, name_jurusan, rombel, concat_ws('-', name_kelas, singkat_jurusan, rombel) as kelas from tb_kel_jur_rombel x inner join tb_kelas y on y.id_kelas = x.id_kelas inner join tb_jurusan z on z.id_jurusan = x.id_jurusan");
              $no=1;
              while ($data = mysqli_fetch_array($query)) {
              ?>
              <option value="<?= $data['id_rombel']; ?>"><?= $no++.", ".$data['kelas']; ?></option>
              <?php 
              }
              ?>
            </select>
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
          <label for="inputText" class="col-sm-2 col-form-label">Mata Pelajaran</label>
          <div class="col-sm-10">
            <select class="form-select" aria-label="Default select example" name="kode_mapel" required>
              <option value="">Pilih Mata Pelajaran</option>
              <?php 
              $query_mpl = mysqli_query($koneksi, "select * from tb_mapel");
              $no=1;
              while ($mpl = mysqli_fetch_array($query_mpl)) {
              ?>
              <option value="<?= $mpl['kode_mapel']; ?>"><?= $no++.", ".$mpl['name_mapel']; ?></option>
              <?php 
              }
              ?>
            </select>
          </div>
        </div>
        <div class="row mb-3">
          <label for="inputText" class="col-sm-2 col-form-label">Hari & Tgl</label>
          <div class="col-sm-10">
            <input type="date" class="form-control" name="hari_dantgl">
          </div>
        </div>
        <div class="row mb-3">
          <label for="inputText" class="col-sm-2 col-form-label">Waktu Kehadiran</label>
          <div class="col-sm-10">
            <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon1">Mulai</span>
              <input type="time" class="form-control" name="time_mulai" aria-describedby="basic-addon1">
            </div>
            <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon1">Akhir</span>
              <input type="time" class="form-control" name="time_akhir" aria-describedby="basic-addon1">
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-sm-12" id="data-siswa">
            <!-- Table data siswa berdasarkan kelas yang dipilih dari file pages-guru-dsiswa.php -->
          </div>
        </div>
      </form>
    </div>
  </div>
</div><!-- End Left side columns -->

<!-- Right side columns -->
<!-- <div class="col-lg-4">
  
</div> -->
<!-- End Right side columns -->