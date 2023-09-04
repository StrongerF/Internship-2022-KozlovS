-- Заказы клиента за всё время (по номеру телефона)
SELECT PriceOfOrders.ID, PriceOfOrders.VIN_Car, 
	   PriceOfOrders.Price, PriceOfOrders.Date
FROM PriceOfOrders, Clients, Cars
WHERE Cars.ID_Owner = Clients.ID 
	AND PriceOfOrders.VIN_Car = Cars.VIN 
	AND Clients.PhoneNumber LIKE '%+7(900)694%';

-- Список всех ТС клиента
SELECT Cars.VIN, Cars.Brand, Cars.Model, Cars.Year, Cars.CarNumbers
FROM Cars, Clients
WHERE Cars.ID_Owner = Clients.ID
	AND Clients.PhoneNumber LIKE '%+7(900)694%';

-- Список услуг
SELECT Services.Name, Types.Name AS Types
FROM Services, Types
WHERE Services.Type = Types.ID
ORDER BY Services.Name;

-- Количество выбранных деталей на каждом складе
SELECT Details.Name, Details.Unit, Warehouses.Name, 
	   DetailsInWarehouses.Amount AS Количество
FROM Details, Warehouses, DetailsInWarehouses
WHERE Warehouses.ID = DetailsInWarehouses.ID_Warehouse
	AND Details.ID = DetailsInWarehouses.ID_Detail
	AND Details.Name LIKE '%антифриз%';

-- Самая востребованная услуга на предприятии
SELECT TOP(1)Services.Name, 
	   COUNT(ServicesForOrder.ID_Service) AS [Количество применений]
FROM Services, ServicesForOrder
WHERE Services.ID = ServicesForOrder.ID_Service
GROUP BY Services.Name;

-- Услуги заказа
SELECT Services.Name, Types.Name AS Type, 
	   Price = CASE Orders.Priority
		   WHEN 'Высокий' THEN ServicesForOrder.Price*1.5
		   WHEN 'Средний' THEN ServicesForOrder.Price*1.25
		   WHEN 'Низкий' THEN ServicesForOrder.Price
	   END
FROM Services, Orders, ServicesForOrder, Types
WHERE Services.Type = Types.ID
	AND ServicesForOrder.ID_Service = Services.ID
	AND ServicesForOrder.ID_Order = Orders.ID
	AND Orders.ID = 3;

-- Прибыль за месяц
SELECT SUM(PriceOfOrders.Price) AS Прибыль, 
	   MONTH(PriceOfOrders.Date) AS Месяц, 
	   Year(PriceOfOrders.Date) AS Год
FROM PriceOfOrders
WHERE MONTH(PriceOfOrders.Date) = MONTH(GETDATE())-1
	AND YEAR(PriceOfOrders.Date) = YEAR(GETDATE())
GROUP BY MONTH(PriceOfOrders.Date), Year(PriceOfOrders.Date);

-- Затраты клиента за всё время
SELECT Clients.Surname, Clients.Name, Clients.Patronymic, 
	   SUM(PriceOfOrders.Price) AS Затраты
FROM Clients, Cars, PriceOfOrders
WHERE PriceOfOrders.VIN_Car = Cars.VIN 
	AND Cars.ID_Owner = Clients.ID
	AND Clients.PhoneNumber LIKE '%+7(900)694%'
GROUP BY Clients.ID, Clients.Surname, 
		 Clients.Name, Clients.Patronymic;

-- Заказы с высоким приоритетом
SELECT * FROM Orders
WHERE Priority LIKE '%Высокий%';

-- Лучший работник
SELECT TOP(1) Employees.Surname, Employees.Name, Employees.Patronymic, 
	   COUNT(EmployeesForOrder.ID_Employee) AS [Количество заказов],
	   Employees.Position, Employees.PhoneNumber, 
	   MONTH(GETDATE())-1 AS Месяц, YEAR(GETDATE()) AS Год
FROM Employees, EmployeesForOrder, Orders
WHERE MONTH(Orders.Date) = MONTH(GETDATE())-1
	AND YEAR(Orders.Date) = YEAR(GETDATE())
	AND Orders.ID = EmployeesForOrder.ID_Order
	AND Employees.ID = EmployeesForOrder.ID_Employee
GROUP BY Employees.Surname, Employees.Name, Employees.Patronymic, 
		 Employees.Position, Employees.PhoneNumber
ORDER BY [Количество заказов] DESC;































-- Сумма заказа, учитывая приоритет
CREATE VIEW PriceOfOrders
AS
SELECT Orders.ID, Orders.VIN_Car, Cars.Brand, Cars.Model, Orders.Priority, SUM(CASE Orders.Priority
															WHEN 'Высокий' THEN ServicesForOrder.Price*1.5
															WHEN 'Средний' THEN ServicesForOrder.Price*1.25
															WHEN 'Низкий' THEN ServicesForOrder.Price
														END) AS Price,
														Orders.Date
FROM Orders, ServicesForOrder, Cars
WHERE ServicesForOrder.ID_Order = Orders.ID AND Cars.VIN = Orders.VIN_Car
GROUP BY Orders.ID, Orders.VIN_Car, Orders.Priority, Cars.Brand, Cars.Model, Orders.Date;

