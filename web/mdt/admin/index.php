<?php 
include('../settings.php');
session_start();
if (!$_SESSION['user_admin'] >= 2) {
    header("Location: https://www.youtube.com/watch?v=dQw4w9WgXcQ");
    die();
}
?>

<center><h1>MDT Admin Panel</h1></center>

<form method='post' action='#'>
    <input type='submit' name='genCode' value='Generate new login code'>
</form>

<?php
if (isset($_POST['genCode'])) {
    $str = rand();
    $result = md5($str);
    echo "Account Creation Code:" . $result;
    
    
    $query = "INSERT INTO users (code) VALUES ('$result')";
    mysqli_query($conn, $query);
}
?>