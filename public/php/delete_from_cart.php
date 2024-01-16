<?php

require_once 'db_connection.php';

$inputJSON = file_get_contents("php://input");

$input = json_decode($inputJSON);

$uid = $input->uid;
$product_id = $input->product_id;


// echo $uid;
// echo "              ";
// echo $product_id;


$sql = "delete from orders where uid='$uid' and product_id='$product_id'";

$res = $conn->query($sql);

if (!$res) {
    die('error deleting item');
}

$resp = array("message" => "deleted");

echo json_encode($resp);
