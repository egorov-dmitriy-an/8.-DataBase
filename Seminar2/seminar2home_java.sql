-- Создадим БД
CREATE DATABASE IF NOT EXISTS seminar2home_java; 
USE seminar2home_java;

/* 1. Используя операторы языка SQL, 
создайте таблицу “sales”. Заполните ее данными*/

-- Создадим таблицу sales
CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT
);

-- Заполним таблицу sales
INSERT sales(order_date, count_product)
VALUES 
	("2022-01-01", 156),
	("2022-01-02", 180),
	("2022-01-03", 21),
	("2022-01-04", 124),
	("2022-01-05", 341);
    
SELECT * FROM sales;


/* 2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  	-  Маленький заказ
от 100 до 300   -  Средний заказ
больше 300      -  Большой заказ
*/

SELECT order_date, count_product, -- Решение с использованием CASE
CASE
	WHEN count_product < 100 THEN "Маленький заказ"
    WHEN count_product > 100 AND count_product < 300 THEN "Средний заказ"
    ELSE "Большой заказ"
END AS "Тип заказа"
FROM sales;

SELECT -- Решение с использованием IF
		id AS "Номер заказа",
        order_date AS "Дата заказа",
        IF (count_product < 100, "Маленький заказ",
			IF(count_product BETWEEN 100 AND 300, "Средний заказ","Большой заказ)"))
            AS "Тип заказа"
FROM sales;


/* 3.  . Создайте таблицу “orders”, заполните ее значениями.
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»
*/

-- Создадим таблицу orders
CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(45) NOT NULL,
    amount DECIMAL(5,2),
    order_status VARCHAR(45) NOT NULL
);

-- Заполним таблицу orders
INSERT orders(employee_id, amount, order_status)
VALUES 
	("e03", 15.00, "OPEN"),
	("e01", 25.50, "OPEN"),
	("e05", 100.70, "CLOSED"),
	("e02", 22.18, "OPEN"),
	("e04", 9.50, "CANCELED");
    
-- Сделаем выборку     
SELECT id, employee_id, amount,  -- Решение с использованием CASE
CASE
	WHEN order_status = "OPEN" THEN "Order is in open state"
	WHEN order_status = "CLOSED" THEN "Order is closed"
	WHEN order_status = "CANCELED" THEN "Order is cancelled"
END AS "full_order_status"
FROM orders;