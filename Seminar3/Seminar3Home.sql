CREATE DATABASE IF NOT EXISTS seminar3home;

USE seminar3home;

CREATE TABLE IF NOT EXISTS `staff`
(
	`id` INT  AUTO_INCREMENT PRIMARY KEY,
	`firstname` VARCHAR(45),
    `lastname` VARCHAR(45),
    `post` VARCHAR(45),
    `seniority` INT,
    `salary` INT,
    `age` INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
	('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
	('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
	('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
	('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
	('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
            
-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
SELECT *
FROM staff
ORDER BY salary; -- сортировка по зарплатам по возрастанию

SELECT *
FROM staff
ORDER BY salary DESC; -- сортировка по зарплатам по убыванию

-- 2.1 Выведите 5 максимальных заработных плат (saraly)
SELECT *
FROM staff
ORDER BY salary DESC -- сортировка по зарплатам по убыванию
LIMIT 5; -- вывод 5 сотрудников с максимальными зарплатами

-- 2.2 Выведите 2 максимальных заработных плат (saraly) в отделе рабочих
SELECT *
FROM staff
WHERE post = "Рабочий"
ORDER BY salary DESC -- сортировка по зарплатам по убыванию
LIMIT 2; -- вывод 2 сотрудников с максимальными зарплатами

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT post,
SUM(salary)
FROM staff
GROUP BY post;

-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(post) AS "Количество рабочих от 24 до 49"
FROM staff
WHERE  post = "Рабочий" AND age BETWEEN 24 AND 49;

-- 5. Найдите количество специальностей
SELECT COUNT(DISTINCT post) AS "Количество специальностей"
FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT post, AVG(age)
FROM staff
GROUP BY post
HAVING AVG(age)  < 30;
