/* 
1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '*/

DROP DATABASE IF EXISTS seminar6home;
CREATE DATABASE seminar6home;
USE seminar6home;

DROP FUNCTION IF EXISTS seconds;
DELIMITER //
CREATE FUNCTION seconds(sec INT)
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE s INT;
	DECLARE m INT;
	DECLARE h INT;
	DECLARE d INT;
    SET d = sec DIV 86400;
	SET h = (sec - d * 86400) DIV 3600;
	SET m = (sec - d * 86400 - h * 3600) DIV 60;
	SET s = sec - d * 86400 - h * 3600 - m * 60;
    RETURN concat(d, ' days ', h, ' hours ', m, ' minutes ', s, ' seconds');
END//
DELIMITER ;

SELECT seconds(100000);


/* 
2.	Выведите только четные числа от 1 до 10 включительно. (Через функцию / процедуру)
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)*/

DROP FUNCTION IF EXISTS even_numbers;
DELIMITER //
CREATE FUNCTION even_numbers()
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	DECLARE x INT DEFAULT 1;
	DECLARE result VARCHAR(30) DEFAULT '';
    WHILE x <= 10 DO
		IF (x mod 2 = 0) THEN 
			SET result = concat(result, ' ', x);
			SET x = x + 2;
		ELSE 
        SET x = x + 1;
        END IF;        
	END WHILE;
	RETURN result;
END//
DELIMITER ;

SELECT even_numbers();