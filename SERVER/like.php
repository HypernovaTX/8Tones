<?php
// establish connection
$con = mysqli_connect("localhost","DB_USER","DB_USER_PASSWORD","DATABASE");

// check connection
if ($con->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

//init
$get_id = urldecode($_GET["id"]);

//grab from the data
$result = mysqli_query($con,"UPDATE share SET `likes` = likes + 1 WHERE `id` = '".$get_id."'") or die(mysqli_error($con));

mysqli_close($con); // close connection
?>