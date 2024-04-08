--1 Get all the unique companies
		SELECT DISTINCT COMPANY FROM MANUFACTURER

--2 Get the total number of companies
		SELECT COUNT(DISTINCT COMPANY) FROM MANUFACTURER 

--3 Get all the unique wares in Food category
		SELECT DISTINCT WARE FROM CATEGORY WHERE CLASS = "Food"

--4 Get a list of all unique companies which names begin with letter A or B, sorted in alphabetical order
		SELECT DISTINCT COMPANY FROM MANUFACTURER WHERE COMPANY LIKE "A%" OR COMPANY LIKE "B%" ORDER BY COMPANY ASC
	--вариант с union
		SELECT DISTINCT COMPANY FROM MANUFACTURER WHERE COMPANY LIKE "A%"
		UNION
		SELECT DISTINCT COMPANY FROM MANUFACTURER WHERE COMPANY LIKE "B%"
		ORDER BY COMPANY ASC

--5 Get all the unique final products (i.e. the wares that are not in use as a material anywhere)
		SELECT DISTINCT WARE FROM PRODUCT
		EXCEPT
		SELECT DISTINCT WARE FROM MATERIAL

--6 Get all the unique wares that could not be produced
		SELECT DISTINCT WARE FROM MATERIAL 
		EXCEPT 
		SELECT DISTINCT WARE FROM PRODUCT

--7 Get all the unique wares that both materials and products
		SELECT DISTINCT WARE FROM PRODUCT
		INTERSECT
		SELECT DISTINCT WARE FROM MATERIAL

--8 Get the minimal and maximal prices of Paper
		SELECT MIN(PRICE), MAX(PRICE) FROM PRODUCT WHERE WARE = "Paper"

--9 Get the average price and variance price of Meat, both rounded to one decimal point
		SELECT round(AVG(PRICE), 1) AS "AVERAGE PRICE", (round(AVG(PRICE), 1) - PRICE) AS "VARIANCE PRICE" FROM PRODUCT WHERE WARE = "Meat"
