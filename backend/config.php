<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: POST, GET, DELETE, PUT, UPDATE, PATCH, OPTIONS');
    header('Access-Control-Allow-Headers: tokens, Content-Type');
    header('Access-Control-Max-Age: 1728000');
    header('Content-Length: 0');
    header('Content-Type: text/plain');

    $conn = mysqli_connect("localhost", "root", "", "suguba") or die("Connection error!!!");
?>
