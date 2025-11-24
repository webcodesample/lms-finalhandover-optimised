<div class="d-flex justify-content-between sticky-top p-2" style="background-color:#CAF1FF;">
    <a href="./leads.php"><img src="../images/ca-logo.png" height="35px"></a>
    <h5 class="text-danger"><?=strtoupper($_SESSION['username'])?></h5>
</div>

<div class="row m-0">
    <div class="col-1">
    <?php include_once("sidebar.php") ?>
    </div>

    <div class="container col-11 pt-2">
    <?php
    $current_php_script = explode('.',basename($_SERVER['PHP_SELF']));
    $content_pagename_prefix = $current_php_script[0];

    include_once($content_pagename_prefix."_content.php");
    ?>
    </div>
</div>

</div>
<?php include_once("footer.php"); ?>