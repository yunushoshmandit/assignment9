
<?php require_once("restrict.php"); ?>
<?php require_once("connection.php"); ?>
<?php

    if(isset($_POST["name"])) {
        $name = $_POST["name"];
        $gender = $_POST["gender"];
        $phone = $_POST["phone"];
        $address = $_POST["address"];
        $dob = $_POST["dob"];
        $nic = $_POST["nic"];
        $job = $_POST["job"];
        $reg_date = jdate("Y-m-d"); 

        $result = mysqli_query($con, "INSERT INTO VALUES (NULL, '$name', $gender, '$phone', '$address', '$dob', '$nic', '$job', '$reg_date')");
        
        if($result) {
            header("location:patient_add.php?error=notadd");
        }
        else {
            
        }
    }
?>

<?php require_once("top.php"); ?>

    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
        <div class="panel panel-primary">
                <div class="panel-heading">
                    <h1>Register New Patient</h1>
                </div>

                <div class="panel-body">
                    <form method="post">
                        
                        <div class="input-group">
                            <span class="input-group-addon">
                                Name:
                            </span>
                            <input type="text" name="name" class="form-control">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">
                                Gender:
                            </span> &nbsp;
                            <label><input type="radio" name="gender" value="0">Male</label> &nbsp;
                            <label><input type="radio" name="gender" value="1">Female</label>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">
                                Phone:
                            </span>
                            <input type="text" name="phone" class="form-control">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">
                                Address:
                            </span>
                            <input type="text" name="address" class="form-control">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">
                                DoB:
                            </span>
                            <input type="text" name="dob" class="form-control">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">
                                NIC:
                            </span>
                            <input type="text" name="nic" class="form-control">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">
                                Job:
                            </span>
                            <input type="text" name="job" class="form-control">
                        </div>

                        <input type="submit" value="Register" class="btn btn-primary">
                    </form>
                </div>
        </div>
    </div>

<?php require_once("footer.php"); ?>