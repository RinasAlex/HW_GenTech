-- Вывести стоимость заказа 10258

SELECT 
OrderDetails.OrderID,
SUM(OrderDetails.Quantity * Products.Price) AS TotalOrderCost

FROM OrderDetails

JOIN Products ON OrderDetails.ProductID = Products.ProductID

WHERE
OrderID = 10258

-- Вывести кол/распределение заказов по клиентам (проекция: имяклиента, ко-возаказов)

SELECT 
Customers.CustomerName,
COUNT(*) AS total_orders

FROM Orders

JOIN Customers ON Orders.CustomerID = Customers.CustomerID

GROUP BY Orders.CustomerID
ORDER BY total_orders DESC

-- Вывести кол/распределение заказов по менеджерам (проекция: фамилияменеджера, ко-возаказов)

SELECT 
Employees.LastName,
COUNT(*) AS total_orders

FROM Orders

JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID

GROUP BY Orders.EmployeeID

-- Вывести минимальную стоимость товаров для каждой категории (проекция: названиекатегории, минстоимость_товаров)

SELECT 
Categories.CategoryName,
MIN(Products.Price) AS min_price

FROM Products

JOIN Categories ON Products.CategoryID = Categories.CategoryID

GROUP BY Products.CategoryID

-- Вывести данные о заказах (проекция: номерзаказа, стоимостьзаказа)

SELECT 
OrderDetails.OrderID,
SUM(OrderDetails.Quantity * Products.Price) AS TotalOrderCost

FROM OrderDetails

JOIN Products ON OrderDetails.ProductID = Products.ProductID

GROUP BY OrderDetails.OrderID


-- Вывести доход каждого менеджера за весь период, исходя из ставки в 5% от суммы его заказов (проекция: фамилия_менеджера, доход)

