-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL
);

-- Create users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL -- Add more fields as needed
);

-- Create orders table
CREATE TABLE orders (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    uid VARCHAR(50) NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    UNIQUE KEY unique_cart_item (user_id, product_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES items(id)
);

create table orders(
    card_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    uid VARCHAR(50) not null,
    product_id int not null,
    quantity int not null,
    price decimal(10, 2) not null,
    foreign key (user_id) references users(id),
    foreign key (product_id) references items(id)
);

-- product_code varchar(50) not null unique,
-- status VARCHAR(50) DEFAULT 'in cart',
-- timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
/*
 MariaDB [delight]> create table orders(
 -> orderID int not null,
 -> orderCode text not null,
 -> userID int,
 -> primary key(orderID),
 -> foreign key (userID) references users(id)
 -> );
 
 UPDATED
 
 MariaDB [delight]> create table orders(
 -> orderID int not null auto_increment, 
 -> orderCode text not null,
 -> userID int not null,
 -> quantity int not null,
 -> primary key(orderID),
 -> foreign key (userID) references users(id)
 -> );
 
 
 UPDATED
 create table orders(
 orderID int not null auto_increment,
 orderCode text not null unique, 
 userID int not null, 
 quantity int not null, 
 primary key(orderID), 
 foreign key (userID) references users(id)
 );
 
 UPDATED
 
 MariaDB [delight]> create table orders(
 -> orderID int not null auto_increment,
 -> product json not null,
 -> orderCode text not null unique,
 -> userID int not null,
 -> quantity int not null,
 -> primary key(orderID),
 -> foreign key (userID) references users(id)
 -> );
 
 
 
 */