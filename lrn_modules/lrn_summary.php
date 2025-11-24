<?php
include_once("lrn_summary_content.php");

if(in_array($_SESSION['login_type'],array(1,2,3,8)))
{
	include_once("modals/update_status_modal.php");

	if(checkLoginType($_SESSION['login_type']) == 1)
	include_once("modals/kill_lead_modal.php");
	else
	include_once("modals/kill_lead_modal_bes.php");

	include_once("modals/approve_lead_deletion_modal.php");
	include_once("modals/generateAgreementModal.php");
	include_once("modals/uploadSignedAgreementModal.php");
	include_once("modals/manage_lead_modal.php");
	include_once("../lrn_modules/modals/lrnProfileModal.php");
	include_once("../lrn_modules/modals/lrnCompanyModal.php");
	include_once("../lrn_modules/modals/lrnBankModal.php");
	include_once("../lrn_modules/modals/lrnLoanModal.php");
	include_once("../lrn_modules/modals/lrnGuarantorModal.php");
}
include_once("../modal_boxes/communication/lrn_communication_modal.php");
?>
