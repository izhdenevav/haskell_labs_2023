--1 Get all the unique companies producing Drinking water in alphabetic order.
		--SELECT DISTINCT MANUFACTURER.COMPANY FROM MANUFACTURER, PRODUCT WHERE MANUFACTURER.BILL_ID = PRODUCT.BILL_ID AND PRODUCT.WARE = "Drinking water" 
		--ORDER BY COMPANY ASC
	--переписала 05.04.2024 23:43
		--SELECT DISTINCT COMPANY FROM MANUFACTURER INNER JOIN PRODUCT ON MANUFACTURER.BILL_ID = PRODUCT.BILL_ID WHERE WARE = "Drinking water" ORDER BY COMPANY ASC

--2 Get all the companies producing wares in Raw food category. Result must contain unique pairs of companies and wares producing by them from the given category and must be sorted by the ware 
	--first and the company name next.
		--SELECT DISTINCT MANUFACTURER.COMPANY, PRODUCT.WARE FROM MANUFACTURER, PRODUCT, CATEGORY WHERE MANUFACTURER.BILL_ID = PRODUCT.BILL_ID AND PRODUCT.WARE = CATEGORY.WARE AND CATEGORY.CLASS = "Raw food" 
		--ORDER BY PRODUCT.WARE, MANUFACTURER.COMPANY
	--переписала 05.04.2024 23:51
		--SELECT DISTINCT m.COMPANY, p.WARE FROM MANUFACTURER m INNER JOIN PRODUCT p ON m.BILL_ID = p.BILL_ID
		--									  INNER JOIN CATEGORY c ON p.WARE = c.WARE
		--									  WHERE c.CLASS = "Raw food" 
		--									  ORDER BY p.WARE, m.COMPANY


--3 Get all the unique wares in alphabetical order that can be produced from wares in Mineral category
	--раз просили не только из категории минеральных материалов, то примерно так, если условие другое, то скажете
	--переписала 06.04.2024 в 00:06
		--SELECT DISTINCT p.WARE FROM CATEGORY c INNER JOIN MATERIAL m ON c.WARE = m.WARE
		--								   INNER JOIN PRODUCT p ON m.BILL_ID = p.BILL_ID 
		--								   WHERE c.CLASS = "Mineral"
		--								   ORDER BY m.BILL_ID													   


	--тут в 23:57 я поняла как эти ваши рецепты в бд устроены как говорится 20:31 прибыл годжо сатору
		--SELECT DISTINCT PRODUCT.BILL_ID, PRODUCT.WARE, MATERIAL.WARE FROM PRODUCT, MATERIAL WHERE PRODUCT.BILL_ID = MATERIAL.BILL_ID ORDER BY PRODUCT.BILL_ID ASC

--4 Get all the unique companies producing both wares from Fuel and Food categories. Use appropriate set operation in the query.
	--без операций над множествами
		--SELECT DISTINCT m.COMPANY FROM MANUFACTURER m, PRODUCT p, CATEGORY c WHERE m.BILL_ID = p.BILL_ID and p.WARE = c.WARE and (c.CLASS = "Fuel" or c.CLASS = "Food")
	--переписала 06.04.2024 00:13
		--SELECT DISTINCT m.COMPANY FROM MANUFACTURER m INNER JOIN PRODUCT p ON m.BILL_ID = p.BILL_ID
		--											    INNER JOIN CATEGORY c ON p.WARE = c.WARE
		--											    WHERE c.CLASS = "Fuel"
		--UNION
		--SELECT DISTINCT m.COMPANY FROM MANUFACTURER m INNER JOIN PRODUCT p ON m.BILL_ID = p.BILL_ID
		--		   									    INNER JOIN CATEGORY c ON p.WARE = c.WARE
		--										        WHERE c.CLASS = "Food"
	--переписать еще раз

--5 Rewrite the previous query without using the set operations. Enrich the result with wares from both categories. It is acceptable to get multiple rows for companies producing multiple 
--wares from any category mentioned, but the rows must be unique in result.
	--выше посмотрите

--6 Get all the companies in alphabetical order that producing at least 2 different wares from the same category.
--сидела 30 минут до 00:46, но так и не придумала

--7 Get all the unique wares in alphabetical order that can be produced using nothing besides wares in Mineral category.
	--написала 06.04.2024 01:26
		--SELECT DISTINCT p.WARE, count(m.WARE) as materials_count
		--FROM PRODUCT p, MATERIAL m, CATEGORY c 
		--WHERE p.BILL_ID = m.BILL_ID and m.WARE = c.WARE and c.CLASS = "Mineral"
		--GROUP BY p.BILL_ID, p.WARE
		--INTERSECT
		--SELECT DISTINCT p.WARE, count(m.WARE) as materials_count
		--FROM PRODUCT p
		--LEFT JOIN MATERIAL m ON p.BILL_ID = m.BILL_ID
		--GROUP BY p.BILL_ID, p.WARE
		--HAVING materials_count = 1

--8 Get all the unique companies in alphabetical order implementing production chains. The production chain is at least two subsequent bills of materials when the first bill producing ware 
--that is in use as material in the second bill. Example of such chain in terms of wares is Grain->Meat cow->Meat.

--9 Modify the query from the previous task to show also the production chain in terms of wares (3 of 
--them) with additional sorting by middle one (that both a material and a product for the given company).
