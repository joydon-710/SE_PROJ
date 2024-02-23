CREATE DATABASE  CCI_c;


USE CCI_c;

-- Create the customer_signin table
CREATE TABLE  customer_signin (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

-- Create the customer_signup table
CREATE TABLE  customer_signup (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(50) NOT NULL
);

-- Create the customer_orders table
CREATE TABLE IF NOT EXISTS customer_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer_signup(customer_id)
);

-- Create the customer_bank_details table
CREATE TABLE  customer_bank_details (
    bank_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    bank_name VARCHAR(100) NOT NULL,
    account_number VARCHAR(50) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer_signup(customer_id)
);

-- Create the customer_product_list table
CREATE TABLE  customer_product_list (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Create the customer_cart table
CREATE TABLE  customer_cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer_signup(customer_id),
    FOREIGN KEY (product_id) REFERENCES customer_product_list(product_id)
);

-- Create the customer_payments table
CREATE TABLE  customer_payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES customer_orders(order_id)
);
