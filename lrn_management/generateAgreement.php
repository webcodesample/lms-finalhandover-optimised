<?php
include_once("common_include.php");

$_REQUEST['updation_remark'] = "Agreement Generated";

$updated_columns = ['approved_loan_amount','payment_frequency','loan_tenure','roi'];

recordLRNAuditHistory($updated_columns,$con);
recordLRNActivityHistory($con);

$lrn_agreement_data = [
						'lrn' => $_REQUEST['lrn'],
						'agreement_id' => $_REQUEST['lrn'].strtotime('now'),
						'datentime' => strtotime('now'),
						];

insertData('lrn_agreements_list',$lrn_agreement_data,$con);

//create email history
lrnupdationEmailHistory('LRN Agreement Generated',$_REQUEST['lrn'],$con);

header("Location:manage_lrn.php?lrn=".$_REQUEST['lrn']);
?>