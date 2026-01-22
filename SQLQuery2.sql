CREATE DATABASE ShopDB;
USE ShopDB;
CREATE TABLE Brands
(
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) CHECK (Price > 0),
    BrandId INT NOT NULL,
    CreatedDate DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Products_Brands
    FOREIGN KEY (BrandId) REFERENCES Brands(Id)
);
INSERT INTO Brands (Name)
VALUES
('Apple'),
('Samsung'),
('Xiaomi'),
('HP');
INSERT INTO Products (Name, Price, BrandId)
VALUES
('iPhone 14', 1800, 1),
('Galaxy S23', 1600, 2),
('Redmi Note 12', 600, 3),
('MacBook Air', 2200, 1),
SELECT 
    p.Name AS ProductName,
    b.Name AS BrandName,
    p.Price
FROM Products p
<<<<<<< HEAD
JOIN Brands b ON p.BrandId = b.Id;
SELECT 
    p.Name AS ProductName,
    b.Name AS BrandName,
    p.Price
FROM Products p
INNER JOIN Brands b ON p.BrandId = b.Id;
SELECT 
    b.Name AS BrandName,
    MAX(p.Price) AS MaxPrice
