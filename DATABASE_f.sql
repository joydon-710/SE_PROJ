-- Create the CCI_f database
CREATE DATABASE  CCI_f;

-- Use the CCI_f database
USE CCI_f;

-- Create the FarmerSignUp table
CREATE TABLE  FarmerSignUp (
    FarmerID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255),
    Password VARCHAR(255),
    BankName VARCHAR(255),
    AccountNumber VARCHAR(255),
    RoutingNumber VARCHAR(255)
);

-- Create the FarmerSignIn table
CREATE TABLE  FarmerSignIn (
    FarmerID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255),
    Password VARCHAR(255)
);

-- Create the FarmerProductsList table
CREATE TABLE  FarmerProductsList (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    FarmerID INT,
    ProductName VARCHAR(255),
    Price DECIMAL(10,2),
    Description TEXT,
    FOREIGN KEY (FarmerID) REFERENCES FarmerSignUp(FarmerID)
);

-- Create the FarmerProductsSell table
CREATE TABLE FarmerProductsSell (
    SellID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    DateAdded DATE,
    FOREIGN KEY (ProductID) REFERENCES FarmerProductsList(ProductID)
);

-- Create the FarmerBankDetails table
CREATE TABLE  FarmerBankDetails (
    FarmerID INT,
    BankName VARCHAR(255),
    AccountNumber VARCHAR(255),
    RoutingNumber VARCHAR(255),
    FOREIGN KEY (FarmerID) REFERENCES FarmerSignUp(FarmerID)
);

-- Create the FarmerAddToCart table
CREATE TABLE  FarmerAddToCart (
    CartID INT AUTO_INCREMENT PRIMARY KEY,
    FarmerID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (FarmerID) REFERENCES FarmerSignUp(FarmerID),
    FOREIGN KEY (ProductID) REFERENCES FarmerProductsList(ProductID)
);

-- Create the FarmerPayments table
CREATE TABLE  FarmerPayments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    FarmerID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    FOREIGN KEY (FarmerID) REFERENCES FarmerSignUp(FarmerID)
);

INSERT INTO FarmerSignUp (Username, Password, BankName, AccountNumber, RoutingNumber) VALUES
('farmer1', 'password123', 'Bank of America', '1234567890', '987654321'),
('farmer2', 'securepass', 'Chase Bank', '0987654321', '123456789'),
('farmer3', 'letmein', 'Wells Fargo', '1357924680', '246813579');

INSERT INTO FarmerSignIn (Username, Password) VALUES
('farmer1', 'password123'),
('farmer2', 'securepass'),
('farmer3', 'letmein');

INSERT INTO FarmerProductsList (FarmerID, ProductName, Price, Description) VALUES
(1, 'Apples', 2.50, 'Fresh organic apples'),
(2, 'Oranges', 1.75, 'Juicy oranges'),
(3, 'Tomatoes', 3.00, 'Ripe red tomatoes');

INSERT INTO FarmerProductsSell (ProductID, Quantity, DateAdded) VALUES
(1, 100, '2024-03-26'),
(2, 75, '2024-03-26'),
(3, 50, '2024-03-26');

INSERT INTO FarmerBankDetails (FarmerID, BankName, AccountNumber, RoutingNumber) VALUES
(1, 'Bank of America', '1234567890', '987654321'),
(2, 'Chase Bank', '0987654321', '123456789'),
(3, 'Wells Fargo', '1357924680', '246813579');

INSERT INTO FarmerAddToCart (FarmerID, ProductID, Quantity) VALUES
(1, 1, 10),
(2, 2, 5),
(3, 3, 8);

INSERT INTO FarmerPayments (FarmerID, Amount, PaymentDate) VALUES
(1, 25.00, '2024-03-26'),
(2, 15.00, '2024-03-26'),
(3, 24.00, '2024-03-26');

-- Retrieve farmer's products for sale:
SELECT f.Username, p.ProductName, p.Price, p.Description
FROM FarmerSignUp f
JOIN FarmerProductsList p ON f.FarmerID = p.FarmerID;


-- Retrieve farmer's bank details:
SELECT f.Username, b.BankName, b.AccountNumber, b.RoutingNumber
FROM FarmerSignUp f
JOIN FarmerBankDetails b ON f.FarmerID = b.FarmerID;

-- Retrieve products added to the cart by a farmer:
SELECT f.Username, p.ProductName, cart.Quantity
FROM FarmerSignUp f
JOIN FarmerAddToCart cart ON f.FarmerID = cart.FarmerID
JOIN FarmerProductsList p ON cart.ProductID = p.ProductID;
