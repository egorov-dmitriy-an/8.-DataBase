CREATE DATABASE IF NOT EXISTS seminar4home;
USE seminar4home;

DROP TABLE IF EXISTS AUTO;
CREATE TABLE IF NOT EXISTS AUTO
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
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

-- 5.1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
SELECT DISTINCT MARK, COLOR, (SELECT COUNT(COLOR) FROM AUTO WHERE MARK = 'BMW' and color = 'ЗЕЛЕНЫЙ') COUNT FROM AUTO
WHERE MARK = 'BMW' and COLOR = 'ЗЕЛЕНЫЙ'
UNION
SELECT DISTINCT MARK, COLOR, (SELECT COUNT(COLOR) FROM AUTO WHERE MARK = 'BMW' and color = 'СИНИЙ') COUNT FROM AUTO
WHERE MARK = 'BMW' and COLOR = 'СИНИЙ'
UNION
SELECT DISTINCT MARK, COLOR, (SELECT COUNT(COLOR) FROM AUTO WHERE MARK = 'BMW' and color = 'КРАСНЫЙ') COUNT FROM AUTO
WHERE MARK = 'BMW' and COLOR = 'КРАСНЫЙ'
UNION
SELECT DISTINCT MARK, COLOR, (SELECT COUNT(COLOR) FROM AUTO WHERE MARK = 'LADA' and color = 'ЗЕЛЕНЫЙ') COUNT FROM AUTO
WHERE MARK = 'LADA' and COLOR = 'ЗЕЛЕНЫЙ'
UNION
SELECT DISTINCT MARK, COLOR, (SELECT COUNT(COLOR) FROM AUTO WHERE MARK = 'LADA' and color = 'СИНИЙ') COUNT FROM AUTO
WHERE MARK = 'LADA' and COLOR = 'СИНИЙ'
UNION
SELECT DISTINCT MARK, COLOR, (SELECT COUNT(COLOR) FROM AUTO WHERE MARK = 'LADA' and color = 'КРАСНЫЙ') COUNT FROM AUTO
WHERE MARK = 'LADA' and COLOR = 'КРАСНЫЙ';

-- 5.2. Вывести на экран марку авто и количество AUTO не этой марки
SELECT DISTINCT MARK, (SELECT COUNT(MARK) FROM AUTO WHERE MARK != 'LADA') COUNT_NO_MARK
FROM AUTO
WHERE MARK = 'LADA';

/* Задание №3.
Даны 2 таблицы, созданные следующим образом: */
create table test_a 
(
	id INT,
	data varchar(45)
);

create table test_b
(
	id INT
);

insert into test_a(id, data) 
values
	(10, 'A'),
	(20, 'A'),
	(30, 'F'),
	(40, 'D'),
	(50, 'C');
    
insert into test_b(id)
values
	(10),
	(30),
	(50);
    
-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
ALTER TABLE test_b
RENAME COLUMN id TO id_b;

SELECT c.id, c.data 
FROM (SELECT *
	FROM test_a a
	LEFT JOIN (SELECT id_b FROM test_b AS b) d
	ON a.id = d.id_b) c
WHERE c.id_b IS NULL;