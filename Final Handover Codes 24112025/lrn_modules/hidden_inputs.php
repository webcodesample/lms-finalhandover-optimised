<?php
$hidden_inputs = "";
$unset_key_array = ['id','lrn','updation_remark','datentime','updated_columns'];

foreach($unset_key_array AS $key)
unset($lrn[$key]);

foreach($lrn AS $key => $value)
{
    $hidden_inputs .= "<input type='text' name='".$key."_old' id='".$key."_old' value='".$value."'>";
}
?>