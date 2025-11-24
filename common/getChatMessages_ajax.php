<?php
date_default_timezone_set("Asia/Calcutta");
include_once("set_con.php");

if(substr($_REQUEST['chat_with'],0,2) == 'CR')
$_REQUEST['logged_user'] = 'CS';

$query = "SELECT * FROM chat_history WHERE (sender_id = '".$_REQUEST['logged_user']."' AND receiver_id = '".$_REQUEST['chat_with']."') OR (receiver_id = '".$_REQUEST['logged_user']."' AND sender_id = '".$_REQUEST['chat_with']."') ORDER BY datentime";
$result = mysqli_query($con,$query);
$total_msg_count = mysqli_num_rows($result);

$chat_messages = "";

while($chat_list = mysqli_fetch_assoc($result))
{
    if($chat_list['message_type'])
    {
        list($width, $height) = getimagesize('../chat_files/images/'.$chat_list['message']);

        if($height >= 100)
            $height_value = "height='100px'";
        else
            $height_value = "";

        $msg = "<a href='../chat_files/images/".$chat_list['message']."' target='_blank'><img src='../chat_files/images/".$chat_list['message']."' ".$height_value."></a>";
    }
    else
        $msg = $chat_list['message'];


	if($chat_list['sender_id'] == $_REQUEST['logged_user'])
	$chat_messages .= "<div class='d-flex chat-message'>
                        <div class='d-flex mb-2 justify-content-end flex-1'>
                            <div class='w-75 w-xxl-50'>
                                <div class='d-flex flex-end-center hover-actions-trigger'>
                                    <div class='chat-message-content me-2'>
                                        <div class='mb-1 sent-message-content bg-success-subtle rounded-2 p-2 text-dark' data-bs-theme='light'>
                                            <p class='mb-0'>".$msg."</p>
                                        </div>
                                    </div>
                                    <div class='avatar avatar-m ms-2 flex-shrink-0'>
                                        ".getUserProfilePic($chat_list['sender_id'])."
                                    </div>
                                </div>
                                <div class='text-end'>
                                    <p class='mb-0 fs-10 text-body-tertiary text-opacity-85 fw-semibold'>".date('d-M-Y h:i:s A',$chat_list['datentime'])."</p>
                                </div>
                            </div>
                        </div>
                    </div>";
	else
	$chat_messages .= "<div class='d-flex chat-message'>
                        <div class='d-flex mb-2 justify-content-start flex-1'>
                            <div class='w-75 w-xxl-50'>
                                <div class='d-flex hover-actions-trigger'>
                                    <div class='avatar avatar-m me-3 flex-shrink-0'>
                                        ".getUserProfilePic($chat_list['sender_id'])."
                                    </div>
                                    <div class='chat-message-content me-2'>
                                        <div class='mb-1 received-message-content border rounded-2 p-2' data-bs-theme='light'>
                                            <p class='mb-0'>".$msg."</p>
                                        </div>
                                    </div>
                                </div>
                                <div class='text-start'>
                                    <p class='mb-0 fs-10 text-body-tertiary text-opacity-85 fw-semibold'>".date('d-M-Y h:i:s A',$chat_list['datentime'])."</p>
                                </div>
                            </div>
                        </div>
                    </div>";
}

function getUserProfilePic($chatUserId)
{
    if(substr($chatUserId,0,2) == 'CR')
    return "<img class='rounded-circle' src='../profile_pics/".$chatUserId.".jpg' alt='' />";
    else
    return "<img class='rounded-circle border border-1 border-primary px-1 pb-1' src='../images/favicon.png' alt='' />";
}

echo $chat_messages;
?>