<?php
// establish connection
$con = mysqli_connect("localhost","DB_USER","DB_USER_PASSWORD","DATABASE");

// check connection
if ($con->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

// pull from url
$Type = $_GET["Type"]; // get the search type from the url
$Search = $_GET["Search"]; // get the search string from the url
$password = $_GET["Password"]; // get the password from the url
$Push = urldecode($_GET["push"]); // get the push from the url - whether or not if are grabbing the level data to update
$page = ((int)$_GET["page"])*10; //get offset
$getPassword = ""; // the password
$result = ""; // the result


// pull different results based on type - newest to oldest, ABC order, by first letter, by string, by exact match
// NOTE: change limit x to how many entries you would like to pull from the database
switch($Type){
case("1"): $result = mysqli_query($con,"SELECT * FROM share ORDER BY time_stamp DESC limit ".$page.",10") or die(mysqli_error($con)); break;
case("2"): $result = mysqli_query($con,"SELECT * FROM share ORDER BY name ASC limit 10") or die(mysqli_error($con)); break;
case("3"): $result = mysqli_query($con,"SELECT * FROM share WHERE LEFT(name, 1) = '$Search' limit 10") or die(mysqli_error($con)); break;
case("4"): $result = mysqli_query($con,"SELECT * FROM share where name LIKE '%$Search%' or author LIKE '%$Search%' limit 10") or die(mysqli_error($con)); break;
case("5"): $result = mysqli_query($con,"SELECT * FROM share where id = '$Search' limit 10") or die(mysqli_error($con)); break;
}


// retrieve values
if ($result!=""){
while($row = mysqli_fetch_array($result)){
$Res[0] = $row['map']; // get the map
$Res[1] = $row['name']; // get the name
$Res[2] = $row['author']; // get the author
$Res[3] = $row['time_stamp']; // get the timestamp
$Res[4] = $row['likes']; // get the likes
if ($Type == "5"){
$getPassword = $row['password'];
}

if ($Push == "0"){
  if (strlen($getPassword)>0 && strcmp($password, $getPassword) == 0){
    echo $Res[0]; // echo the map if the passwords match
  }
  else{ // echo zero
    echo "0";
  }
}
else{ // print the formatted text
echo "<level><map>".$Res[0]."</map><br><name>".urlencode($Res[1])."</name><br><author>".urlencode($Res[2])."</author><br><date>".$Res[3]."</date><br><likes>".urlencode($Res[4])."</likes></level>";
}

}
}

mysqli_close($con); // close connection
?>