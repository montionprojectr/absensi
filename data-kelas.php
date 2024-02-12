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
	      <h5 class="card-title">Data Kelas <span>| Today</span></h5>

	      <table class="table table-borderless table-striped datatable">
	        <thead>
	          <tr>
	            <th scope="col">ID Rombel</th>
	            <th scope="col">Kelas</th>
	            <th scope="col">Jurusan</th>
	            <th scope="col">Rombel</th>
	            <th scope="col">Status Kelas</th>
	          </tr>
	        </thead>
	        <tbody>
        	<?php 
        	$query = mysqli_query($koneksi, "select id_rombel, x.id_kelas, name_kelas, x.id_jurusan, name_jurusan, rombel, concat_ws('-', name_kelas, singkat_jurusan, rombel) as kelas from tb_kel_jur_rombel x inner join tb_kelas y on y.id_kelas = x.id_kelas inner join tb_jurusan z on z.id_jurusan = x.id_jurusan");
        	$no=1;
        	while ($data = mysqli_fetch_array($query)) { ?>
        		<tr>
        			<td><?= $data['id_rombel']; ?></td>
        			<td><?= $data['name_kelas']; ?></td>
        			<td><?= $data['name_jurusan']; ?></td>
        			<td><?= $data['rombel']; ?></td>
        			<td><a href="?page=r-kelas&idrm=<?= $data['id_rombel']; ?>" class="text-primary btn btn-light"><?= $data['kelas']; ?></a></td>
        		</tr>
        	<?php }
        	?>
	        </tbody>
	      </table>

	    </div>

	  </div>
	</div><!-- End Recent Sales -->
</div>