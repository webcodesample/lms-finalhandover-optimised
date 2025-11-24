<?php
	//connection
	$conn = new mysqli('localhost', 'root', '', 'google_pie');

	$sql = "SELECT gender, count(*) as number FROM members GROUP BY gender";
	$query = $conn->query($sql);

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>How to Create a Simple Pie Chart using Google Chart API using PHP/MySQLi</title>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<!-- this is where we show our chart -->
<div id="piechart" style="width: 900px; height: 500px; border:1px solid red; margin: 0px;"></div>
	
<!-- Load our Scripts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>  
<script type="text/javascript">  
	google.charts.load('current', {'packages':['corechart']});  
	google.charts.setOnLoadCallback(drawChart);  
	function drawChart(){  
    var data = google.visualization.arrayToDataTable([  
              	['Gender', 'Number'],  
              	<?php  
	              	while($row = $query->fetch_assoc()){  
	               		echo "['".$row["gender"]."', ".$row["number"]."],";  
	              	}  
              	?>  
         	]);  
    var options = {  
          		title: '',  
          		//is3D:true,  
          		pieHole: 0.5  
         	};  
    var chart = new google.visualization.PieChart(document.getElementById('piechart'));  
    chart.draw(data, options);  
}  
</script>
</body>
</html>