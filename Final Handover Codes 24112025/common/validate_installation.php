<?php
if(file_exists("../dll.txt")  && (file_get_contents("../common/install.txt") == 111))
{
    if(file_exists("../common/makedll.php"))
    {
        rename("../common/makedll.php","../common/mkdll.php");
    }
}
else
{
    if(file_exists("../common/makedll.php"))
        header("Location:../common/makedll.php");
    else
        echo "<center><h3 class='text-danger'>Installation Error</h3></center>";

    die();
}
?>
