<?php
if(isset($_REQUEST['chat_with']) && $_REQUEST['chat_with'])
{
    //if(substr($_REQUEST['chat_with'],0,2) == 'BS')
        $chat_with_name = "LMS Chat Support";
        $chatEndBtn = "<a class='btn btn-sm btn-outline-danger p-1' href='endChat.php' title='Leave OR End Chat'>End/Leave</a>";
?>

<div class="container mb-5" style="width:700px;">
    <div class="card">
        <div class="card-header p-2 p-md-3 d-flex flex-between-center">
            <h5><?=$chat_with_name?></h5>
            <div class="d-flex gap-2 align-items-center" style="height:30px;">
            <button type="button" id="btn_bottom" onClick="getChatMessages()" class="btn btn-sm btn-subtle-secondary rounded-circle p-2"  style="display:none;">
            <span data-feather="chevrons-down" style="height: 15px; width: 15px;"></span>
            </button>
            <?=$chatEndBtn?>
            </div>
        </div>
        
        <div id="chatMessages" class="card-body p-3 p-sm-4 scrollbar chat-content-body-0" style="height:390px;">
        </div>

        <div class="card-footer p-2">
            <form id="chat_form" method="post" ecntype="multipart/form-data">
            <div>    
            <textarea name="chat_msg" id="chat_msg" class="form-control form-control-sm border border-0" placeholder="Enter Message" required></textarea>
            <div class="d-flex mt-3 justify-content-end">
            <div class="m-1 d-flex">
                <label class="btn btn-link py-0 px-2 text-body fs-7" for="chatPhotos">
                <span class="fa-solid fa-image text-warning"></span>
                </label>
                <input class="form-control form-control-sm" type="file" accept="image/*" id="chatPhotos" style="width:200px;">
                <!--<label class="btn btn-link py-0 px-2 text-body fs-7" for="chatAttachment">
                <span class="fa-solid fa-paperclip text-primary"></span>
                </label>
                <input class="d-none" type="file" id="chatAttachment">-->
            </div>
            <button type="button" id="sendBtn" onClick="createChatRecord()" class="btn btn-sm btn-success m-1">Send
            <span class="text-light" data-feather="send" style="height: 15px; width: 15px;"></span>
            </button>
            </div>
            </div>
            <input type="hidden" name="logged_user" value="<?=$_SESSION['user_ref_id']?>">
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