-- Question 1: Transform ProductDetail table into 1NF by removing repeating groups and ensuring each cell contains atomic values.
CREATE TABLE ProductDetail(
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);
-- Inserting data into the ProductDetail table
INSERT INTO ProductDetail (OrderID, CustomerName, Products)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');
-- The above table is in 1NF as it has no repeating groups and each cell contains atomic values.


-- Question 2: A SQL query to transform table in 1NF to 2NF by removing partial dependencies with each non-key column fully dependent on the entire primary key.
CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Orders(OrderID, CustomerName)
VALUES 
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

CREATE TABLE Products(
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Products(OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
-- The above tables are in 2NF as all non-key attributes are fully functionally dependent on the primary key.