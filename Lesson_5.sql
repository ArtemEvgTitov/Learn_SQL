SELECT * FROM products;
-- Создание виртуальной таблицы
CREATE VIEW CopyProducts AS
SELECT Price, ProductCount, Manufacturer
FROM products
WHERE Manufacturer = 'Apple';

SELECT * FROM CopyProducts;

-- Удалние виртуальной таблицы
DROP VIEW CopyProducts;

CREATE TABLE Test
(
	id INT,
    Count INT
);

DROP TABLE Test;

ALTER VIEW CopyProducts AS
SELECT Price, ProductCount, Manufacturer, ProductName
FROM products
WHERE Manufacturer = 'Apple';

ALTER TABLE test ADD COLUMN TestString VARCHAR(40);
ALTER TABLE test DROP COLUMN TestString;