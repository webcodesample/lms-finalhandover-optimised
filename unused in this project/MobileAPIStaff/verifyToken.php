<?php
include_once("common_include.php");

require_once '../vendor/autoload.php'; // Composer's autoloader
use \Firebase\JWT\JWT;
use Firebase\JWT\Key;

$key = "amit-12345-moti-corporation-bangalore"; // Secret key for encoding/decoding JWTs

$jwt = $_SERVER['HTTP_AUTHORIZATION']; // Get the JWT from the Authorization header
$jwt = str_replace('Bearer ', '', $_SERVER['HTTP_AUTHORIZATION']);

//echo json_encode(array('jwt' => $jwt));
//echo json_encode($jwt);
//die();

if ($jwt) {
    try {
        $decoded = JWT::decode($jwt, new Key($key, 'HS256'));
        // If valid, return decoded data

        $staffId = $decoded->user->id;
        $user_refid = $decoded->user->ref_id;
        $username = $decoded->user->username;
        $password = $decoded->user->password;

        $where_con_array = [
						'username' => $username,
						'password' => $password,
						'status' => 1,
                        'login_type' => 3,
                        'ref_id' => $user_refid,
						];

        if(getRowCountMultiCol(setWhereClause($where_con_array),'login_detail',$con))
        {
            $where_con = [ 'id' => $staffId];
            $staffInfo = mysqli_fetch_assoc(getRowsDataCon('staff_list',$where_con,$con));
            $staffInfo['profile_pic'] = str_replace('../','http://campus-abroad.co.in/v3/',getProfilePic('BS'.$staffId));

            $decodedArray = (array) $decoded;
            $decodedArray['staffInfo'] = $staffInfo;

            echo json_encode($decodedArray);
        }
        else{
            echo json_encode(array('error' => 'Invalid Token: Token Mismatch'));
        }

    } catch (Exception $e) {
        echo json_encode(array('error' => 'Invalid Token: ' . $e->getMessage()));
    }
} else {
    echo json_encode(array('error' => 'Authorization header missing'));
}
?>
