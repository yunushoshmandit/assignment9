<?php require_once("connection.php"); ?>
<?php

    if(isset($_SESSION["staff_id"])){
        header("location:home.php");
    }

    if(isset($_POST["username"])) {
       $username = $_POST["username"];
       $password = $_POST["password"]; 

       // Make sure you connected to database and write the query. 
       // If credentials are corrected redirect user to the page.
       // Otherwise show an error message. 
       $result = mysqli_query($con, "SELECT * FROM users WHERE username = '$username' AND password = PASSWORD('$password') ");

       if(mysqli_num_rows($result) == 1) {
            $row_result = mysqli_fetch_assoc($result);
            $_SESSION["staff_id"] = $row_result["staff_id"];

            $user_id = $row_result["user_id"];
            $date = jdate("Y-m-d");
            $time = jdate("h:i:s");
            
            mysqli_query($con, "INSERT INTO login_log VALUES (NULL, $user_id, '$date', '$time',)");

            header("location:home.php");
       }
       else {
            header("location:login.php?login=failed");  
       }
    }

?>
<?php require_once("top.php"); ?>

    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-0" style="margin-top:100px;">

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h1>Login to MIS</h1>
            </div>

            <div class="panel-body">

                    <?php if(isset($_GET["login"])) { ?>
                            <div class="alert alert-danger">
                                Incorrect Username or Password!
                            </div>
                        <?php } ?>
                        <?php if(isset($_GET["logout"])) { ?>
                            <div class="alert alert-success">
                                You are successfully logged out!
                            </div>
                        <?php } ?>
                        
                        <?php if(isset($_GET["notlogin"])) { ?>
                            <div class="alert alert-warning">
                                Please login first!
                            </div> 
                        <?php } ?>

            <form method="post"> 

                <div class="input-group">
                    <span class="input-group-addon">
                        Username:
                    </span>
                    <input class="form-control" type="text" name="username" id="">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        Password: 
                    </span>
                    <input class="form-control" type="password" name="password" id="">
                </div>
                <input type="submit" class="btn btn-info" value="Login">
            </form> 
            </div>
        </div>
    </div>
<?php require_once("footer.php"); ?>