<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ecommerce";

$spoj  = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($spoj ->connect_error) {
  die("Došlo je do greške: " . $spoj ->connect_error);
}
//echo "Konekcija s bazom je uspjela";
?>