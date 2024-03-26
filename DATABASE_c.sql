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

INSERT INTO customer_signin (username, password) VALUES
('john_doe', 'password123'),
('jane_smith', 'securepass'),
('bob_jones', 'letmein');

INSERT INTO customer_signup (username, email, password) VALUES
('john_doe', 'john@example.com', 'password123'),
('jane_smith', 'jane@example.com', 'securepass'),
('bob_jones', 'bob@example.com', 'letmein');

INSERT INTO customer_orders (customer_id, total_amount) VALUES
(1, 50.00),
(2, 75.00),
(3, 100.00);

INSERT INTO customer_bank_details (customer_id, bank_name, account_number) VALUES
(1, 'Bank of America', '1234567890'),
(2, 'Chase Bank', '0987654321'),
(3, 'Wells Fargo', '1357924680');

INSERT INTO customer_product_list (product_name, price) VALUES
('Product A', 10.00),
('Product B', 20.00),
('Product C', 30.00);

INSERT INTO customer_cart (customer_id, product_id, quantity) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3);

INSERT INTO customer_payments (order_id, amount) VALUES
(1, 20.00),
(2, 15.00),
(3, 50.00);

-- Retrieve customer information along with their orders:
SELECT c.customer_id, c.username, o.order_id, o.order_date, o.total_amount
FROM customer_signup c
JOIN customer_orders o ON c.customer_id = o.customer_id;

-- Retrieve customer's cart items:
SELECT c.username, p.product_name, cart.quantity
FROM customer_signup c
JOIN customer_cart cart ON c.customer_id = cart.customer_id
JOIN customer_product_list p ON cart.product_id = p.product_id;





