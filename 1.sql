--1 Get all the unique companies
--SELECT DISTINCT COMPANY FROM MANUFACTURER

--2 Get the total number of companies
--кол-во всех записей в таблице 
--SELECT COUNT(COMPANY) FROM MANUFACTURER
--количество уникальных компаний
--SELECT COUNT(DISTINCT COMPANY) FROM MANUFACTURER 

--3 Get all the unique wares in Food category
--не особо поняла, что в задании подразумевалость, поэтому просто нашла все ware таблицы category, в которых class == "Food"
--уточнить у РА
--SELECT DISTINCT WARE FROM CATEGORY WHERE CLASS = "Food"

--4 Get a list of all unique companies which names begin with letter A or B, sorted in alphabetical order
--SELECT COMPANY FROM MANUFACTURER WHERE COMPANY LIKE "A%" OR COMPANY LIKE "B%" ORDER BY COMPANY ASC

--5 Get all the unique final products (i.e. the wares that are not in use as a material anywhere)
--вернуться позже, переписать
--SELECT DISTINCT PRODUCT.WARE FROM PRODUCT, MATERIAL WHERE MATERIAL.WARE != PRODUCT.WARE

--6 Get all the unique wares that could not be produced
--не поняла условие, уточнить у РА 

--7 Get all the unique wares that both materials and products
--вернуть позже, переписать
--SELECT DISTINCT PRODUCT.WARE FROM PRODUCT, MATERIAL WHERE PRODUCT.WARE = MATERIAL.WARE

--8 Get the minimal and maximal prices of Paper
--SELECT MIN(PRICE), MAX(PRICE) FROM PRODUCT WHERE WARE = "Paper"

--9 Get the average price and variance price of Meat, both rounded to one decimal point
--ищу в продукт потому что только в продукт есть столбец прайс
--уточнить у РА как искать отклонение ценообразования
--SELECT round(AVG(PRICE), 1) FROM PRODUCT
