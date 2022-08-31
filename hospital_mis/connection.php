<?php

    $con = mysqli_connect("localhost", "root", "");

    mysqli_select_db($con, "hospital_mis");

    if(!isset($_SESSION)) {
        session_start();
    }


    require_once("jdf.php");


?>
