<?php
include('login.php'); // Includes Login Script

if(isset($_SESSION['staff_id'])){
header("location: index.php");
}
?>

<table width="15px" border="0">
<form form action='login.php' method='POST'>
<tr>
<td>Username</td>
<td><input type="text" name="username" /></td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" name="password" /></td>
</tr>
<tr>
  <td><input type="submit" name="submit" value="submit"/></td>
</tr>
</form>

<html>
   <head>
    <title>Login</title>
  </head>
  <body>
  <?php 
    session_start(); // Starting Session
    $error=''; // Variable To Store Error Message
    if (isset($_POST['submit'])) {
    if (empty($_POST['username']) || empty($_POST['password'])) {
    $error = "Username or Password is invalid";
    }
    else
    {
    // Define $username and $password
    $username=$_POST['username'];
    $password=$_POST['password'];
    // Establishing Connection with Server by passing server_name, user_id   and password as a parameter
    $hostname= "localhost";
    $database = "hospital_mis";
    $username = "root";
    $password = "";
    $localhost = mysqli_connect($hostname, $username, $password, $database);
    if(mysqli_connect_errno())
    {
        die("Connection Failed".mysqli_error());
    }
    // SQL query to fetch information of registerd users and finds user match.
    $sql = "SELECT * FROM `users`";
    $query = mysqli_query($localhost,$sql);
    if(!$query)
    {
        die("Query Failed".mysqli_error($localhost));
    }
    $rows = mysqli_num_rows($query);
    if ($rows == 1) {
    $_SESSION['login_user']=$username; // Initializing Session
    echo "You are now logged on!";
    } else {
    $error = "Username or Password is invalid";
    }
    mysqli_close($localhost); // Closing Connection
    }
    }
  ?>
 </body>
 </html>
