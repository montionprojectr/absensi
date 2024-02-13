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

	        <li><a class="dropdown-item" href="#">Tambah Jurusan</a></li>
	      </ul>
	    </div>

	    <div class="card-body">
	      <h5 class="card-title">Data Jurusan <span>| Today</span></h5>

	      <table class="table table-borderless table-striped datatable">
	        <thead>
	          <tr>
	            <th scope="col">#</th>
	            <th scope="col">ID Jurusan</th>
	            <th scope="col">Name Jurusan</th>
	            <th scope="col">Singkat Jurusan</th>
	          </tr>
	        </thead>
	        <tbody>
        	<?php 
        	$query = mysqli_query($koneksi, "select * from tb_jurusan");
        	$no=1;
        	while ($data = mysqli_fetch_array($query)) { ?>
        		<tr>
        			<td><?= $no++; ?></td>
        			<td><?= $data['id_jurusan']; ?></td>
        			<td><?= $data['name_jurusan']; ?></td>
        			<td><?= $data['singkat_jurusan']; ?></td>
        		</tr>
        	<?php }
        	?>
	        </tbody>
	      </table>

	    </div>

	  </div>
	</div><!-- End Recent Sales -->
</div>