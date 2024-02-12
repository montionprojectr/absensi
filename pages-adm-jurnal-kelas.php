<div class="col-lg-12">

  <div class="card">
    <div class="card-body">
      <h5 class="card-title">LAPORAN JURNAL KELAS</h5>
      
      <div class="row">
        <div class="col-sm-12">
          <div class="row">
            <div class="col-sm-4">
              <select class="form-select" aria-label="Default select example" id="id_kelas">
                <option value="">Pilih Kelas</option>
                <?php 
                $sql_kelas = mysqli_query($koneksi, "select * from tb_kelas");
                while ($dtkel = mysqli_fetch_array($sql_kelas)) { ?>
                  <option value="<?= $dtkel['id_kelas']; ?>">KELAS - <?= $dtkel['name_kelas']; ?></option>
                <?php }
                ?>
              </select>
            </div>
            <div class="col-sm-4">
              <select class="form-select" aria-label="Default select example" id="id_rombel">
                <option value="">Pilih Rombel</option>
                <!-- Tampilan dari pages-adm-jurnal-dkelas.php -->
              </select>
            </div>
            <div class="col-sm-4">
              <input type="date" name="date" id="date_day" class="form-control">
            </div>
          </div>
        </div>
        <div class="col-sm-12 mt-3">
          <div id="data-jurnal">
            
          </div>
        </div>
      </div>

    </div>
  </div>

</div>