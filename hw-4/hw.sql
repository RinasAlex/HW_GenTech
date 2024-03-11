-- Вывести данные о товарах (проекция: названиетовара, цена, названиекатегории, названиекомпаниипоставщика)

SELECT 
P.ProductName,
P.Price,
C.CategoryName,
S.SupplierName
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
JOIN Suppliers AS S ON P.SupplierID = S.SupplierID

-- Вывести заказы клиентов не из France  (номерзаказа, имяклиента, страна_клиента)

SELECT 
O.OrderID,
C.CustomerName,
C.Country
FROM Orders AS O
JOIN Customers AS C ON O.CustomerID = C.CustomerID
WHERE
NOT Country = 'France'

-- Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT
Products.ProductName,
Products.Price * 1.08 AS Price_USD
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
ORDER BY Products.Price DESC
LIMIT 1

-- Вывести список стран, которые поставляют морепродукты

SELECT 
Suppliers.Country
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE
Categories.CategoryName = 'Seafood'


-- Вывести два самых дорогих товара из категории Beverages из USA

SELECT 
*
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE
Categories.CategoryName = 'Beverages'
AND
Suppliers.Country = 'USA'
ORDER BY Products.Price DESC
LIMIT 2