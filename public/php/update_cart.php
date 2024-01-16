<?php

$conn = new mysqli('localhost', 'shuja', 'delight@123', 'delight');

// Check for database connection errors
if ($conn->connect_error) {
    die(json_encode(array('message' => "Connection failed: " . $conn->connect_error)));
}

$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON);


$uid = $input->uid;
$product_id = $input->product_id;
$updateValue = $input->updateValue;


echo json_encode(array('uid' => $uid, 'code: ' => $code, 'updatedValue: ' => $updateValue));


$sql = "SELECT * FROM users WHERE uid='$uid'";
$res = $conn->query($sql);

// while ($row = $res->fetch_assoc()) {
//     echo $row;
// }


// $sql = "insert into orders(user_id, uid, product_id, quantity, price)
//         values('$id', '$uid', '$product_id', '$quantity', '$product_price')
//         on duplicate key update quantity = quantity + 1;";


// Check for user query errors
if (!$res) {


    die(json_encode(array('message' => "User Select Query Error: " . $conn->error)));
} else if ($row = $res->fetch_assoc()) {



    $id = $row['id'];
    if (!$res) {
        die(json_encode(array('message' => "Order Select Query Error: " . $conn->error)));
    }


    $sql = "UPDATE orders set quantity = quantity + $updateValue WHERE product_id='$product_id'";

    echo $sql;

    $res = $conn->query($sql);

    if (!$res) {
        die(json_encode(array("status" => "Delete Failed")));
    } else {
        echo json_encode(array("status" => "Ok",));
    }
    // } else {
    //     echo json_encode(array("message" => "Item cannot be set less than 0"));
    // }
} else {
    echo json_encode(array('message' => "User not found"));
}


// echo json_encode(array("Hello" => "World"));
$conn->close();
