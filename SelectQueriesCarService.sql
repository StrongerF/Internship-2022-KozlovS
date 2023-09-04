-- ������ ������� �� �� ����� (�� ������ ��������)
SELECT PriceOfOrders.ID, PriceOfOrders.VIN_Car, 
	   PriceOfOrders.Price, PriceOfOrders.Date
FROM PriceOfOrders, Clients, Cars
WHERE Cars.ID_Owner = Clients.ID 
	AND PriceOfOrders.VIN_Car = Cars.VIN 
	AND Clients.PhoneNumber LIKE '%+7(900)694%';

-- ������ ���� �� �������
SELECT Cars.VIN, Cars.Brand, Cars.Model, Cars.Year, Cars.CarNumbers
FROM Cars, Clients
WHERE Cars.ID_Owner = Clients.ID
	AND Clients.PhoneNumber LIKE '%+7(900)694%';

-- ������ �����
SELECT Services.Name, Types.Name AS Types
FROM Services, Types
WHERE Services.Type = Types.ID
ORDER BY Services.Name;

-- ���������� ��������� ������� �� ������ ������
SELECT Details.Name, Details.Unit, Warehouses.Name, 
	   DetailsInWarehouses.Amount AS ����������
FROM Details, Warehouses, DetailsInWarehouses
WHERE Warehouses.ID = DetailsInWarehouses.ID_Warehouse
	AND Details.ID = DetailsInWarehouses.ID_Detail
	AND Details.Name LIKE '%��������%';

-- ����� �������������� ������ �� �����������
SELECT TOP(1)Services.Name, 
	   COUNT(ServicesForOrder.ID_Service) AS [���������� ����������]
FROM Services, ServicesForOrder
WHERE Services.ID = ServicesForOrder.ID_Service
GROUP BY Services.Name;

-- ������ ������
SELECT Services.Name, Types.Name AS Type, 
	   Price = CASE Orders.Priority
		   WHEN '�������' THEN ServicesForOrder.Price*1.5
		   WHEN '�������' THEN ServicesForOrder.Price*1.25
		   WHEN '������' THEN ServicesForOrder.Price
	   END
FROM Services, Orders, ServicesForOrder, Types
WHERE Services.Type = Types.ID
	AND ServicesForOrder.ID_Service = Services.ID
	AND ServicesForOrder.ID_Order = Orders.ID
	AND Orders.ID = 3;

-- ������� �� �����
SELECT SUM(PriceOfOrders.Price) AS �������, 
	   MONTH(PriceOfOrders.Date) AS �����, 
	   Year(PriceOfOrders.Date) AS ���
FROM PriceOfOrders
WHERE MONTH(PriceOfOrders.Date) = MONTH(GETDATE())-1
	AND YEAR(PriceOfOrders.Date) = YEAR(GETDATE())
GROUP BY MONTH(PriceOfOrders.Date), Year(PriceOfOrders.Date);

-- ������� ������� �� �� �����
SELECT Clients.Surname, Clients.Name, Clients.Patronymic, 
	   SUM(PriceOfOrders.Price) AS �������
FROM Clients, Cars, PriceOfOrders
WHERE PriceOfOrders.VIN_Car = Cars.VIN 
	AND Cars.ID_Owner = Clients.ID
	AND Clients.PhoneNumber LIKE '%+7(900)694%'
GROUP BY Clients.ID, Clients.Surname, 
		 Clients.Name, Clients.Patronymic;

-- ������ � ������� �����������
SELECT * FROM Orders
WHERE Priority LIKE '%�������%';

-- ������ ��������
SELECT TOP(1) Employees.Surname, Employees.Name, Employees.Patronymic, 
	   COUNT(EmployeesForOrder.ID_Employee) AS [���������� �������],
	   Employees.Position, Employees.PhoneNumber, 
	   MONTH(GETDATE())-1 AS �����, YEAR(GETDATE()) AS ���
FROM Employees, EmployeesForOrder, Orders
WHERE MONTH(Orders.Date) = MONTH(GETDATE())-1
	AND YEAR(Orders.Date) = YEAR(GETDATE())
	AND Orders.ID = EmployeesForOrder.ID_Order
	AND Employees.ID = EmployeesForOrder.ID_Employee
GROUP BY Employees.Surname, Employees.Name, Employees.Patronymic, 
		 Employees.Position, Employees.PhoneNumber
ORDER BY [���������� �������] DESC;































-- ����� ������, �������� ���������
CREATE VIEW PriceOfOrders
AS
SELECT Orders.ID, Orders.VIN_Car, Cars.Brand, Cars.Model, Orders.Priority, SUM(CASE Orders.Priority
															WHEN '�������' THEN ServicesForOrder.Price*1.5
															WHEN '�������' THEN ServicesForOrder.Price*1.25
															WHEN '������' THEN ServicesForOrder.Price
														END) AS Price,
														Orders.Date
FROM Orders, ServicesForOrder, Cars
WHERE ServicesForOrder.ID_Order = Orders.ID AND Cars.VIN = Orders.VIN_Car
GROUP BY Orders.ID, Orders.VIN_Car, Orders.Priority, Cars.Brand, Cars.Model, Orders.Date;

