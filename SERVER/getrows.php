<?php
// establish connection
$con = mysqli_connect("localhost","DB_USER","DB_USER_PASSWORD","DATABASE");

// check connection
if ($con->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

//grab result from the SQL database
$result = mysqli_query($con,"SELECT count(*) FROM share") or die(mysqli_error($con));
$num_rows = mysqli_fetch_row($result);

echo $num_rows[0];

mysqli_close($con); // close connection
?>