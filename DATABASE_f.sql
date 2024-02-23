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
