<?php


header('Access-Control-Allow-Origin: *');

header('Access-Control-Allow-Methods: GET, POST');

header("Access-Control-Allow-Headers: X-Requested-With");
require 'db_connection.php';


$formInput = file_get_contents('php://input');

$input = json_decode($formInput);

// echo $input;

$uid = $input->uid;
$email = $input->email;
echo $uid;


if ($uid != '' || $email != '') {
    $sql = "insert into users(uid, email) values('$uid', '$email')";
    $res = $conn->query($sql);
} else {
    $res = false;
}
if ($res) {
    echo "SUCCESS";
} else {
    echo "ERROR";
}
