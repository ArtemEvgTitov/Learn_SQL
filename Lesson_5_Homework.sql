use homework_5;

CREATE TABLE Cars
(
Id INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(45),
Cost INT
);

INSERT INTO Cars
(Name, Cost)
VALUES 
("Audi", 52642),
("Mercedes", 57127),
("Skoda", 9000),
("Volvo", 29000),
("Bentley", 350000),
("Citroen", 21000),
("Hummer", 41400),
("Volkswagen", 21600);

SELECT * FROM Cars;

/*
1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
2.	Изменить в существующем представлении порог для стоимости: 
пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
*/

-- 1
CREATE VIEW PriceCar AS
SELECT Name, Cost
FROM Cars
WHERE Cost < 25000;

-- 2
ALTER VIEW PriceCar AS
SELECT Name, Cost
FROM Cars
WHERE Cost < 30000;

-- 3
CREATE VIEW SkodAudi AS
SELECT Name, Cost
FROM Cars
WHERE Name IN ('Audi', 'Skoda');

CREATE TABLE Analysis
(
an_id INT,
an_name VARCHAR(45),
an_cost FLOAT(9,2),
an_price FLOAT(9,2),
an_group VARCHAR(45)
);

CREATE TABLE Groups_analysis
(
gr_id INT,
gr_name VARCHAR(45),
gr_temp VARCHAR(45)
);

CREATE TABLE Orders
(
ord_id INT,
ord_datetime DATE,
ord_an INT
);

SELECT an_name, an_price, ord_datetime
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_id
AND Orders.ord_datetime >= '2020-02-05'
AND Orders.ord_datetime <= '2020-02-12';


SELECT train_id, station, station_time,
SUBTIME(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY train_id), station_time)
AS time_to_next_station
FROM Trains;


