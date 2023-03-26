/*
Урок 1. Установка СУБД, подключение к БД, просмотр и создание таблиц
СДАВАТЬ В ВИДЕ СКРИНШОТОВ СОБРАВ ВСЕ В ОДИН ФАЙЛ WORD/PDF
Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ
ТАБЛИЦА С ДАННЫМИ ВО ВЛОЖЕНИЯХ
1. Выведите название, производителя и цену для товаров, количество которых превышает 2

2. Выведите весь ассортимент товаров марки “Samsung”
3. Выведите информацию о телефонах, где чек больше 50 000 и меньше 75 000

ДОП
4 С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
4.1. Товары, в которых есть упоминание "Iphone"
4.2. "Galaxy"
4.3. Товары, в которых есть ЦИФРЫ
4.4. Товары, в которых есть ЦИФРА "8"
*/

use homework_lesson_1;
-- 1)
SELECT ProductName, Manufacturer, Price
FROM smartphone
WHERE ProductCount > 2;
-- 2)
SELECT *
FROM smartphone
WHERE Manufacturer = "Samsung";
-- 3)
SELECT *
FROM smartphone
WHERE Price > 50000 and Price < 75000;
-- 4.1)
SELECT *
FROM smartphone
WHERE ProductName LIKE "iPhone%";
-- 4.2)
SELECT *
FROM smartphone
WHERE ProductName LIKE "Galaxy%";
-- 4.3)
SELECT *
FROM smartphone
WHERE ProductName RLIKE "[0-9]";
-- 4.4)
SELECT *
FROM smartphone
WHERE ProductName LIKE "%8%";