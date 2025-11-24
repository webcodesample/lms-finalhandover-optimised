<?php
include_once("common_include.php");

$search_btn_disable_flag = "disabled";

$where_con = 1;

if(isset($_REQUEST['action_perform']))
{
	$search_btn_disable_flag = "";

	if(isset($_REQUEST['country_id']) && $_REQUEST['country_id'])
	$where_con .= " AND ul.country_id = ".$_REQUEST['country_id'];

	if(isset($_REQUEST['university']) && $_REQUEST['university'])
	$where_con .= " AND cl.university_id = '".$_REQUEST['university']."'";

	if(isset($_REQUEST['type']) && $_REQUEST['type'])
	$where_con .= " AND cl.type = '".$_REQUEST['type']."'";

	if(isset($_REQUEST['course']) && $_REQUEST['course'])
	$where_con .= " AND cl.name = '".$_REQUEST['course']."'";

	if(isset($_REQUEST['intake']) && $_REQUEST['intake'])
	$where_con .= " AND cl.intake LIKE '".$_REQUEST['intake']."'";
	
	if(isset($_REQUEST['eligibility']) && $_REQUEST['eligibility'])
	$where_con .= " AND cl.eligibility LIKE '".$_REQUEST['eligibility']."'";

	if(isset($_REQUEST['duration']) && $_REQUEST['duration'])
	$where_con .= " AND cl.duration = '".$_REQUEST['duration']."'";

	if(isset($_REQUEST['fee']) && $_REQUEST['fee'])
	$where_con .= " AND cl.fee < '".$_REQUEST['fee']."'";

	if(isset($_REQUEST['keyword']) && $_REQUEST['keyword'])
	$where_con .= " AND cl.name LIKE '%".$_REQUEST['keyword']."%'";

	if(isset($_REQUEST['scholarship_available']) && $_REQUEST['scholarship_available'] != '')
	$where_con .= " AND cl.scholarship_available = ".$_REQUEST['scholarship_available'];
}

$view_query = "SELECT * FROM course_list AS cl join university_list AS ul ON cl.university_id = ul.id WHERE ".$where_con." ORDER BY cl.university_id ASC";
$view_result = mysqli_query($con, $view_query);
$total_rows = mysqli_num_rows($view_result);
$number_of_pages = ceil($total_rows/$nrpp);

//set page offset as per page index
if(checkIsRequested('page_index'))
$page_offset = $default_page_offset + ($nrpp*($_REQUEST['page_index']-1));
else
$page_offset = $default_page_offset;

//query to get course list on requested(get/post) page index
$view_query_per_page = "SELECT *,cl.id AS course_id, cl.name AS course_name, ul.name AS university, ul.country_id AS country FROM course_list AS cl join university_list AS ul ON cl.university_id = ul.id WHERE ".$where_con." ORDER BY cl.university_id ASC LIMIT ".$page_offset.",".$nrpp;
$view_result_per_page = mysqli_query($con, $view_query_per_page);

include_once("../common/head.php");
?>

<?php showPublicPortalHeader('Course Finder') ?>
<div class="d-flex justify-content-around">

<div>
<?php include_once("course_finder_search_form.php") ?>
</div>
<div>
<?php include_once("course_finder_search_result.php") ?>
</div>

</div>


<?php include_once("../common/footer_copyright.php") ?>