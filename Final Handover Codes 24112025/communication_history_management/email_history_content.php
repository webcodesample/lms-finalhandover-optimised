<?php 
	if(validateStaffAccessRight('emails',$con))
	{ 
?>
<div class="d-flex justify-content-between mb-2">
<h5>Email History</h5>
<span class="text-danger mx-1" data-feather="search" style="height: 25px; width: 25px; cursor:hand;" onClick="searchToggle()"></span>
</div>

<div id="search_form" class="d-flex justify-content-between mb-2 <?=$search_form_display_class?>">
<form method="post">
<div class="d-flex">
<input type="text" name="search_email_type" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Email Type" value="<?=$search_email_type?>" onBlur="setSearchFlag(this.value)">
<input type="text" name="search_email_subject" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Subject" value="<?=$search_email_subject?>" onBlur="setSearchFlag(this.value)">
<input type="text" name="search_sender" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Sender" value="<?=$search_sender?>" onBlur="setSearchFlag(this.value)">
<input type="text" name="search_recipient" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Recipient" value="<?=$search_recipient?>" onBlur="setSearchFlag(this.value)">
<input type="hidden" name="action_perform" value="search">
<input type="hidden" id="search_flag" value="0">
<button type="submit" onClick="return validateSearchForm()" class="btn btn-sm btn-subtle-danger m-1 px-2">
<span data-feather="search"></span>
</button>
<?=$clear_filter_btn?>
</div>
</form>
</div>

<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th nowrap>Date & Time</th>
<th>Type</th>
<th>Subject</th>
<th>Sender</th>
<th>Recipients</th>
</thead>

<?php
$i = 0;
while($email_history = mysqli_fetch_assoc($email_history_list))
{
	$i++;
	
	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td nowrap>".date('d-m-Y h:i:s A',$email_history['datentime'])."</td>
		<td>".$email_history['type']."</td>
		<td>".$email_history['subject']."</td>
		<td>".$email_history['sender']."</td>
		<td>".$email_history['recipients']."</td>
		</tr>";
}

//echo strtotime("now");
?>

<?php 
}
else
{
	setAccessDeniedMsg();
}
	include_once("footer_copyright.php");
?>