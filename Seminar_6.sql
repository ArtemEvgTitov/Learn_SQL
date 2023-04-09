/*
SET @test:= 5;
SELECT @test;
-- SELECT
SELECT @test_var:= 50;
*/

/*
Создайте хранимую процедуру hello(), которая будет возвращать приветствие,
в зависимости от текущего времени суток.
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
с 18:00 до 00:00 — "Добрый вечер",
с 00:00 до 6:00 — "Доброй ночи".
*/

/*
DELIMITER $$
CREATE PROCEDURE hello()
BEGIN
	CASE
		WHEN CURTIME() BETWEEN '06:00:00' AND '11:59:59' THEN
			SELECT 'Доброе утро!';
		WHEN CURTIME() BETWEEN '12:00:00' AND '17:59:59' THEN
			SELECT 'Добрый день!';
		WHEN CURTIME() BETWEEN '18:00:00' AND '23:59:59' THEN
			SELECT 'Добрый вечер!';
		ELSE
			SELECT 'Доброй ночи!';
	END CASE;
END $$

CALL hello();

/*
Выведите первые N чисел Фибоначчи.
*/

/*
DELIMITER $$
CREATE FUNCTION fib(num INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	DECLARE n1 INT DEFAULT 0;
    DECLARE n2 INT DEFAULT 1;
    DECLARE n3 INT DEFAULT 0;
    DECLARE res VARCHAR(30) DEFAULT '0 1';
    
    IF num = 1 THEN 
		RETURN n1;
	ELSEIF num = 2 THEN
		RETURN res;
	ELSE 
		WHILE num > 2 DO
			SET n3 = n1 + n2;
            SET n1 = n2;
            SET n2 = n3;
            SET res = CONCAT(res, " ", n3);
            SET num = num - 1;
		END WHILE;
        RETURN res;
	END IF;
END $$

SELECT fib(10);
*/
-- ---------------------------------------
-- Таблица для работы:

DROP TABLE bankaccounts;

CREATE TABLE bankaccounts(
	accountno varchar(20) PRIMARY KEY NOT NULL, 
    funds decimal(8,2));
    
/*
Добавьте информацию о двух счетах с именами ACC1 и ACC2 с начальным балансом 
средств в размере 1000 долларов США каждый.
*/

INSERT INTO bankaccounts VALUES("ACC1", 1000);
INSERT INTO bankaccounts VALUES("ACC2", 1000);
-- Изменим баланс на аккаунтах

START TRANSACTION;
UPDATE bankaccounts SET funds=funds-100 WHERE accountno='ACC1';
UPDATE bankaccounts SET funds=funds+100 WHERE accountno='ACC2';
COMMIT;

SELECT * FROM bankaccounts;

/*
Реализуйте процедуру, внутри которой с помощью цикла выведите числа от N до 1:
N = 5=>5,4,3,2,1,
*/
DROP PROCEDURE num_print;
DELIMITER //
CREATE PROCEDURE num_print(num INT)
BEGIN 
	DECLARE res VARCHAR(255);
    SET res = "";
    
    REPEAT
		SET res = CONCAT(res, " ", num);
		SET num = num - 1;
        UNTIL num < 1
	END REPEAT;
    SELECT res;
END //

CALL num_print(5);








