<div class="d-flex justify-content-end">
<?php setGoBack("university_list.php"); ?>
</div>

<?=$action_perform_msg?>
<form method="post">
	<input type="hidden" name="action_perfom" value="edit_university">
	<input type="text" class="form-control m-1" style="width:250px;" name="university_name" placeholder="University Name" required value="<?=$university['name']?>">
	<input type="text" class="form-control m-1" style="width:250px;" name="region" placeholder="Region" required value="<?=$university['region']?>">
	<select class="form-select m-1" style="width:250px;" name="country" required>
	<option value=''>Country</option>
	<?php
		$view_query = "SELECT * FROM country_list";
		$view_result = mysqli_query($con, $view_query);

		while($country = mysqli_fetch_assoc($view_result))
		{
			if($country['id'] == $university['country_id'])
			echo "<option value='".$country['id']."' selected='selected'>".strtoupper($country['name'])."</option>";
			else
			echo "<option value='".$country['id']."'>".strtoupper($country['name'])."</option>";
		}
	?>
	</select>
	<div class="d-flex justify-content-center mt-5" style="width:250px;">
	<input type="submit" value="Update University" class="btn btn-sm btn-primary">
	</div>
</form>