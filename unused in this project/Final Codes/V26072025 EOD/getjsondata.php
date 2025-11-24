<?php
//$jsonData = file_get_contents('data.json');

echo base64_decode(getCode('functions'));


function getCode($type)
{
	$data = json_decode(file_get_contents('data.json'), true);

	for($i = 0; $i < count($data); $i++)
	{
		if($data[$i]['name'] == $type)
		return $data[$i]['code'];
	}
}
?>