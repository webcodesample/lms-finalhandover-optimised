<div class="text-end">
<?=setGoBack("view_popular_searches.php") ?>
</div>

<form id="crud_form_subject" method="post">
<input type="hidden" name="id" value="<?=$_REQUEST['id']?>">
<input type="hidden" name="action_perform" value="update_search_keyword">

<table class="table table-sm table-borderless w-auto fs-9">

<tr>
	<td class="align-middle">Keyword</td>
	<td>
	<input type="text" name="popular_search_description" placeholder="Search Keyword" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$search_keyword['description']?>" required>
	</td>
</tr>

<tr>
	<td colspan="2" align="center">
	<input type="submit" value="Update Popular Search Keyword" class="btn btn-sm btn-primary m-1">
	</td>
</tr>

</table>

	
</form>

<?php include_once("footer_copyright.php") ?>