<?php
if(isset($_REQUEST['chat_with']) && $_REQUEST['chat_with'])
{
    if(substr($_REQUEST['chat_with'],0,2) == 'BS')
        $chat_with_name = getFieldValue('name','id',substr($_REQUEST['chat_with'],2),'staff_list',$con);
    else if(substr($_REQUEST['chat_with'],0,2) == 'SP')
        $chat_with_name = getFieldValue('name','id',substr($_REQUEST['chat_with'],2),'sales_person_list',$con);
    else if(substr($_REQUEST['chat_with'],0,2) == 'SA')
        $chat_with_name = getFieldValue('name','id',substr($_REQUEST['chat_with'],2),'agent_list',$con);
    else if(substr($_REQUEST['chat_with'],0,2) == 'ST')
        $chat_with_name = getFieldValue('name','id',substr($_REQUEST['chat_with'],2),'students',$con);
?>

<div class="container mb-5" style="width:700px;">

<div class="card">

<div class="card-header p-2 p-md-3 d-flex flex-between-center">
    <div class="d-flex align-items-center">
    <div class="d-flex flex-column flex-md-row align-items-md-center">
        <button class="btn fs-7 fw-semibold text-body-emphasis d-flex align-items-center p-0 me-3 text-start" data-phoenix-toggle="offcanvas" data-phoenix-target="#thread-details-0"><span class="line-clamp-1"><?=$chat_with_name?></span></button>
        <p class="fs-9 mb-0 me-2"> <span class="fa-solid fa-circle text-success fs-11 me-2"></span>Online</p>
    </div>
    </div>
    <div class="d-flex" style="height:30px;">
    <button type="button" id="btn_bottom" onClick="getChatMessages()" class="btn btn-sm btn-subtle-secondary rounded-circle p-2"  style="display:none;">
    <span data-feather="chevrons-down" style="height: 15px; width: 15px;"></span>
    </button>    
    </div>
</div>

<div id="chatMessages" class="card-body p-3 p-sm-4 scrollbar chat-content-body-0" style="height:390px;">
</div>

<div class="card-footer p-2">
    <form id="chat_form" method="post" ecntype="multipart/form-data">
    <div>    
    <textarea name="chat_msg" id="chat_msg" class="form-control form-control-sm border border-0" placeholder="Enter Message" required></textarea>
    <div class="d-flex mt-3 justify-content-end">
    <div class="mt-2">
        <label class="btn btn-link py-0 px-2 text-body fs-7" for="chatPhotos">
        <span class="fa-solid fa-image text-warning"></span>
        </label>
        <input class="d-none" type="file" accept="image/*" id="chatPhotos">
        <label class="btn btn-link py-0 px-2 text-body fs-7" for="chatAttachment">
        <span class="fa-solid fa-paperclip text-primary"></span>
        </label>
        <input class="d-none" type="file" id="chatAttachment">
    </div>
    <button type="button" onClick="createChatRecord()" class="btn btn-sm btn-success m-1">Send
    <span class="text-light" data-feather="send" style="height: 15px; width: 15px;"></span>
    </button>
    </div>
    </div>
    <input type="hidden" name="logged_user" value="<?=$_SESSION['staff_ref_id']?>">
    <input type="hidden" name="chat_with" value="<?=$_REQUEST['chat_with']?>">
    </form>
</div>

</div>

</div>


<?php
include_once("../common/auto_refresh_chat_list.php");
}
?>

<?php include_once("footer_copyright.php"); ?>