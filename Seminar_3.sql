use seminar_3;

CREATE TABLE workers
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(45),
surname VARCHAR(45),
speciality VARCHAR(45),
seniority INT,
salary INT,
age INT
);

INSERT INTO workers
(name, surname, speciality, seniority, salary, age)
VALUES ("name1", "surname1", "speciality1", 40, 10000, 60),
("name2", "surname2", "speciality2", 10, 5000, 20),
("name3", "surname3", "speciality3", 30, 500000, 40),
("name4", "surname4", "speciality4", 5, 10, 30);

SELECT * FROM workers;

/*
1. Выведите все записи, отсортированные по полю "age" по возрастанию
2. Выведите все записи, отсортированные по полю "name"
3. Выведите записи полей 'name', 'surname', 'age', 
отсортированные по полю 'name' в алфавитном порядке по убыванию
4. Выполните сортировку по полям 'name' и 'age' по убыванию
*/


-- 1 
SELECT *
FROM workers
ORDER BY age;

-- 2
SELECT *
FROM workers
ORDER BY name DESC; -- DESC (по убыванию)

-- 3
INSERT INTO workers
(name, surname, speciality, seniority, salary, age)
VALUES ("aname1", "surname1", "speciality1", 40, 1004010, 5),
("bname2", "surname2", "speciality2", 35, 50, 25);

SELECT name, surname, age
FROM workers
ORDER BY name DESC;

-- 4
SELECT *
FROM workers
ORDER BY name DESC, age DESC;

/*
5. Выведите уникальные значения полей 'name'
6. Выведите первые 2 записи из таблицы
7. Пропустите первые 4 строки и извлеките следующие 3 строки
8. Пропустите 2 последние строки и извлеките 3 строки перед ними
*/

-- 5
SELECT DISTINCT name
FROM workers;

-- 6
SELECT *
FROM workers
LIMIT 2;

-- 7
SELECT *
FROM workers
LIMIT 4,3;

-- 8
SELECT *
FROM workers
ORDER BY id DESC
LIMIT 2,3;

CREATE TABLE employee_tbl2
(
id INT,
name VARCHAR(45),
work_date DATE NOT NULL,
daily_typing_pages INT
);

INSERT INTO employee_tbl2
(id, name, work_date, daily_typing_pages)
VALUES (1, "John", "2007-01-24", 250),
(2, "Ram", "2007-05-27", 220),
(3, "Jack", "2007-05-06", 170),
(3, "Jack", "2007-04-06", 100),
(4, "Jill", "2007-04-06", 220),
(5, "Zara", "2007-06-06", 300),
(5, "Zara", "2007-02-06", 350);

/*
1.	Рассчитайте общее количество всех страниц dialy_typing_pages

2.	Выведите общее количество напечатанных страниц каждым человеком (с помощью предложения GROUP BY)  

3.	Посчитайте количество записей в таблице

4.	Выведите количество имен, которые являются уникальными 

5. 	Найдите среднее арифметическое по количеству ежедневных страниц для набора (daily_typing_pages)
*/

 -- 1
 SELECT SUM(daily_typing_pages) AS 'Сумма'
 FROM employee_tbl2;
 
 -- 2
 SELECT name, SUM(daily_typing_pages) AS 'Количество напечатанных стр'
 FROM employee_tbl2
 GROUP BY name;
 
 -- 3
 SELECT COUNT(*) as 'Count'
 FROM employee_tbl2;
 
 -- 4
 SELECT COUNT(DISTINCT name) as 'Count'
 FROM employee_tbl2;
 
 -- 5
 SELECT AVG(daily_typing_pages) as 'AVG'
 FROM employee_tbl2;
 
 /*
1. Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). 
Для каждой группы  найдите суммарную зарплату 
2. Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). 
Найдите максимальную заработную плату внутри группы
3. Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). 
Найдите минимальную заработную плату внутри группы
*/

CREATE TABLE NAS
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(45),
age INT,
salary INT
);

INSERT INTO NAS
(name, age, salary)
VALUES 
("Дима", 23, 100),
("Петя", 23, 200),
("Вася", 23, 300),
("Коля", 24, 1000),
("Иван", 24, 2000),
("Артём", 25, 3000),
("Миша", 25, 200);

SELECT * FROM NAS;

-- 1
SELECT age, SUM(salary) as SUM
FROM NAS
GROUP BY age;

-- 2
SELECT age, MAX(salary) as MAX
FROM NAS
GROUP BY age;

-- 3 
SELECT age, MIN(salary) as MIN
FROM NAS
GROUP BY age;

/*
1.	Выведите  только те строки, в которых суммарная зарплата больше или равна 1000
2. 	Выведите только те группы, в которых количество строк меньше или равно двум
3.	Выведите только те группы, в которых количество строк меньше или равно двум. 
Для решения используйте оператор “BETWEEN”
4.*	Выведите только те группы, в которых количество строк меньше или равно двум. 
Для решения используйте оператор “IN”
*/

-- 1
SELECT age, SUM(salary) as SUM
FROM NAS
GROUP BY age HAVING sum >= 1000;

-- 2
SELECT age, COUNT(*) as count
FROM NAS
GROUP BY age HAVING count <= 2;

-- 3
SELECT age, COUNT(*) as count
FROM NAS
GROUP BY age HAVING count BETWEEN 1 AND 2;

-- 4
SELECT age, COUNT(*) as count
FROM NAS
GROUP BY age HAVING count IN (1,2);



