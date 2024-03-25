-- 1. Вывести ко-во поставщиков не из UK и не из China

SELECT 
COUNT(*) AS total_suppliers

FROM Suppliers

WHERE
Country NOT IN ('UK', 'China')

-- 2. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

SELECT 
AVG(Price) AS avg_price,
MAX(Price) AS max_price,
MIN(Price) AS min_price,

AVG(Unit) AS avg_unit,
MAX(Unit) AS max_unit,
MIN(Unit) AS min_unit

FROM Products

WHERE
CategoryID IN (3, 5)

-- 3. Вывести общую сумму проданных товаров

SELECT 
COUNT(Products.Price) AS total

FROM OrderDetails

JOIN Products ON OrderDetails.ProductID = Products.ProductID

-- 4. Вывести данные о заказах (номерзаказа, имяклиента, странаклиента, фамилияменеджера, названиекомпанииперевозчика)

SELECT 
Orders.OrderID,
Customers.CustomerName,
Customers.Country,
Employees.LastName,
Shippers.ShipperName	

FROM Orders

JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID

-- 5. Вывести сумму, на которую было отправлено товаров клиентам в Germany

SELECT 
COUNT(Products.Price) AS total_sum

FROM OrderDetails

JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID 

WHERE 
Country = 'Germany'