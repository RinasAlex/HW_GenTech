-- Вывести данные о товарах (название, цена со скидкой в 0.5%).

SELECT ProductName,
Price * 0.995 AS Price_down
FROM Products;

-- Вывести самый дорогой товар в диапазоне от 1 до 100 EUR.

SELECT *
FROM Products
WHERE 
Price BETWEEN 1 and 100
ORDER BY Price DESC
limit 1

-- Вывести два самых дешевых товара из категории 4.

SELECT *
FROM Products
WHERE 
CategoryID = 4
ORDER BY Price ASC
limit 2

-- Вывести один товар, который находится на пятом месте среди самых дорогих.

SELECT *
FROM Products

ORDER BY Price DESC
limit 1 OFFSET 4

-- Вывести товары, названия которых заканчиваются на букву a

SELECT * 
FROM Products
WHERE
ProductName LIKE '%a'

