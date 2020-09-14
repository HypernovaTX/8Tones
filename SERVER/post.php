<?php
// establish connection
$con = mysqli_connect("localhost","DB_USER","DB_USER_PASSWORD","DATABASE");

// check connection
if ($con->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$map = $_POST["map"]; // get the map from the URL
$author = urldecode($_POST["author"]); // get the author from the URL
$name = urldecode($_POST["name"]); // get the name from the URL
$id = urldecode($_POST["id"]); // get the ID from the URL
$verify = urldecode($_POST["verify"]); // get the verification (auth) from the URL
$password = urldecode($_POST["password"]); // get the password from the URL
$time_stamp = $_SERVER['REQUEST_TIME']; // get the timestamp from the URL
$getPassword = ""; // will be used to grab the password
$salt = "PUT SALT HERE"; // THIS MUST MATCH WHAT YOU PUT AS SALT IN GAME MAKER

// values to update - replace "Level" with name of your table
$sql = "REPLACE INTO share (map, author, name, time_stamp, password, id)
VALUES ('$map','$author','$name','$time_stamp','$password','$id')";

$encoded = md5( mb_convert_encoding($map.$salt, "UTF-8" )); // encode, just like in Game Maker

$result = mysqli_query($con,"SELECT * FROM share where id = '$id'") or die(mysqli_error($con)); // get the level based on ID

$map = urldecode($map); // encode the map
// retrieve values
if ($result!=""){ 
  while($row = mysqli_fetch_array($result)){
    $getPassword = $row['password']; // get the password
  }
}

$pass = true; // test if the passwords match, if there is a need to check
$update = false; // whether or not to update

if (strlen($getPassword)>0){ // if the password exists
  if (strcmp($password, $getPassword) != 0){ // if they are not the same
    $pass = false;
  } 
  else{
    $pass = true;
    $update = true;
  }
}

$success = "";

if ($pass == true){ // if the passwords match, or if the level is new
  if (strcmp($verify, $encoded) == 0) { // if the verification is correct
    if ($con->query($sql) === TRUE) { // if we are connected to the database
      if ($update == false && strlen($password)>0){ // if we are not updating
        $success = "1"; // level uploaded
      }
      else{
        $success = "4"; // level updated
      }
    } else {
      $success = "0"; // not connected
    }
  }
  else{
    $success = "2"; // bad auth
  }
}
else{
  $success = "3"; // level not updated
}

echo $success; // print the message

mysqli_close($con); // close connection
?>	