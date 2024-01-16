<?php

require 'db_connection.php';

$query = "SELECT * FROM items";
$result = $conn->query($query);

if (!$result) {
    die("Error fetching data: " . $conn->error);
}

$items = array();

while ($row = $result->fetch_assoc()) {
    $items[] = $row;
}

header('Content-Type: application/json');
echo json_encode($items);

$conn->close();
