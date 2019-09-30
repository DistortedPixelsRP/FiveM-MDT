<?php include('settings.php'); 
session_start();
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="modal.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<title>Create Account</title>
</head>
<body>
<div class="form-wrapper" style='height:525px; top: 45%;'>
  <form id="form" method="post" action="utilities/create.php">
    <h3>Create Account</h3>
    
    <div class="form-item">
	<input type="text" name="name" placeholder="Name" autofocus required></input>
    </div>
    
    <div class="form-item">
		<input type="text" name="email" placeholder="Email" autofocus required></input>
    </div>
    
    <div class="form-item">
		<input type="password" name="pass" placeholder="Password" required></input>
    </div>
    <div class="form-item">
		<input type="password" name="pass2" placeholder="Confirm Password" required></input>
    </div>
    <div class="form-item" style='display: <?php if ($enableCode == true) {echo "block";} else {echo "none";}?>'>
		<input style='background: none;' type="text" name="code" placeholder="Account Code" <?php if ($enableCode == true) {echo "required";}?>></input>
    </div>
    
    <div class="button-panel">
        <input type="submit" class="button" id="sub" title="Log In" name="login" value="Create"></input>
    </div>
    <center><alert><?php  if(isset($_SESSION['loginError'])) {echo $_SESSION['loginError']; unset($_SESSION['loginError']);}?></alert></center>
    <center><a href='index.php'><h2>Login</h2></a></center>
  </form>
</div>
</body>
</html>