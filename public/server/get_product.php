<?php 


require 'db_connection.php';


if(isset($_GET['product'])) {
    $product = $_GET['product'];

    echo $product;
}


?>