-- Question 1: Create a table in 1NF format and insert data with one product per row.
CREATE TABLE ProductDetail(
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Insert data with one product per row (1NF)
INSERT INTO ProductDetail (OrderID, CustomerName, Products)
SELECT 101, 'John Doe', 'Laptop'
UNION ALL
SELECT 101, 'John Doe', 'Mouse'
UNION ALL
SELECT 102, 'Jane Smith', 'Tablet'
UNION ALL
SELECT 102, 'Jane Smith', 'Keyboard'
UNION ALL
SELECT 102, 'Jane Smith', 'Mouse'
UNION ALL
SELECT 103, 'Emily Clark', 'Phone';

-- Question 2: Create a table in 2NF format and insert data with no partial dependencies.
-- Step 1: Create the Orders2NF table (stores OrderID and CustomerName)
CREATE TABLE Orders2NF (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Insert distinct OrderID + CustomerName records
INSERT INTO Orders2NF (OrderID, CustomerName)
VALUES 
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 3: Create the OrderItems2NF table (stores Product and Quantity per Order)
CREATE TABLE OrderItems2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders2NF(OrderID)
);

-- Step 4: Insert OrderItem records
INSERT INTO OrderItems2NF (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);


