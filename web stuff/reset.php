<?php include('settings.php'); 
session_start();
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="modal.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<title>Reset Password</title>
</head>

<?php 
if (isset($_GET['token'])) {
    //error_reporting(0);
    $query = "SELECT name FROM mdt_users WHERE pass_reset='" . $_GET['token'] . "'";

    $result = $conn->query($query);
    
    if (@$result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $resetName = $row['name'];
        }
    } elseif ($_GET['token'] == NULL) {
        exit("Token " . $_GET['token'] . " is not valid");
    } else {
        exit("Token " . $_GET['token'] . " is not valid");
    }
} else {
    exit("URL is not valid.");
}
?>

<body>
<div class="form-wrapper">
    <form id="form" method="post" action="utilities/reset.php">
        <input type='hidden' name='token' value='<?php echo $_GET['token']; ?>'>
        <h3>Reset Password</h3>
        <div class="form-item">
            <input type="text" name="name" placeholder="Name" disabled value="<?php echo $resetName; ?>"></input>
        </div>

        <div class="form-item">
                    <input type="password" name="pass" placeholder="New Password" required></input>
        </div>
        <div class="form-item">
                    <input type="password" name="pass2" placeholder="Confirm New Password" required></input>
        </div>
        <div class="form-item" style='display: <?php if ($enableCode == true) {echo "block";} else {echo "none";}?>'>
                    <input style='background: none;' type="text" name="code" placeholder="Account Code" <?php if ($enableCode == true) {echo "required";}?>></input>
        </div>

        <div class="button-panel">
            <input type="submit" class="button" id="sub" title="Log In" name="resetSubmit" value="Reset"></input>
        </div>
        <center><alert><?php  if(isset($_SESSION['loginError'])) {echo $_SESSION['loginError']; unset($_SESSION['loginError']);}?></alert></center>
  </form>
</div>
</body>
</html>