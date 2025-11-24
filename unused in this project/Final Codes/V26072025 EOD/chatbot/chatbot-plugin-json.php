<?php
// Handle POST request
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $userMessage = trim($_POST['message']);
    
    // Load responses from JSON file
    $jsonFile = 'response.json';
    if (!file_exists($jsonFile)) {
        echo "Error: Response file not found.";
        exit;
    }

    $jsonContent = file_get_contents($jsonFile);
    $responses = json_decode($jsonContent, true);
    
    if (json_last_error() !== JSON_ERROR_NONE) {
        echo "Error: Invalid JSON format in response file.";
        exit;
    }

    // Convert user message to lowercase for case-insensitive matching
    $userMessageLower = strtolower($userMessage);
    
    // Check for keywords in user message
    $response = isset($responses['default']) ? $responses['default'] : "I’m not sure how to respond to that. Can you provide more details or ask something else?";
    foreach ($responses as $key => $value) {
        if ($key !== 'default' && strpos($userMessageLower, strtolower($key)) !== false) {
            $response = $value;
            break;
        }
    }

    // Return the response
    echo $response;
}
?>