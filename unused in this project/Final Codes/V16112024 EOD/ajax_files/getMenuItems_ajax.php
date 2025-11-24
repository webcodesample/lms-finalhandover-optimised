<?php
include_once("../livesearch/con_ajax.php");

$query = "SELECT * FROM menu_items WHERE parent_menu_id = '".$_REQUEST['parent_menu']."'";
$result = mysqli_query($con,$query);

$options = "<option value=''>Select Parent Menu Item</option>";
while($menu_item = mysqli_fetch_assoc($result))
{
	$options .= "<option value='".$menu_item['id']."'>".$menu_item['description']."</option>";
}

echo $options;
?>