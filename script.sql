USE [db_sql_21__04];
GO


INSERT INTO Goods (Name, Type, Quantity, ProdCost, Manufacturer, Price)
VALUES 
    ('Laptop', 'Electronics', 20, 500, 'Tech Inc.', 700),
    ('Smartphone', 'Electronics', 30, 300, 'Tech Inc.', 500),
    ('Headphones', 'Electronics', 50, 50, 'SoundMaster', 100),
    ('Keyboard', 'Electronics', 40, 20, 'Tech Inc.', 30),
    ('Mouse', 'Electronics', 60, 15, 'Tech Inc.', 25);
    

INSERT INTO Sales (Name, Quantity, SaleDate, SellerId, CustomerId)
VALUES 
    ('Laptop', 2, '2024-04-23', 101, 201),
    ('Smartphone', 3, '2024-04-23', 102, 202),
    ('Headphones', 5, '2024-04-23', 103, 203),
    ('Keyboard', 4, '2024-04-23', 104, 204),
    ('Mouse', 6, '2024-04-23', 105, 205);


INSERT INTO Employees (Position, EmploymentDate, Gender, Salary)
VALUES 
    ('Manager', '2018-01-15', 'Male', 50000),
    ('Salesperson', '2020-03-20', 'Female', 30000),
    ('Accountant', '2019-06-10', 'Male', 40000),
    ('Developer', '2022-09-05', 'Female', 60000),
    ('HR Manager', '2017-04-02', 'Male', 45000);


INSERT INTO Customers (Email, Phone, Gender, PurchaseHistory, DiscountPercentage, SignedForMailing)
VALUES 
    ('customer1@example.com', '123456789', 'Male', 'Laptop, Smartphone', 0, 1),
    ('customer2@example.com', '987654321', 'Female', 'Headphones, Keyboard', 0, 0),
    ('customer3@example.com', '555666777', 'Male', 'Mouse', 0, 1),
    ('customer4@example.com', '333222111', 'Female', 'Laptop, Smartphone, Keyboard', 0, 1),
    ('customer5@example.com', '999888777', 'Male', 'Headphones, Mouse', 0, 0);


INSERT INTO History (GoodsName, SalePrice, Quantity, SaleDate, SellerId, CustomerId)
VALUES 
    ('Laptop', 700, 2, '2024-04-23', 101, 201),
    ('Smartphone', 500, 3, '2024-04-23', 102, 202),
    ('Headphones', 100, 5, '2024-04-23', 103, 203),
    ('Keyboard', 30, 4, '2024-04-23', 104, 204),
    ('Mouse', 25, 6, '2024-04-23', 105, 205);


INSERT INTO Archive (Name, Type, Quantity, CostPrice, Manufacturer, Price)
VALUES 
    ('Laptop', 'Electronics', 0, 500, 'Tech Inc.', 700),
    ('Smartphone', 'Electronics', 0, 300, 'Tech Inc.', 500),
    ('Headphones', 'Electronics', 0, 50, 'SoundMaster', 100),
    ('Keyboard', 'Electronics', 0, 20, 'Tech Inc.', 30),
    ('Mouse', 'Electronics', 0, 15, 'Tech Inc.', 25);


INSERT INTO LastUnit (GoodsName, Quantity)
VALUES 
    ('Laptop', 0),
    ('Smartphone', 0),
    ('Headphones', 0),
    ('Keyboard', 0),
    ('Mouse', 0);
