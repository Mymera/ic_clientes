<?php

$server = 'localhost';
$username = 'root';
$password = '';
$database = 'sistema_telefonico';

try {

    $conn = new PDO("mysql:host=$server;dbname=$database;", $username, $password);
}
catch (PDOException $e) {
    die('Connection failed: '.$e->getMessage());
    
        
}

?>