<?php
include('../settings.php');

if (isset($_POST['resetSubmit'])) {
    $password = htmlspecialchars($_POST['pass']);
    $password2 = htmlspecialchars($_POST['pass2']);
    
    if ($password != $password2) {
        session_start();
        $_SESSION['loginError'] = "Passwords do not match";
        header("Location:$defaultURL/reset.php?token=" . $_POST['token']);
        exit();
    }
    
    if ($_POST['token'] == NULL) {
        session_start();
        $_SESSION['loginError'] = "Error 1 reseting password.";
        header("Location:$defaultURL/reset.php?token=" . $_POST['token']);
        exit();
    }
    
    $password = password_hash($password, PASSWORD_DEFAULT);
    
    $query = "UPDATE mdt_users SET password='$password', pass_reset=NULL WHERE pass_reset='" . $_POST['token'] ."'";
    mysqli_query($conn, $query);
    header("Location:$defaultURL/index.php");
}