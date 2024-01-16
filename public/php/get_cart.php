<?php

/*





PROCEDURE:
1. SELECT UID
2. SELECT ALL FROM ORDERS WITH SIMILAR UID

SELECT * FROM orders
JOIN items ON orders.product_id = items.id
WHERE orders.user_id = 2;

SELECT * FROM orders: fetch all items from the orders



*/

$conn = new mysqli('localhost', 'shuja', 'delight@123', 'delight');

// Check for database connection errors
if ($conn->connect_error) {
    die(json_encode(array('message' => "Connection failed: " . $conn->connect_error)));
}

$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON);
$uid = $input->uid;



// Select all users where uid matcher

$sql = "SELECT * FROM users WHERE uid='$uid'";
$res = $conn->query($sql);

if (!$res) {
    die(json_encode(array("Error" => "error executing the select users query!")));
}

// GET THE 
$id = $res->fetch_assoc()["id"];

// if successfull, then print out the values
$users = array("Users" => $res->fetch_assoc());
// echo json_encode($users);


// Select all orders where the uid matches
$ordersSQL = "SELECT * FROM orders  JOIN items on orders.product_id = items.id where orders.user_id=$id";

$res = $conn->query($ordersSQL);

if (!$res) {
    die(json_encode(array("Error" => "error executing the select users query!")));
}


$cart_items = array();
// if successfull, then print out all the values
while ($orders = $res->fetch_assoc()) {
    $cart_items[] = $orders;
}
// $users = array("Products" => $res->fetch_assoc());
echo json_encode($cart_items);
