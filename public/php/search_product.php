<?php

/*
***********************************************
*                                             *
*              Author: Shuja Ahmad Tak        *
*              Date: 15-01-2024               *
*              Time: 23:03                    *
*                                             *
*                                             *
***********************************************

*/

// Include the database connection file
require 'db_connection.php';

// Get the JSON input and decode it
$inputJSON = file_get_contents("php://input");
$input = json_decode($inputJSON);

// Array to store search results
$searchResults = array();

// Extract the search query from input
$product_query =  $input->search_query;

// Debug: Echo the search query
// Remove this line in production


// Use preppared statement to prevent SQL injection
// Resource: https://websitebeaver.com/prepared-statements-in-php-mysqli-to-prevent-sql-injection


$sql_search_query = "SELECT * FROM items WHERE item_name LIKE ?";

// Prepare the statement
$stmt = mysqli_prepare($conn, $sql_search_query);

if ($stmt) {
    // Bind the parameter
    mysqli_stmt_bind_param($stmt, "s", $param_product_query);

    // set the parameter value
    $param_product_query = '%' . $product_query . '%';

    // Execute the statement
    mysqli_stmt_execute($stmt);

    // get the result
    $result = mysqli_stmt_get_result($stmt);

    // Check if the query execution was successful
    if (!$result) {
        echo json_encode(["error" => "Error executing query: " . mysqli_error($conn)]);
    } else {
        // Check if there are any matching items
        if (mysqli_num_rows($result) > 0) {
            // Loop through the results and store them in the searchResults array
            while ($row = mysqli_fetch_assoc($result)) {
                $searchResults[] = $row;
            }

            // Echo the search results in JSON format
            echo json_encode($searchResults);
        } else {
            // Echo a message if no items are found
            echo json_encode(["message" => "No items found!"]);
        }

        // Close the statement
        mysqli_stmt_close($stmt);
    }
} else {
    echo json_encode(["error" => "Error preparing statement: " . mysqli_error($conn)]);
}

// Close the database connection
mysqli_close($conn);
