<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Product Detail</h5>
</div>

<div class="ms-5">
<?php
$query_product_list = "SELECT * FROM product_list ORDER BY description ASC";
$products = mysqli_query($con, $query_product_list);

while($product = mysqli_fetch_assoc($products))
{
	$checked_status = "<div class='me-2 fs-7'>&#9744;</div>";

	if($lrn['product_id'] > 0)
	{
		if($lrn['product_id'] == $product['id'])
		$checked_status = "<div class='me-2 fs-9'>&#9745;</div>";
	}

	echo "<div class='d-flex align-items-center'>".$checked_status."<div>".$product['description']."</div></div>";
}
?>
</div>

<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Loan Detail</h5>
</div>

<div <?=$input_row_div_design?>>
<?php
createinput('amount',$lrn['required_loan_amount'],$label_design_col1,$readonly_input_box_design,$field_visibility);
createinput('introducer',$introducer,$label_design_col2,$readonly_input_box_design,$field_visibility);

if($lrn['introducer_id'] > 0)
createinput('introducer Code',$introducer_code,$label_design_col2,$readonly_input_box_design,$field_visibility);
?>
</div>