function toggleSection(sectionName)
{
	let count = $("#audit_count").val();
	for(i=1;i<=count;i++)
	{
		$("#"+sectionName+"_"+i).toggleClass('d-none');
		if($("#"+sectionName+"_btn_"+i).text() == '+')
		{
			$("#"+sectionName+"_btn_"+i).text("-");
			$("#"+sectionName+"_btn_"+i).removeClass("btn-subtle-danger");
			$("#"+sectionName+"_btn_"+i).addClass("btn-subtle-success");
		}
		else
		{
			$("#"+sectionName+"_btn_"+i).text("+");
			$("#"+sectionName+"_btn_"+i).removeClass("btn-subtle-success");
			$("#"+sectionName+"_btn_"+i).addClass("btn-subtle-danger");
		}
	}
}

function toggleAllSections()
{
	let count = $("#audit_count").val();
	let btnValue;

	for(i=1;i<=count;i++)
	{
		if($("#all_detail_btn_"+i).text() == '+')
		{
			$("#all_detail_btn_"+i).text("-");
			$("#all_detail_btn_"+i).removeClass("btn-subtle-danger");
			$("#all_detail_btn_"+i).addClass("btn-subtle-success");
		}
		else
		{
			$("#all_detail_btn_"+i).text("+");
			$("#all_detail_btn_"+i).removeClass("btn-subtle-success");
			$("#all_detail_btn_"+i).addClass("btn-subtle-danger");
		}
		btnValue = $("#all_detail_btn_"+i).text();
	}
	toggleSectionwithAll('customer_detail',btnValue);
	toggleSectionwithAll('loan_detail',btnValue);
	toggleSectionwithAll('guarantor_detail',btnValue);
	toggleSectionwithAll('company_detail', btnValue);
	toggleSectionwithAll('bank_detail', btnValue);
}

function toggleSectionwithAll(sectionName,btnValue)
{
	let count = $("#audit_count").val();
	for(i=1;i<=count;i++)
	{
		if(btnValue == '+')
		{
			$("#"+sectionName+"_"+i).addClass('d-none');
			$("#"+sectionName+"_btn_"+i).text("+");
			$("#"+sectionName+"_btn_"+i).removeClass("btn-subtle-success");
			$("#"+sectionName+"_btn_"+i).addClass("btn-subtle-danger");
		}
		else
		{
			$("#"+sectionName+"_"+i).removeClass('d-none');
			$("#"+sectionName+"_btn_"+i).text("-");
			$("#"+sectionName+"_btn_"+i).removeClass("btn-subtle-danger");
			$("#"+sectionName+"_btn_"+i).addClass("btn-subtle-success");
		}
	}
}