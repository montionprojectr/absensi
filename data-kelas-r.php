<div class="row">
	<!-- Recent Sales -->
	<div class="col-12">
	  <div class="card recent-sales overflow-auto">

	    <div class="filter">
	      <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
	      <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
	        <li class="dropdown-header text-start">
	          <h6>Filter</h6>
	        </li>

	        <li><a class="dropdown-item" href="#">Today</a></li>
	        <li><a class="dropdown-item" href="#">This Month</a></li>
	        <li><a class="dropdown-item" href="#">This Year</a></li>
	      </ul>
	    </div>

	    <div class="card-body">
	      <h5 class="card-title">Data Siswa <span>| Today</span></h5>

	      <table class="table table-borderless table-striped datatable">
	        <thead>
	          <tr>
	          	<th scope="col">No</th>
	            <th scope="col">ID Siswa</th>
	            <th scope="col">NIS</th>
	            <th scope="col">NISN</th>
	            <th scope="col">NAMA</th>
	            <th scope="col">IDROMBEL</th>
	            <th scope="col">KELAS</th>
	          </tr>
	        </thead>
	        <tbody>
        	<?php 
        	$query = mysqli_query($koneksi, "select id_siswa, nis, nisn, name_siswa, w.id_rombel, concat_ws('-', name_kelas, singkat_jurusan, rombel) as kelas from tb_siswa w inner join tb_kel_jur_rombel x on x.id_rombel = w.id_rombel inner join tb_kelas y on y.id_kelas = x.id_kelas inner join tb_jurusan z on z.id_jurusan = x.id_jurusan where w.id_rombel = '".$_GET['idrm']."'");
        	$no=1;
        	while ($data = mysqli_fetch_array($query)) { ?>
        		<tr>
        			<td><?= $no++; ?></td>
        			<td><?= $data['id_siswa']; ?></td>
        			<td><?= $data['nis']; ?></td>
        			<td><?= $data['nisn']; ?></td>
        			<td><?= $data['name_siswa']; ?></td>
        			<td><?= $data['id_rombel']; ?></td>
        			<td><?= $data['kelas']; ?></td>
        		</tr>
        	<?php }
        	?>
	        </tbody>
	      </table>

	    </div>

	  </div>
	</div><!-- End Recent Sales -->
</div>