<?php
session_start();
session_unset();
session_destroy();

header("Location:../invalid_access.php");
?>