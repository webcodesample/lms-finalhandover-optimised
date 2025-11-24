<?php
function encryptString($string, $key) {
    $method = 'AES-256-CBC';
    $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length($method));
    $encrypted = openssl_encrypt($string, $method, $key, 0, $iv);
    return base64_encode($encrypted . '::' . $iv);
}

function decryptString($encryptedString, $key) {
    list($encrypted_data, $iv) = explode('::', base64_decode($encryptedString), 2);
    return openssl_decrypt($encrypted_data, 'AES-256-CBC', $key, 0, $iv);
}

// Example usage
$originalString = "echo 'Hello, World!';";
$key = "your-encryption-key";

$encryptedString = encryptString($originalString, $key);
echo "Encrypted: " . $encryptedString . "<br>";
echo "<br>";
$decryptedString = decryptString($encryptedString, $key);
echo "Decrypted: " . eval($originalString);
?>

<?php
function encryptString2($string, $salt) {
    return crypt($string, $salt);
}

// Example usage
$originalString = "echo 'Hello, World!';";
$salt = '$2y$10$' . bin2hex(random_bytes(11)); // Blowfish salt with cost parameter

$encryptedString = encryptString2($originalString, $salt);
echo "Encrypted: " . $encryptedString . "<br>";
echo eval(base64_decode($encryptedString));
?>
