WITH RECURSIVE sequence (n) AS
(
SELECT 0
UNION ALL
SELECT n + 1
FROM sequence
WHERE n + 1 <= 10
)
SELECT n
FROM sequence;

-- Генерация набора 
WITH RECURSIVE cte AS
(
SELECT 1 AS a
UNION ALL
SELECT a + 1 FROM cte
WHERE a < 10
)
SELECT * FROM cte;

-- ----------------------------------------------------

CREATE DATABASE mydb;
USE mydb;

CREATE TABLE users (
username VARCHAR(50) PRIMARY KEY,
password VARCHAR(50) NOT NULL,
status VARCHAR(10) NOT NULL);

CREATE TABLE users_profile (
username VARCHAR(50) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE);

INSERT INTO users values
('admin' , '7856', 'Active'),
('staff' , '90802', 'Active'),
('manager' , '35462', 'Inactive');

INSERT INTO users_profile values
('admin', 'Administrator' , 'Dhanmondi', 'admin@test.com' ) ,
('staff', 'Jakir Nayek' , 'Mirpur', 'zakir@test.com' ),
('manager', 'Mehr Afroz' , 'Eskaton', 'mehr@test.com' );

/*
1. Используя СТЕ, выведите всех пользователей из таблицы users_profile
2. Используя СТЕ, подсчитайте количество активных пользователей . 
Задайте псевдоним результирующему окну. Пример:
3. С помощью СТЕ реализуйте таблицу квадратов чисел от 1 до 10: (пример для чисел от 1 до 3)
*/

-- 1
WITH cte_users_profile AS
(
SELECT * FROM users_profile
)
SELECT * FROM cte_users_profile;

-- 2
WITH cte_users_active AS
(
SELECT COUNT(*) AS total
FROM users
WHERE status = 'active'
)
SELECT total FROM cte_users_active;

-- 3
WITH RECURSIVE cte AS
(
SELECT 1 AS n, 1 AS res
UNION ALL
SELECT n + 1, pow(n+1, 2) AS res FROM cte
WHERE n < 10
)
SELECT res
FROM cte;

/*
Собрать дэшборд, в котором содержится информация о максимальной задолженности в каждом банке, 
а также средний размер процентной ставки в каждом банке в зависимости от сегмента и 
количество договоров всего всем банкам
*/

SELECT *,
MAX(OSZ) OVER(PARTITION BY TB) AS 'Максимальная задолженность в каждом банке',
AVG(PROCENT_RATE) OVER(PARTITION BY TB, SEGMENT) AS 'Средний размер процентной ставки',
COUNT(ID_DOG) OVER() AS 'Количнство договоров всего по всем банкам'
FROM table;

WITH cte AS 
(
SELECT *,
DENSE_RANK() OVER(PARTITION BY TB ORDER BY count_revisions) AS ds
FROM table2
)
SELECT * FROM cte 
WHERE ds = 2;



