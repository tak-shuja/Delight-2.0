<?php

// Database connection parameters
$host = 'localhost';
$username = 'shuja';
$password = 'delight@123';
$database = 'delight';

// Create a new mysqli object with the connection parameters
$conn = new mysqli($host, $username, $password, $database);

// Check for any connection errors
if ($conn->connect_error) {
    // If an error occurred, return a JSON response with the error message
    die(json_encode(array('message' => "Connection failed: " . $conn->connect_error)));
}

// If no errors occurred, the connection is successful and the script can proceed
// to execute queries on the database using the $conn object.