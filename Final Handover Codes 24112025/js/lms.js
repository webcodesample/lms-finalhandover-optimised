function checkIntroducerType(custType) {
	if (custType == 2)
		$('#contact_person').prop('disabled', false);
	else {
		$('#contact_person').prop('disabled', true);
		$('#contact_person').val('');
	}
}