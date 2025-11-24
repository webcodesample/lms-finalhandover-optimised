<?php
	echo "<li class='nav-item'><a class='nav-link' href='leads.php'><div class='d-flex align-items-center'><span class='nav-link-text'>All (".getRowCount('allocated_id',$_SESSION['agent_ref_id'],'leads_details',$con).")</span></div></a></li>";

	$query_view_lead_status_list = "SELECT DISTINCT description FROM lead_status_list";
	$result_view_lead_status_list = mysqli_query($con, $query_view_lead_status_list);
	while($status = mysqli_fetch_assoc($result_view_lead_status_list))
	{
        //get total lead count as per status description for specific agent
        $query_total_leads_per_status = "SELECT * FROM leads_details AS ld JOIN lead_status_list AS lsl ON ld.status_id = lsl.id WHERE lsl.description = '".$status['description']."' AND ld.allocated_id = '".$_SESSION['agent_ref_id']."'";
        $result_total_leads_per_status = mysqli_query($con,$query_total_leads_per_status);
        $leads_counter = mysqli_num_rows($result_total_leads_per_status);

		echo "<li class='nav-item'><a class='nav-link' href='leads.php?status=".$status['description']."'><span class='nav-link-text'>".$status['description']." <span class='text-danger'>(".$leads_counter.")</span></span></a></li>";
	}
?>