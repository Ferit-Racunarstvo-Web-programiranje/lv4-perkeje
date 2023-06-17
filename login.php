<?php
session_start();
include("db.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $admin_email = $_POST['email'];
    $admin_password = hash('sha256', $_POST['password']);

    $sql = "SELECT * FROM admins WHERE email = '$admin_email'";
    $result = $spoj->query($sql);
    $admin_data = $result->fetch_assoc();

    if ($admin_password == $admin_data['password']) {
        $_SESSION['loggedin'] = true;
        $_SESSION['email'] = $admin_email;
        header("location: dashboard.php");
        exit;
    } else {
        $error = "Invalid email or password.";
    }
}

if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
    header("location: dashboard.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles/login.css">
    <title>Login</title>
</head>
<body>
<nav class="nav-web-market">
        <h1><a href="index.php">Web Market</a></h1>
    </nav>
    <div class="login-form">
        <form action="" method="post">
            <h2 class="text-center">Log in</h2>       
            <div class="form-group">
                <input type="email" class="form-control" placeholder="Email" required="required" name="email">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Password" required="required" name="password">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block">Log in</button>
            </div>
        </form>
    </div>
</body>
</html>
