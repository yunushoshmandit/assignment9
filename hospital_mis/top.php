<?php
    if(!isset($_SESSION)){
        session_start();
    }
?>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<title>Hospital MIS</title>
	
	<meta charset="utf-8">
	
</head>
<body>
 
 <div class="container">
 
	<div id="banner">

			<?php if(!isset($_SESSION["staff_id"]))  { ?>
			<a href="login.php" class="pull-right" style="margin-right:10px;">
					Login to MIS
				</a>
				<?php } ?>
				<img src="images/lifecare.jpg" width="100">
				
				<h1>Hospital Management System</h1>
				
				<div class="clearfix"></div>
		
	</div>
		
				<div id="menu">
				
				<div class="row">
					<nav class="nav navbar-default">
						<div class="navbar-header">
							<button type="button" class="" >
								<span class="sr-only">toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="collapse navbar-collapse" id="collapse">
						<?php if(isset($_SESSION["staff_id"]))  { ?>
							<ul class="nav navbar-nav" id="nav-top">
								<li><a href="home.php">Home</a></li>
										<li class="dropdown"><a href="#" data-toggle="dropdown">Patient <span class="caret"></span> </a>
											<ul class="dropdown-menu">
												<li><a href="patient_add.php">Register New Patient</a></li>
												<li><a href="#">Patient List</a></li>
												<li><a href="#">Diagnosis</a></li>
												<li><a href="#">Patient Admit</a></li>
												<li><a href="#">Appointment</a></li>
											</ul>
										</li>
								</li>
								<li class="dropdown"><a href="#" data-toggle="dropdown">Pharmacy <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="#">Add New Medicine</a></li>
										<li><a href="#">Medicine List</a></li>
										<li><a href="#">Patient Medicine</a></li>
										<li><a href="#">Medicine Shortage</a></li>
									</ul>
								</li>
								<li class="dropdown"><a href="#" data-toggle="dropdown">Laboratory<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="#">Add New Test</a></li>
										<li><a href="#">Patient Test</a></li>
										<li><a href="#">Patient Medicine</a></li>
										<li><a href="#">Blood Bank</a></li>
										
									</ul>
								</li>
								<li class="dropdown"><a href="#" data-toggle="dropdown">Finance<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="#">Add New Income</a></li>
										<li><a href="#">Income List</a></li>
										<li><a href="#">Add New Expense</a></li>
										<li><a href="#">Patient Medicine</a></li>
										<li><a href="#">Expense List</a></li>
									</ul>
								</li>
								<li class="dropdown"><a href="#" data-toggle="dropdown">Staff<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="#">Add New Staff</a></li>
										<li><a href="#">Staff List</a></li>
										<li><a href="#">Staff Attendance</a></li>
										<li><a href="#">Staff Salary</a></li>
										<li><a href="#">Staff Schedule</a></li>
									</ul>
								</li>
								<li class="dropdown"><a href="#" data-toggle="dropdown">Management<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="#">Department</a></li>
										<li><a href="#">Room Management</a></li>
										<li><a href="#">Equipment Management</a></li>
										<li><a href="#">User Accounts</a></li>
										<li><a href="#">Staff Salary</a></li>
									</ul>
								</li>
								<li><a href="logout.php">Logout</a></li>	
							</ul>
							<?php } else { ?>
								
								<ul class="nav navbar-default" id="">
									<li><a href="#">Home</a></li>
									<li><a href="#">About</a></li>
									<li><a href="#">Gallery</a></li>
									<li><a href="#">Contact</a></li>
								</ul>
								
							<?php } ?>
						</span>
						</div>
					</nav>
			</div>
	</div>
    <div class="clearfix"></div>
	<div id="content">