<div class="text-end">
<?=setGoBack("view_popular_searches.php") ?>
</div>

<form id="crud_form_course" action="add_popular_searches.php" method="post" enctype="multipart/form-data">
<input type="hidden" name="action_perfom" value="add_course">

<table class="table table-sm table-borderless w-auto fs-9">

<tr>
	<td class="align-middle">Keyword</td>
	<td>
		<input type="text" name="popular_search_description" placeholder="Search Keyword" class="form-control form-control-sm m-1" style="width:200px;" required>
	</td>
</tr>

<tr>
	<td class="align-middle">Display Image</td>
	<td>
		<input type="file" name="display_image" class="form-control form-control-sm m-1" accept="image/*" style="width:200px;" required>
	</td>
</tr>

<tr>
	<td colspan="2" align="center">
		<input type="submit" value="Add Popular Search Keyword" class="btn btn-sm btn-primary rounded m-1">
	</td>
</tr>

</table>
</form>