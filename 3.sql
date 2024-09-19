--1 Get all the unique wares in the alphabetic order with the minimal and maximal prices for each
		SELECT WARE, max(PRICE), min(PRICE) FROM PRODUCT GROUP BY WARE

--2 Show top 3 wares with the most difference between minimal and maximal prices
		SELECT WARE, max(PRICE) - min(PRICE) as difference FROM PRODUCT 
		GROUP BY WARE 
		ORDER BY difference DESC
		LIMIT 3

--3 Show top 3 companies producing the largest number of different products
		SELECT m.COMPANY, count(p.AMOUNT) as number_of_products FROM MANUFACTURER m, PRODUCT p WHERE m.BILL_ID = p.BILL_ID 
		GROUP BY m.COMPANY
		ORDER BY number_of_products DESC
		LIMIT 3

--4 Show the price of the most expensive ware for each category. The result should be ordered by the category
		SELECT DISTINCT CATEGORY.CLASS, CATEGORY.WARE, MAX(PRODUCT.PRICE)
		FROM CATEGORY, PRODUCT
		WHERE CATEGORY.WARE = PRODUCT.WARE
		GROUP BY CATEGORY.CLASS
		ORDER BY CATEGORY.CLASS, CATEGORY.WARE, PRODUCT.PRICE 

--5. For each bill of materials show the company and lists of all the products and materials. The result must contain exactly one row per bill and sorted by company. Lists in the result 
--must be represented as strings with values separated with comma
		    SELECT DISTINCT m.COMPANY, m.BILL_ID, group_concat(DISTINCT p.WARE) AS PRODUCTS, group_concat(DISTINCT mt.WARE) AS MATERIALS
		    FROM MANUFACTURER m
		    JOIN PRODUCT p ON p.BILL_ID = m.BILL_ID
		    JOIN MATERIAL mt ON mt.BILL_ID = m.BILL_ID
		    GROUP BY m.BILL_ID
		    ORDER BY m.BILL_ID
		
--6. Show the companies in the alphabetical order that producing larger number of different wares than consuming.

		SELECT DISTINCT m.COMPANY
		FROM MANUFACTURER m 
		JOIN PRODUCT p ON m.BILL_ID = p.BILL_ID
		JOIN MATERIAL mt ON mt.BILL_ID = m.BILL_ID
		GROUP BY m.COMPANY
		HAVING COUNT(DISTINCT p.WARE) > COUNT(DISTINCT mt.WARE)
		ORDER BY m.COMPANY

--7. Show all the companies that produce the same ware by more than 2 different ways (bills of materials).
		SELECT m.COMPANY
		FROM MANUFACTURER m
		JOIN PRODUCT p ON p.BILL_ID = m.BILL_ID
		GROUP BY m.COMPANY, p.WARE 
		HAVING COUNT(DISTINCT p.BILL_ID) > 2
		ORDER BY m.COMPANY

--8. Get all the unique companies producing at least one ware from each category in the set: Fuel, Food and Mineral. The query should be easily modifiable to use any set of categories.
		SELECT DISTINCT m.COMPANY
		FROM MANUFACTURER m
		JOIN PRODUCT p ON m.BILL_ID = p.BILL_ID
		JOIN CATEGORY c ON p.WARE = c.WARE
		GROUP BY m.COMPANY
		HAVING ((COUNT(c.CLASS = 'Fuel') > 0) and (COUNT(c.CLASS = 'Food') > 0) and (COUNT(c.CLASS = 'Mineral') > 0))
		ORDER BY m.COMPANY

--9. For each company get the list of all the categories of materials used and the list of categories of products. The result must contain exactly one row per company and each list 
--must contain only the unique entries.
		SELECT DISTINCT m.COMPANY, GROUP_CONCAT(DISTINCT c.CLASS), GROUP_CONCAT(DISTINCT c2.CLASS)
		FROM MANUFACTURER m
		JOIN PRODUCT p ON p.BILL_ID = m.BILL_ID
		JOIN MATERIAL mt ON mt.BILL_ID = m.BILL_ID
		JOIN CATEGORY c ON c.WARE = p.WARE
		JOIN CATEGORY c2 ON c2.WARE = mt.WARE
		GROUP BY m.COMPANY
		ORDER BY m.COMPANY

--10. For each company show all the production chains (separate row per company/chain). Here the production chain is defined as the intermediate product (ware) that both product for the one bill 
--and material for other where both bills are owned by the same company. Each chain must be presented in the following
--form (MATERIAL1,MATERIAL2,...)-[BILL_ID1]->(INTERMEDIATE_PRODUCT)-[BILL_ID2]-(PRODUCT1, PRODUCT2,...). The result must be sorted by the company.
		    SELECT m.COMPANY, group_concat(DISTINCT mt2.WARE), p.WARE, group_concat(DISTINCT p2.WARE)
		    FROM MANUFACTURER m
		    JOIN PRODUCT p ON p.BILL_ID = m.BILL_ID
		    JOIN MANUFACTURER m2 ON m2.COMPANY = m.COMPANY
		    JOIN MATERIAL mt ON mt.BILL_ID = m2.BILL_ID AND mt.WARE = p.WARE
		    JOIN MATERIAL mt2 ON mt2.BILL_ID = m.BILL_ID
		    JOIN PRODUCT p2 ON p2.BILL_ID = m2.BILL_ID
		  GROUP BY m.COMPANY
		  ORDER BY m.COMPANY
