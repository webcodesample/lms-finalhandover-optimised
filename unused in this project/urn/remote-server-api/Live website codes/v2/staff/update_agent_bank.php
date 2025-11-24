<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['agent_id'], ];

$agent_bank_info = $_REQUEST;
unset($agent_bank_info['agent_id']);

updateData('agent_list',$agent_bank_info,$where_con_array,$con);

header("Location:manage_agent.php?agent_id=".$_REQUEST['agent_id']."&tab=bank");
?>