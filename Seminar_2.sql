use Seminar_2;

/*
Например, в таблице создаются следующие столбцы:
1. уникальный идентификатор фильма,
2. название фильма
3. год выхода
4. длительность фильма в минутах
5. сюжетная линия, небольшое описание фильма
Все поля имеют ограничение NOT NULL. Первичный ключ PRIMARY KEY – поле id.
*/

CREATE TABLE Movies
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    year_mov YEAR NOT NULL,
    time_min INT NOT NULL,
    storyline TEXT
);

INSERT movies(title, year_mov, time_min, storyline)
VALUES ('Harry Potter and the Philosophers Stone', 2001, 152,
"An orphaned boy enrolls in a school of wizardry, where he
learns the truth about himself, his family and the terrible
evil that haunts the magical world."),
('Harry Potter and the Chamber of Secrets', 2002, 162,"An
ancient prophecy seems to be coming true when a mysterious
presence begins stalking the corridors of a school of magic
and leaving its victims paralyzed."),
('The Green Mile', 1999, 188,'Death Row guards at a
penitentiary, in the 1930s, have a moral dilemma with their
job when they discover one of their prisoners, a convicted
murderer, has a special gift.'),
('Forrest Gump', 1994, 142,"The presidencies of Kennedy and
Johnson, the Vietnam War, the Watergate scandal and other
historical events unfold from the perspective of an Alabama
man with an IQ of 75, whose only desire is to be reunited with
his childhood sweetheart.");

SELECT * FROM Movies;

-- RENAME TABLE Имя Таблицы TO Новое имя

ALTER TABLE Movies -- Изменить таблицу
ADD actor VARCHAR(30) NOT NULL; -- Добавить колонку

ALTER TABLE Movies
DROP COLUMN actor; -- Удалить колонку

-- DROP TABLE Имя таблицы

CREATE TABLE raiting
(
	id_film INT NOT NULL,
    rait INT NOT NULL
);

INSERT raiting (id_film, rait)
VALUES
(1,5),
(2,4),
(3,2),
(4,10);

SELECT * FROM raiting;

ALTER TABLE raiting
ADD FOREIGN KEY(id_film) REFERENCES movies(id);

-- truncate table имя таблицы # очистить таблицу

-- table creation
CREATE TABLE studentMarks 
(
	stud_id INT NOT NULL AUTO_INCREMENT
	PRIMARY KEY, 
	total_marks INT, 
	grade VARCHAR(5)
);
-- insert sample data
INSERT INTO studentMarks(total_marks, grade)
VALUES
(450, 'A'),
(480, 'A+'),
(490, 'A++'),
(440, 'B+'),
(400, 'C+'),
(380,'C'),
(250, 'D'),
(200,'E'),
(100,'F'),
(150,'F'),
(220, 'E');

SELECT total_marks, grade,
CASE grade 
	WHEN 'A++' THEN 'DESTICTION'
    WHEN 'A+' THEN 'FIRST CLASS'
    WHEN 'A' THEN 'FIRST CLASS'
    WHEN 'B+' THEN 'SECOND CLASS'
    WHEN 'B' THEN 'SECOND CLASS'
    WHEN 'C+' THEN 'THIRD CLASS'
    ELSE 'FAIL'
END AS class
FROM studentMarks;

/*
Total_marks > 450 – «ПЕРВЫЙ КЛАСС С ОТЛИЧИЕМ»
Total_marks от 400 до 450 – «ПЕРВЫЙ КЛАСС»
Total_marks от 350 до 400 – «ВТОРОЙ КЛАСС»
Total_marks от 300 до 350 – «ТРЕТИЙ КЛАСС»
В противном случае - НЕУДАЧА
*/

SELECT total_marks, grade,
CASE 
	WHEN total_marks > 450 THEN 'ПЕРВЫЙ КЛАСС С ОТЛИЧИЕМ'
    WHEN total_marks BETWEEN 400 and 450 THEN 'ПЕРВЫЙ КЛАСС'
    WHEN total_marks BETWEEN 350 and 400 THEN 'ВТОРОЙ КЛАСС'
    WHEN total_marks BETWEEN 300 and 350 THEN 'ТРЕТИЙ КЛАСС'
	ELSE 'НЕУДАЧА'
END AS class
FROM studentMarks;

SELECT IF(100 > 200, 'Y', 'N') AS qw;

SELECT total_marks, stud_id,
IF(total_marks > 450, 'Отлично', 'Хорошо') as card
FROM studentMarks;

