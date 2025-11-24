<form action="upload_documents.php" method="post" enctype="multipart/form-data">
<div class="container mt-2">
<h6 class="text-primary">Step 2<span class="text-danger"> (Optional)</span></h6>
</div>
<div class="container table-responsive p-2">
<div class="row m-0">
<div class="col-6">

<div class="d-flex">
<div style="width:150px;" class="pt-2">URN</div>
<input type="text" class="form-control form-control-sm m-1 text-danger fw-bold" style="width:250px;" value="CA<?=getFieldValue('urn','id',$inserted_lead_id,'leads_details',$con)?>" disabled>
</div>

<div class="d-flex">
<div style="width:150px;" class="pt-2">Name</div>
<input type="text" class="form-control form-control-sm m-1" style="width:250px;" name="full_name" value="<?=$_REQUEST['full_name']?>" disabled>
</div>

<div class="d-flex">
<div style="width:150px;" class="pt-2">Mobile</div>
<input type="text" class="form-control form-control-sm m-1" style="width:250px;" name="mobile" value="<?=$_REQUEST['mobile']?>" disabled>
</div>

<div class="d-flex">
<div style="width:150px;" class="pt-2">Email</div>
<input type="email" class="form-control form-control-sm m-1" style="width:250px;" name="email" value="<?=$_REQUEST['email']?>" disabled>
</div>

<?php
$where_con_array = [ 'id' => $_REQUEST['course'], ];
$course = mysqli_fetch_assoc(getRowsDataCon('course_list',$where_con_array,$con));
?>

<div class="d-flex">
<div style="width:150px;" class="pt-2">Course Name</div>
<input type="text" class="form-control form-control-sm m-1" style="width:250px;" name="course_name" value="<?=$course['name']?>" disabled>
</div>

<div class="d-flex">
<div style="width:150px;" class="pt-2">Course Type</div>
<input type="text" class="form-control form-control-sm m-1" style="width:250px;" name="course_type" value="<?=$course['type']?>" disabled>
</div>

<div class="d-flex">
<div style="width:150px;" class="pt-2">Course Intake</div>
<input type="email" class="form-control form-control-sm m-1" style="width:250px;" name="cours_intake" value="<?=$course['intake']?>" disabled>
</div>

<div class="d-flex">
<div style="width:150px;" class="pt-2">University</div>
<input type="email" class="form-control form-control-sm m-1" style="width:250px;" name="course_university" value="<?=getFieldValue('name','id',$course['university_id'],'university_list',$con)?>" disabled>
</div>


<div class="d-flex">
<div style="width:150px;" class="pt-2">Basic Requirement</div>
<textarea class="form-control form-control-sm m-1" style="width:250px;" disabled><?=$course['eligibility']?></textarea>
</div>

</div>

<div class="col-6">

<?php
	$predefined_documents = getRowsData('document_list',$con);
	$total_predefined_documents = mysqli_num_rows($predefined_documents);
		
	while($predefined_document_list = mysqli_fetch_assoc($predefined_documents))
	{
        if($predefined_document_list['name'] != 'Student Photo' && $predefined_document_list['uploaded_file_name'] != 'student_photo')
            $accepted_type = ".jpg,.jpeg,.pdf";
        else
            $accepted_type = ".jpg,.jpeg";

		echo "<div class='d-flex'>
			<div style='width:220px;' class='pt-2'>".$predefined_document_list['name']."</div>
			<input type='file' class='form-control form-control-sm m-1' style='width:250px;' name='".$predefined_document_list['uploaded_file_name']."' accept='".$accepted_type."'>
			</div>";
	}
	echo "<div class='d-flex'>
		<div style='width:220px;' class='pt-2'>Additional Documents</div>
		<input type='file' class='form-control form-control-sm m-1' style='width:250px;' name='more_documents[]' id='more_documents' accept='.jpeg,.jpg,.pdf' onChange='checkDocsLimit()' multiple>
		</div>";
?>

</div>

<div class="d-flex justify-content-center">
<a href="course_finder.php" class="btn btn-sm btn-subtle-warning m-1">Skip & Submit</a>
<input type="submit" class="btn btn-sm btn-primary m-1" value="Submit">
</div>

</div>

</div>
<input type="hidden" name="urn" value="<?=getFieldValue('urn','id',$inserted_lead_id,'leads_details',$con)?>">
<input type="hidden" name="lead_id" value="<?=$inserted_lead_id?>">
<input type="hidden" name="return_url" value="pub/course_finder.php">
</form>