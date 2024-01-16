<?php

// input filename you set
// on the client side

// $dir_name = 

$filename = 'file';
$target_dir = "uploads/";



$uploaded_file = $_FILES['file'];
$tmp_file_name = $uploaded_file['tmp_name'];
$upload_file_path = $uploaded_file['name'];

$targetFile = $target_dir . $upload_file_path;

$file_exists = file_exists($targetFile);


if (!$file_exists) {
    if (move_uploaded_file($tmp_file_name, $targetFile)) {
        echo "File Uploaded Successfully!";
    } else {
        echo "Error uploading the file!";
    }
} else {
    echo "File '" . $upload_file_path . "' already exists!";
}


// +91 8899 894840