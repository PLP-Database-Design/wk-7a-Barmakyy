-- Question 1:
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (103, 'Emily Clark', 'Phone');

-- Question 2:
-- Step 1: Create Orders table (remove partial dependency)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Insert unique orders
INSERT INTO Orders VALUES (101, 'John Doe');
INSERT INTO Orders VALUES (102, 'Jane Smith');
INSERT INTO Orders VALUES (103, 'Emily Clark');

-- Step 3: Create OrderItems table (only fully functional dependencies)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 4: Insert order items
INSERT INTO OrderItems VALUES (101, 'Laptop', 2);
INSERT INTO OrderItems VALUES (101, 'Mouse', 1);
INSERT INTO OrderItems VALUES (102, 'Tablet', 3);
INSERT INTO OrderItems VALUES (102, 'Keyboard', 1);
INSERT INTO OrderItems VALUES (102, 'Mouse', 2);
INSERT INTO OrderItems VALUES (103, 'Phone', 1);

