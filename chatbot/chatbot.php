<?php
// Simple chatbot logic
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $message = strtolower(trim($_POST['message']));
    
    // Basic responses based on user input
    $responses = [
        'services' => 'We offer web development services including custom website design, e-commerce solutions, CMS development, and more. What specific service are you interested in?',
        'pricing' => 'Our pricing depends on the project scope. Could you share more details about your project?',
        'portfolio' => 'You can view our portfolio on our website or I can share some project highlights. Would you like to see examples?',
        'contact' => 'You can reach us via email at contact@yourwebsite.com or call us at (123) 456-7890. Want to schedule a consultation?',
        'hi' => 'Hello! How can I assist you with your web development needs today?',
        'hello' => 'Hi there! Interested in our web development services?',
        'default' => 'I’m not sure I understood that. Could you please provide more details or ask about our services, pricing, portfolio, or contact info?'
    ];

    // Match user input to response
    $response = $responses['default'];
    foreach ($responses as $key => $value) {
        if (strpos($message, $key) !== false) {
            $response = $value;
            break;
        }
    }

    echo $response;
}
?>