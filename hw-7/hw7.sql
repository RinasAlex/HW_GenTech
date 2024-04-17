-- Вывести компании-перевозчиков, которые доставили клиентам более 250 заказов (проекция: название_компании, ко-во заказов)

SELECT 
Shippers.ShipperName,
COUNT(*) AS total__orders

FROM Orders

JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY Shippers.ShipperID	

HAVING
total__orders > 250

-- Вывести заказы, где ко-во товаров 3 и более (проекция: номерзаказа, ко-вотовароввзаказе)

SELECT 
OrderDetails.OrderID,
COUNT(*) AS total__products 

FROM OrderDetails

JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY OrderDetails.OrderID

HAVING
total__products >= 3
ORDER BY total__products DESC

-- Вывести минимальную стоимость товара для каждой категории, кроме категории 2 (проекция: названиекатегории, минстоимость_товара)

SELECT 
Categories.CategoryName,
MIN(Price) AS min_price

FROM Products

JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryID

HAVING
NOT Categories.CategoryID = 2

-- Вывести менеджера, который находится на 4 месте по ко-ву созданных заказов (проекция: фамилияменеджера, к-восозданных_заказов)

SELECT 
Employees.LastName,
COUNT(*) AS total_orders 

FROM Orders

JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID

ORDER BY total_orders DESC
LIMIT 3,1

-- Вывести данные о товарах от поставщиков 4 и 8 (проекция: всеимеющиесяполя, ценасоскидкой1.5процента, ценаснаценкой0.5процента)

SELECT *,
Price * .985 AS price_down,
Price * 1.95 AS price_up

FROM Products

WHERE
SupplierID IN (4, 8)

