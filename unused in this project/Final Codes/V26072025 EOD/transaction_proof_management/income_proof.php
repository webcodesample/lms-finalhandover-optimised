<?php
include_once("common_include.php");

$transaction_proof = getFieldValue('transaction_proof_file_name','lead_id',$_REQUEST['lead_id'],'income_history',$con);

$transaction_proof_array = explode(',',$transaction_proof);

include_once("../App/head_before_login.php");
?>

<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-danger text-center">
<th>#</th>
<th>File Name</th>
</thead>

<tbody>

<?php
$i = 0;
foreach($transaction_proof_array as $file)
{
	$i++;
	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>
		<a href='../income_proofs/".$file."' class='text-decoration-none link-success' target='_blank'>".$file."</a>
		</td>
		</tr>";
}

?>

</tbody>
</table>