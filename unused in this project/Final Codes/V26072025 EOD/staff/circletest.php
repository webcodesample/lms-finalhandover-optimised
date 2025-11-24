<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Colorful Border Circle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .circle {
            border-radius: 50%;
            display: inline-block;
            position: relative;
        }
        .circle-inner {
            border-radius: 50%;
            position: absolute;
            top: 0;
            left: 0;
        }
        .circle-1 { width: 150px; height: 150px; border: 10px solid red; }
        .circle-2 { width: 120px; height: 120px; border: 10px solid blue; position: absolute; top: 15px; left: 15px; }
        .circle-3 { width: 90px; height: 90px; border: 10px solid green; position: absolute; top: 30px; left: 30px; }
        .circle-4 { width: 60px; height: 60px; border: 10px solid yellow; position: absolute; top: 45px; left: 45px; }
    </style>
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">
    <!--<div class="circle circle-1">
        <div class="circle circle-2">
            <div class="circle circle-3">
                <div class="circle circle-4"></div>
            </div>
        </div>
    </div>-->
    <div class="circle circle-1">
    </div>

</body>
</html>
