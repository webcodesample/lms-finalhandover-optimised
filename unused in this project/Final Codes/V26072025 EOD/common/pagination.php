<?php
$npi_start = 1;

if(checkIsRequested('page_index'))
$current_page_index = $_REQUEST['page_index'];
else
$current_page_index = 1;

if($current_page_index > 1)
{
	echo "<a href='javascript:setPageIndex(".($current_page_index-1).")' class='btn btn-sm btn-outline-primary m-1 rounded'>&lt;</a>";
}

//set start page index on pagination buttons
if($current_page_index > $npi-1)
$npi_start = $current_page_index - 1;

$total_indexed_pages = ceil($total_rows / $nrpp);

if($total_rows > ($nrpp*2))
{
	for($index=$npi_start;$index<=($npi_start+2);$index++)
	{
		if($index == $current_page_index)
		echo "<a class='btn btn-sm btn-primary m-1 rounded'>".$index."</a>";
		else if($index <= $total_indexed_pages)
		echo "<a href='javascript:setPageIndex(".$index.")' class='btn btn-sm btn-outline-primary m-1 rounded'>".$index."</a>";
	}
}
else if($total_rows > $nrpp)
{
	for($index=$npi_start;$index<=($npi_start+1);$index++)
	{
		if($index == $current_page_index)
		echo "<a class='btn btn-sm btn-primary m-1 rounded'>".$index."</a>";
		else
		echo "<a href='javascript:setPageIndex(".$index.")' class='btn btn-sm btn-outline-primary m-1 rounded'>".$index."</a>";
	}
}

if($current_page_index < $number_of_pages)
{
	echo "<a href='javascript:setPageIndex(".($current_page_index+1).")' class='btn btn-sm btn-outline-primary m-1 rounded'>&gt;</a>";
}

?>