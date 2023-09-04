CREATE TRIGGER AutoCompleteDateAfterAddEmployee
ON Employees
AFTER INSERT
AS
UPDATE Employees
SET StartDate = GETDATE()
WHERE ID = (SELECT ID FROM inserted);

CREATE TRIGGER AutoCompleteDateAfterAddOrder
ON Orders
AFTER INSERT
AS
UPDATE Orders
SET Date = GETDATE()
WHERE ID = (SELECT ID FROM inserted);

