<?php

$host = 'localhost';
$user = 'shuja';
$pass = 'delight@123';
$database = 'delight';

$conn = new mysqli($host, $user, $pass, $database);

if (!$conn) {
    die("[-] unable to establish a database connection, error: " . mysqli_connect_error());
}


$create_db_query = "CREATE DATABASE IF NOT EXISTS delight";
$create_cart = "CREATE TABLE IF NOT EXISTS cart(code text not null)";


$create_items_table = "CREATE TABLE IF NOT EXISTS items(
        id int not null auto_increment,
        item_name text not null unique,
        item_desc text not null,
        price text not null,
        code text not null unique,
        paths JSON not null,
        primary key(id))
        ";




$create_customers_table = "CREATE TABLE IF NOT EXISTS users(
        id int not null auto_increment,
        username text not null,
        password text not null,
        primary key(id))
        ";

$create_wishlist_table = "CREATE TABLE IF NOT EXISTS wishlist(
        id int not null auto_increment,
        item_code text not null,
        primary key(id))";

$queries = [$create_items_table, $create_cart, $create_customers_table, $create_wishlist_table];


$conn->query($create_db_query);
$conn->select_db($database);

foreach ($queries as $query) {
    $result = $conn->query($query);
    if (!$result) {
        die("[-] error: " . mysqli_error($conn));
    }
}




?>