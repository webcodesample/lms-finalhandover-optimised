<?php
// Simple chatbot logic
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $userMessage = trim($_POST['message']);
    
    // Basic response logic (extend this as needed)
    $responses = [
        'hi' => 'Hello! How can I help you today?',
        'hello' => 'Hello! How can I help you today?',
        'service' => 'We offer web development, hosting, and SEO services. Would you like more details?',
        'services' => 'We offer web development, hosting, and SEO services. Would you like more details?',
        'pricing' => 'Our pricing varies based on the project. Can you specify which service you’re interested in?',
        'contact' => 'You can reach us at contact@yourwebsite.com or call us at (123) 456-7890.',
        'default' => 'I am not sure how to respond to that. Can you provide more details or ask something else?'
    ];

    // Convert user message to lowercase for case-insensitive matching
    $userMessageLower = strtolower($userMessage);
    
    // Check for keywords in user message
    $response = $responses['default'];
    foreach ($responses as $key => $value) {
        if (strpos($userMessageLower, $key) !== false) {
            $response = $value;
            break;
        }
    }

    // Return the response
    echo $response;
}
?>