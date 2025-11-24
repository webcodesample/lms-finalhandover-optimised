<?php
$pen_tool_display = "d-none";
$right_margin = "right:-45px;";

if($modification_possible_flag == 1 && $urn_using_by_me == 1)
{
	$pen_tool_display = "";
	$right_margin = "right:-65px;";
}
?>
<div class="d-flex justify-content-end position-fixed" style="transform: rotate(90deg); top:160px; <?=$right_margin?>">
<a href="#emailList" title="All Emails" class="btn btn-sm btn-subtle-warning px-2 py-1 fs-10 text-decoration-none mx-1">
<span data-feather="mail"></span>
</a>
<a href="#callList" title="All Calls" class="btn btn-sm btn-subtle-primary px-2 py-1 fs-10 text-decoration-none mx-1">
<span data-feather="phone-call"></span>
</a>
<a href="#callbackList" title="All Callbacks" class="btn btn-sm btn-subtle-danger px-2 py-1 fs-10 text-decoration-none mx-1">
<span data-feather="phone"></span>
</a>
<a title="Add Call History" class="btn btn-sm btn-subtle-success px-2 py-1 fs-10 text-decoration-none mx-1 <?=$pen_tool_display?>" data-bs-target="#urnCallHistory" data-bs-toggle="modal">
<span data-feather="pen-tool"></span>
</a>
</div>
<?php
include_once("urn_call_list.php");
include_once("urn_emails.php");
include_once("urn_callback_list.php");
include_once("../modal_boxes/communication/urn_call_history_modal.php");
?>