use seminar_4;

CREATE TABLE members
(
member_id INT AUTO_INCREMENT,
name VARCHAR (100) ,
PRIMARY KEY (member_id)
);

CREATE TABLE committees
(
committee_id INT AUTO_INCREMENT,
name VARCHAR (100),
PRIMARY KEY (committee_id)
);

INSERT INTO members (name)
VALUES("John"), ("Jane"), ("wary"), ("David"), ("2melia");
INSERT INTO committees (name)
VALUES ("John"), ("Mary"), ("Amelial"), ("Joe");
SELECT * FROM members;

/*
Выведите участников, которые также являются членами комитета, 
используйте INNER JOIN (пересечение 2 таблиц по имени);
*/
SELECT *
FROM members
INNER JOIN committees USING (name);
-- второй вариант
SELECT m.member_id, c.committee_id, m.name
FROM members AS m
INNER JOIN committees AS c ON c.name = m.name;

  -- Создание таблицы с товарами
   CREATE TABLE products (
     product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     category INT NULL,
     product_name VARCHAR(100) NOT NULL
   );

   -- Создание таблицы с категориями
   CREATE TABLE categories (
     category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     category_name VARCHAR(100) NOT NULL
   );

   -- Добавление данных в таблицу с товарами
   INSERT INTO products(category, product_name)
     VALUES (1, 'Системный блок'),
            (1, 'Монитор'),
            (2, 'Холодильник'),
            (2, 'Телевизор'),
            (NULL, 'Операционная система');

   -- Добавление данных в таблицу с категориями
   INSERT INTO categories (category_name)
     VALUES ('Комплектующие компьютера'),
            ('Бытовая техника'),
            ('Мобильные устройства');

   SELECT * FROM products;
   SELECT * FROM categories;
   
SELECT p.product_name, c.category_name
FROM products p
LEFT JOIN categories c
ON p.category = c.category_id

UNION

SELECT p.product_name, c.category_name
FROM products p
RIGHT JOIN categories c
ON p.category = c.category_id; 


/*
Задание:
1. Выведите участников, которые являются членами комитета (Используя LEFT JOIN, 
выполните соединение двух таблиц по полю “Имя”)
2.* Выведите участников, которые не являются членами комитета
*/
-- 1
SELECT *
FROM members
LEFT JOIN committees USING (name);
-- 2
SELECT *
FROM members AS m
LEFT JOIN committees AS c
ON m.name = c.name
WHERE c.name IS NULL;

/*
Задание:
1. Найти членов комитета, которых нет в members с помощью RIGHT JOIN
2. Выполнить RIGHT JOIN между 2 таблицами по полю “Имя”
*/
-- 1
SELECT *
FROM members
RIGHT JOIN committees USING (name)
WHERE member_id IS NULL;
-- 2
SELECT *
FROM members
RIGHT JOIN committees USING (name);

/*
Выведите перекрестное произведение таблиц members - committees
*/
SELECT *
FROM members
CROSS JOIN committees;
-- второй вариант
SELECT *
FROM members, committees;


CREATE TABLE t1(
id INT PRIMARY KEY
);

CREATE TABLE t2 (
id INT PRIMARY KEY
);

INSERT INTO t1 VALUES (1),(2),(3);
INSERT INTO t2 VALUES (2),(3),(4); -- UNION
SELECT id FROM t1
UNION
SELECT id FROM t2;
-- ----------------------------------------------------
create table users
(
    id  int auto_increment primary key,
    login varchar(255) null,
    pass  varchar(255) null,
    male  tinyint      null
);

create table clients
(
    id    int auto_increment primary key,
    login varchar(255) null,
    pass  varchar(255) null,
    male  tinyint      null
);

