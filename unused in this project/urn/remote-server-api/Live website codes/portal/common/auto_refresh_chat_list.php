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
    if($("#chat_msg").val() || $("#chatPhotos").val())
    {
        idleTime = 0;
        var form_data = new FormData($("#chat_form")[0]);
        form_data.append('chatImage', $('#chatPhotos').prop('files')[0]);

        $.ajax({
            url: "../common/createChatRecord_ajax.php",
            type: "post",
            dataType: 'text', // what to expect back from the server
            cache: false,
            contentType: false,
            processData: false,
            data: form_data,
            success: function (response) {
                $("#chat_msg").val('');
                $("#chatPhotos").val('');
                getChatMessages();
            }
        });
    }
    else
    {
        alert("Enter Message OR Select An Image");
    }
}
</script>