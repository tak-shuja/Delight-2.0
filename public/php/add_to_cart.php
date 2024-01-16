<?php

$conn = new mysqli('localhost', 'shuja', 'delight@123', 'delight');

if (!$conn) {
    die("Error: " . $conn->error);
}


$inputJSON = file_get_contents("php://input");
$input =  json_decode($inputJSON);

$uid = $input->user_id;
$product_code = $input->code;
$product_id = $input->product_id;
$product_price = $input->product_price;




$sql = "select * from users where uid='$uid'";
// echo $sql;
$res = $conn->query($sql);


// if (!$res) {
//     echo "ERROR";
// }


if ($res->num_rows > 0) {
    while ($row = $res->fetch_assoc()) {
        $id = $row['id'];
    }
} else {
    echo json_encode(array("status" => "no users found!"));
}



$quantity = 1;



$sql = "insert into orders(user_id, uid, product_id, quantity, price)
        values('$id', '$uid', '$product_id', '$quantity', '$product_price')
        on duplicate key update quantity = quantity + 1;";
// echo $sql;
$res = $conn->query($sql);

// echo $conn->error;

if (!$res) {
    echo json_encode(array("status" => "error"));
} else {
    // echo $conn->errno;
    echo json_encode(array("status" => "ok"));
}

$conn->close();
