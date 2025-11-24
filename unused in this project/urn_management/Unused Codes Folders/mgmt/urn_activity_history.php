<?php
  $where_con = [
				'lead_id' => $_REQUEST['lead_id'],
			];

  $query_view_lead_history = "SELECT * FROM leads_activity_history".setWhereClause($where_con)." ORDER BY datentime DESC";
  $result_view_lead_history = mysqli_query($con, $query_view_lead_history);
  ?>

  <table class="table table-sm table-light table-bordered table-hover table-striped fs-9">

  <thead class="table-info text-center">
  <tr>
  <th>Date & Time</th>
  <th>Comment</th>
  <th>Status</th>
  <th>Comment By</th>
  </tr>
  </thead>
  <tbody>

  <?php
  while($lead = mysqli_fetch_assoc($result_view_lead_history))
  {
  	echo "<tr>
		<td>".date('d-M-Y h:i:s A',$lead['datentime'])."</td>
		<td>".ucfirst($lead['comment'])."</td>
		<td>".strtoupper(getFieldValue('description','id',$lead['status_id'],'lead_status_list',$con))."</td>
		<td>".ucwords($lead['activity_by'])."</td>
		</tr>";
  }
  ?>

  </tbody>
  </table>