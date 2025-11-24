<?php
include_once("common_include.php");
require_once '../vendor/autoload.php'; // Composer's autoloader
use \Firebase\JWT\JWT;

$key = "amit-12345-moti-corporation-bangalore"; // Secret key for encoding/decoding JWTs

$jsonData = file_get_contents('php://input'); // Read raw POST data from the incoming request body

$data = json_decode($jsonData, true); // Decode the JSON data into a PHP array

// Simulate user authentication (this would normally be a database check)
$username = $data['username'] ?? null;
$password = $data['password'] ?? null;

$where_con_array = [
						'username' => $username,
						'password' => $password,
						'status' => 1,
                        'login_type' => 5
						];

//if ($username === 'test' && $password === '1234') 
if(getRowCountMultiCol(setWhereClause($where_con_array),'login_detail',$con))
{
    $loged_user_ref_id = getFieldValueMultiCon('ref_id',setWhereClause($where_con_array),'login_detail',$con);
	$loged_user_where_con = [ 'id' => substr($loged_user_ref_id,2)];

    $loged_user = mysqli_fetch_assoc(getRowsDataCon('students',$loged_user_where_con,$con));
    $loged_user['profile_pic'] = str_replace('../','http://campus-abroad.co.in/v3/',getProfilePic($loged_user_ref_id));
    $loged_user['dob'] = date('Y-m-d',$loged_user['dob']);

    $issuedAt = time();
    $expirationTime = $issuedAt + 36000;  // JWT valid for 10 hours
    
    $payload = [
        "iat" => $issuedAt,
        "exp" => $expirationTime,
        "user" => [
                        "id" => substr($loged_user_ref_id,2),
                        "ref_id" => $loged_user_ref_id,
                        "username" => $username,
                        "password" => $password,
                    ],
    ];
    
    // Encode JWT
    $jwt = JWT::encode($payload, $key, 'HS256');
    
    // Send the token as JSON response
    echo json_encode(array('jwt' => $jwt,'studentInfo'=>$loged_user));
} else {
    echo json_encode(array('error' => 'Invalid credentials'));
}
?>