INSERT INTO users (login, pass, male) VALUES ('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO users (login, pass, male) VALUES ('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO users (login, pass, male) VALUES ('Olia', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2);
INSERT INTO users (login, pass, male) VALUES ('Tom', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1);
INSERT INTO users (login, pass, male) VALUES ('Margaret', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2);
INSERT INTO users (login, pass, male) VALUES ('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);

INSERT INTO clients (login, pass, male) VALUES ('alexander', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Olia', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2);
INSERT INTO clients (login, pass, male) VALUES ('Dmitry', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Margaret', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2);
INSERT INTO clients (login, pass, male) VALUES ('Leonid', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Olga', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2);
INSERT INTO clients (login, pass, male) VALUES ('Tom', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Masha', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2);
INSERT INTO clients (login, pass, male) VALUES ('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
/*
Задание:
1. Получить список пользователей и клиентов, удалив одинаковых клиентов и пользователей
2. Получить список пользователей и клиентов. Дубликаты удалять не нужно
*/

-- 1
SELECT *
FROM users
UNION
SELECT *
FROM clients;
-- 2
SELECT *
FROM users
UNION ALL
SELECT *
FROM clients;

/*
1. Проверьте, присутствует ли буква “А” в последовательности 'A', 'B', 'C', 'D'
2. Проверьте, присутствует ли буква “Z” в последовательности 'A', 'B', 'C', 'D'
3. Получить столбцы из таблицы “clients” , 
в которых первое имя является набором значений ('Mikle', 'Tom', 'Masha').
4. Выберите все логины из таблицы “users”, кроме “Mikle”.
*/

-- 1
SELECT 'A' IN ('A', 'B', 'C', 'D');
-- 2
SELECT 'Z' IN ('A', 'B', 'C', 'D') AS qwer;
-- 3
SELECT *
FROM clients
WHERE login IN ('Mikle', 'Tom', 'Masha');
-- 4
SELECT *
FROM users
WHERE login NOT IN ('Mikle'); -- Либо WHERE login != ('Mikle')
-- ----------------------------------------------------

CREATE TABLE Employee (
  Id INT PRIMARY KEY,
  Name VARCHAR(45) NOT NULL,
  Department VARCHAR(45) NOT NULL,
  Salary FLOAT NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL,
  City VARCHAR(45) NOT NULL
);
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');
CREATE TABLE Projects (
 ProjectId INT PRIMARY KEY AUTO_INCREMENT,
      Title VARCHAR(200) NOT NULL,
     ClientId INT,
 EmployeeId INT,
     StartDate DATETIME,
     EndDate DATETIME
);
INSERT INTO Projects ( Title, ClientId, EmployeeId, StartDate, EndDate) VALUES 
('Develop ecommerse website from scratch', 1, 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('WordPress website for our company', 1, 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Manage our company servers', 2, 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Hosting account is not working', 3, 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 4, 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY)),
('Migrate web application and database to new server', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY)),
('Android Application development', 4, 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY));

SELECT * FROM Projects;
/*
1. Получите из таблицы "Сотрудники" только тех сотрудников, 
которые в данный момент работают над любым из активных проектов.
2. Проверьте, существует ли сотрудник с идентификатором 1004 в таблице сотрудников или нет.
*/

-- 1
SELECT *
FROM Employee
WHERE EXISTS (SELECT * FROM Projects 
WHERE Employee.id = Projects.EmployeeID);
-- 2
SELECT EXISTS (SELECT * FROM Employee WHERE id = 1004);
-- --------------------------------------------------------------

-- Собеседования
CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);


CREATE TABLE  CITY 
(	
    CITYCODE INT PRIMARY KEY,
	CITYNAME VARCHAR(50), 
	PEOPLES INT 
);


CREATE TABLE  MAN 
(	
	PHONENUM VARCHAR(15) PRIMARY KEY , 
	FIRSTNAME VARCHAR(50),
	LASTNAME VARCHAR(50),  
	CITYCODE INT, 
	YEAROLD INT	 
);


 -- AUTO
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);


 -- CITY
INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(1,'Москва', 10000000);


INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(2,'Владимир', 500000);


INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(3, 'Орел', 300000);


INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(4,'Курск', 200000);


INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(5, 'Казань', 2000000);


INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(7, 'Котлас', 110000);


INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(8, 'Мурманск', 400000);


INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(9, 'Ярославль', 500000);

-- MAN
INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9152222221','Андрей','Николаев', 1, 22);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9152222222','Максим','Москитов', 1, 31);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9153333333','Олег','Денисов', 3, 34);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9173333334','Алиса','Никина', 4, 31);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9173333335','Таня','Иванова', 4, 31);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9213333336','Алексей','Иванов', 7, 25);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9213333331','Андрей','Некрасов', 2, 27);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9213333332','Миша','Рогозин', 2, 21);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9214444444','Алексей','Галкин', 1, 38);

/*
1. Выбрать код , название города и популяцию , код , 
города и популяцию где код города больше текущего кода города на 2
2. Вывести марку авто - а так же сколько авто такой марки в таблице , 
вывести записи где количество авто такой марки больше 2, записи не должны дублироваться
3. Вывести Марку и цвет автомобиля - имя и фамилию покупателя, для всех покупателей, 
которые живут в городе с населением больше 1 млн человек.
4. Вывести на экран людей которые живут в городах с населением больше 1000000 , 
если людей с таким же именем нет в таблице MAN
*/

-- 1
SELECT *
FROM CITY c 
LEFT JOIN CITY c2
ON c.citycode + 2 = c2.citycode;
-- 2
SELECT mark, COUNT(*) AS mark_count
FROM AUTO 
GROUP BY mark
HAVING mark_count > 2;
-- 3
SELECT a.MARK, a.COLOR, m.FIRSTNAME, m.LASTNAME
FROM AUTO a
LEFT JOIN MAN m
ON m.PHONENUM = a.PHONENUM
WHERE (
SELECT CITYCODE
FROM CITY c
WHERE m.CITYCODE = c.CITYCODE AND c.PEOPLES > 1000000
)



