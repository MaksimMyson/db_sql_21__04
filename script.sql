USE [db_sql_21__04];
CREATE TRIGGER CheckExistingGoods
ON Goods
INSTEAD OF INSERT
AS
BEGIN
    -- ѕерев≥р€Їмо, чи ≥снуЇ вже такий товар на склад≥
    IF EXISTS (SELECT 1 FROM Goods G JOIN INSERTED I ON G.Name = I.Name)
    BEGIN
        -- якщо товар вже ≥снуЇ, оновлюЇмо к≥льк≥сть товару
        UPDATE Goods
        SET Quantity = Quantity + I.Quantity
        FROM Goods G
        JOIN INSERTED I ON G.Name = I.Name;
    END
    ELSE
    BEGIN
        -- якщо товар не ≥снуЇ, додаЇмо його
        INSERT INTO Goods (Name, Type, Quantity, ProdCost, Manufacturer, Price)
        SELECT Name, Type, Quantity, ProdCost, Manufacturer, Price
        FROM INSERTED;
    END
END;
GO

-- “ригер дл€ перенесенн€ ≥нформац≥њ про зв≥льненого сп≥вроб≥тника до таблиц≥ "јрх≥в сп≥вроб≥тник≥в"
CREATE TRIGGER TransferToEmployeeArchive
ON Employees
AFTER DELETE
AS
BEGIN
    INSERT INTO EmployeeArchive (EmployeeId, Position, EmploymentDate, Gender, Salary)
    SELECT EmployeeId, Position, EmploymentDate, Gender, Salary
    FROM DELETED;
END;
GO

-- “ригер дл€ перев≥рки к≥лькост≥ продавц≥в перед додаванн€м нового
CREATE TRIGGER CheckSellerLimit
ON Employees
INSTEAD OF INSERT
AS
BEGIN
    -- ѕерев≥р€Їмо к≥льк≥сть ≥снуючих продавц≥в
    IF (SELECT COUNT(*) FROM Employees WHERE Position = 'Seller') >= 6
    BEGIN
        RAISERROR ('Cannot add new seller. The maximum number of sellers (6) has been reached.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        -- ƒодаЇмо нового продавц€
        INSERT INTO Employees (Position, EmploymentDate, Gender, Salary)
        SELECT Position, EmploymentDate, Gender, Salary
        FROM INSERTED;
    END
END;
GO

