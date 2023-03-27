USE lesson_2;

-- ORDER BY
SELECT ProductName, ProductCount * Price AS TotalSum
FROM Products
ORDER BY TotalSum;

SELECT * 
FROM Products
ORDER BY Price DESC; -- DESC - сортировка по убыванию

-- COUNT 
SELECT COUNT(*) AS COUNT
FROM Products;

-- TOP
# Указан только 1 параметр
SELECT *
FROM Products
LIMIT 5;
# Указаны 2 параметра 
SELECT *
FROM Products
LIMIT 1,2;

-- SUM
SELECT SUM(Price) AS TotalSum FROM Products;

-- MIN, MAX, AVG
SELECT MIN(Price)
FROM Products
WHERE Manufacturer='Apple';

SELECT AVG(Price) AS Average_Price From Products
WHERE Manufacturer='Samsung';

SELECT MIN(Price), MAX(Price), AVG(Price)
FROM Products
WHERE Manufacturer='Apple';

SELECT Manufacturer, COUNT(*) AS Models, Price, ProductCount
FROM Products
WHERE Price > 40000
GROUP BY Manufacturer;