<?php
//$con = mysqli_connect('p3nlmysql83plsk.secureserver.net','MotiBuildersWindows','swodniwsredliubitoM!','MotiBuildersWindows');
$con = mysqli_connect('p3nlmysql83plsk.secureserver.net','MotiBuildersWindows','swodniwsredliubitoM!','MotiBuildersWindows');

print_r(mysqli_fetch_assoc(mysqli_query($con, "SELECT * FROM funcode")));
?>