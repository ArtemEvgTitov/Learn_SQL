use seminar_4;

/*
1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
2. Вывести на экран марку авто и количество AUTO не этой марки
3. Напишите запрос, который вернет строки из таблицы test_a, 
id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
*/

create table test_a (id INT, data VARCHAR(1));
create table test_b (id INT);
insert into test_a(id, data) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);

SELECT * FROM AUTO;

-- 1
SELECT mark, color, COUNT(*) AS mark_count
FROM AUTO AS a
WHERE a.mark IN ('BMW', 'LADA')
GROUP BY mark, color;

-- 2
SELECT DISTINCT mark, (SELECT COUNT(1) 
FROM auto AS a1 
WHERE a1.mark != a.mark) AS Count
FROM auto AS a;

-- 3
SELECT * 
FROM test_a AS a
LEFT JOIN test_b AS b
ON a.id = b.id
WHERE b.id IS NULL;