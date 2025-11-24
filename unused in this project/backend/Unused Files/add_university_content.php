<form method="post">
<div class="container m-1">
	<input type="hidden" name="action_perfom" value="add_country">
	<input type="text" class="form-control m-1" style="width:200px;" name="university_name" placeholder="University Name" required>
	<input type="text" class="form-control m-1" style="width:200px;" name="region" placeholder="Region" required>
	<select name="country" class="form-select m-1" style="width:200px;" required>
	<option value=''>Country</option>
	<?php
		$view_query = "SELECT * FROM country_list";
		$view_result = mysqli_query($con, $view_query);

		while($country = mysqli_fetch_assoc($view_result))
		{
			echo "<option value='".$country['id']."'>".strtoupper($country['name'])."</option>";
		}
	?>
	</select>
	<div class="d-flex justify-content-center mt-3" style="width:200px;">
	<input type="submit" class="btn btn-sm btn-primary" value="Add University">
	</div>
</div>
</form>

<?php include_once("footer_copyright.php"); ?>