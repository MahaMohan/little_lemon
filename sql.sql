CREATE DATABASE IF NOT EXISTS LittleLemon;
USE LittleLemon;

CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    BookingDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE IF NOT EXISTS Menu (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS MenuItems (
    ItemID INT PRIMARY KEY,
    MenuID INT,
    ItemName VARCHAR(100),
    Price DECIMAL(6,2),
    FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
);

CREATE TABLE IF NOT EXISTS Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ItemID INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
);

INSERT INTO Customers (CustomerID, Name, Email) VALUES
(1, 'Alice Smith', 'alice@example.com'),
(2, 'Bob Johnson', 'bob@example.com'),
(3, 'Charlie Lee', 'charlie@example.com');

INSERT INTO Bookings (BookingID, CustomerID, BookingDate) VALUES
(101, 1, '2025-07-01'),
(102, 2, '2025-07-02'),
(103, 3, '2025-07-03');

INSERT INTO Menu (MenuID, MenuName) VALUES
(1, 'Breakfast'),
(2, 'Lunch'),
(3, 'Dinner');

INSERT INTO MenuItems (ItemID, MenuID, ItemName, Price) VALUES
(1, 1, 'Pancakes', 5.99),
(2, 2, 'Burger', 9.99),
(3, 3, 'Steak', 15.99);

INSERT INTO Staff (StaffID, Name, Role) VALUES
(1, 'Emma Brown', 'Manager'),
(2, 'Liam White', 'Chef'),
(3, 'Olivia Black', 'Waiter');

INSERT INTO Orders (OrderID, CustomerID, ItemID, Quantity, OrderDate) VALUES
(201, 1, 1, 2, '2025-07-01'),
(202, 2, 2, 1, '2025-07-02'),
(203, 3, 3, 3, '2025-07-03');
