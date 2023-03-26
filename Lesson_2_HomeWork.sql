use homework2;

CREATE TABLE sales
(
	id INT DEFAULT 1,
    order_date DATE NOT NULL,
    bucket VARCHAR(45)
);

INSERT sales (order_date, bucket)
VALUES
('2021-01-01', '101 to 300'),
('2021-01-02', '101 to 300'),
('2021-01-03', 'less than equal to 100'),
('2021-01-04', '101 to 300'),
('2021-01-05', 'greater than 300');

SELECT id, order_date, bucket,
CASE bucket 
	WHEN 'greater than 300' THEN 'Большой заказ'
	WHEN '101 to 300' THEN 'Средний заказ'
    WHEN 'less than equal to 100' THEN 'Маленький заказ'
END AS order_rait
FROM sales;

CREATE TABLE orders
(
	orderid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employeeid VARCHAR(3) NOT NULL,
    amount FLOAT(9,2) NOT NULL,
    orderstatus VARCHAR(10) NOT NULL
);

INSERT orders (employeeid, amount, orderstatus)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED'),
('e04', 99.99, 'OPEN');

SELECT orderid, orderstatus,
CASE orderstatus 
	WHEN 'OPEN' THEN 'Order is in open state.'
	WHEN 'CLOSED' THEN 'Order is closed'
    WHEN 'CANCELLED' THEN 'Order is cancelled'
END AS order_summary
FROM orders;
