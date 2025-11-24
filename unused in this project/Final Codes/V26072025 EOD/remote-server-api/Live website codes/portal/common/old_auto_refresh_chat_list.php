<script>
$(document).ready(function(){
    getChatMessages();
    idleTime = 0;

    //Increment the idle time counter every second.
    var idleInterval = setInterval(timerIncrement, 1000);
   
    function timerIncrement()
    {
        idleTime++;
        if (idleTime > 3)
        {
        getChatMessages($("#chatMessages").scrollTop());
        }
    }
   
    //Zero the idle timer on any action.
    $("#chatMessages").bind('mousemove keydown scroll click', function (e) {
        idleTime = 0;
        //Do something
        //alert($("#chatMessages").scrollTop());
        //alert($("#chatMessages").height());
        //alert($("#chatMessages")[0].scrollHeight);
        if(($("#chatMessages").scrollTop()+$("#chatMessages").height()+48) >= $("#chatMessages")[0].scrollHeight)
            $("#btn_bottom").hide();
        else
            $("#btn_bottom").show();
    });   
});

function getChatMessages(chatMessagesDivScrollPosition) 
{
    $.ajax({
        url: "../common/getChatMessages_ajax.php",
        type: "post",
        data: {
            logged_user: "<?=$_SESSION['staff_ref_id']?>",
            chat_with: "<?=$_REQUEST['chat_with']?>",
        },
        success: function (response) {
            $("#chatMessages").html(response);
            if(chatMessagesDivScrollPosition >= 0)
            $("#chatMessages").scrollTop(chatMessagesDivScrollPosition);
            else
            $("#chatMessages").scrollTop($("#chatMessages")[0].scrollHeight);
        }
    });
}

function createChatRecord()
{
    idleTime = 0;

    $.ajax({
        url: "../common/createChatRecord_ajax.php",
        type: "post",
        data: {
            logged_user: "<?=$_SESSION['staff_ref_id']?>",
            chat_with: "<?=$_REQUEST['chat_with']?>",
            chat_msg: $("#chat_msg").val(),
        },
        success: function (response) {
            $("#chat_msg").val('');
            getChatMessages();
        }
    });
}
</script>