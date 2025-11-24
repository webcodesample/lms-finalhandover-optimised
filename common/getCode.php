<?php
function getCode($type)
{
	$data = json_decode(file_get_contents('../common/codes.json'), true);

	for($i = 0; $i < count($data); $i++)
	{
		if($data[$i]['name'] == $type)
		return $data[$i]['code'];
	}
}
?>