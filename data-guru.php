<div class="row">
	<!-- Recent Sales -->
	<div class="col-12">
	  <div class="card recent-sales overflow-auto">

	    <div class="filter">
	      <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
	      <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
	        <li class="dropdown-header text-start">
	          <h6>Select Option</h6>
	        </li>

	        <li><a class="dropdown-item" href="#">Tambah Guru</a></li>
	      </ul>
	    </div>

	    <div class="card-body">
	      <h5 class="card-title">Data Guru <span>| Today</span></h5>

	      <table class="table table-borderless table-striped datatable">
	        <thead>
	          <tr>
	            <th scope="col">ID User</th>
	            <th scope="col">NIPY</th>
	            <th scope="col">Nama Depan</th>
	            <th scope="col">Nama Belakang</th>
	            <th scope="col">Detail</th>
	          </tr>
	        </thead>
	        <tbody>
        	<?php 
        	$query = mysqli_query($koneksi, "select * from tb_user");
        	$no=1;
        	while ($data = mysqli_fetch_array($query)) { ?>
        		<tr>
        			<td><?= $data['id_user']; ?></td>
        			<td><?= $data['nipy']; ?></td>
        			<td><?= $data['nama_depan']; ?></td>
        			<td><?= $data['nama_lengkap']; ?></td>
        			<td><a href="#" class="text-primary btn btn-light"></a></td>
        		</tr>
        	<?php }
        	?>
	        </tbody>
	      </table>

	    </div>

	  </div>
	</div><!-- End Recent Sales -->
</div>