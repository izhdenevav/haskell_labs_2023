--1 Get all the unique wares in the alphabetic order with the minimal and maximal prices for each
	--написала в 01:44
		--SELECT WARE, max(PRICE), min(PRICE) FROM PRODUCT GROUP BY WARE

--2 Show top 3 wares with the most difference between minimal and maximal prices
	--написала в 01:47
		--SELECT WARE, max(PRICE) - min(PRICE) as difference FROM PRODUCT 
		--GROUP BY WARE 
		--ORDER BY difference DESC
		--LIMIT 3

--3 Show top 3 companies producing the largest number of different products
	--написаоа в 01:50
		--SELECT m.COMPANY, count(p.AMOUNT) as number_of_products FROM MANUFACTURER m, PRODUCT p WHERE m.BILL_ID = p.BILL_ID 
		--GROUP BY m.COMPANY
		--ORDER BY number_of_products DESC
		--LIMIT 3

--4 Show the price of the most expensive ware for each category. The result should be ordered by the category
	--01:59 идей нет

--5. For each bill of materials show the company and lists of all the products and materials. The result must contain exactly one row per bill and sorted by company. Lists in the result 
--must be represented as strings with values separated with comma

--6. Show the companies in the alphabetical order that producing larger number of different wares than consuming.


--7. Show all the companies that produce the same ware by more than 2 different ways (bills of materials).
--8. Get all the unique companies producing at least one ware from each category in the set: Fuel, Food and Mineral. The query should be easily modifiable to use any set of categories.
--9. For each company get the list of all the categories of materials used and the list of categories of products. The result must contain exactly one row per company and each list 
--must contain only the unique entries.
--10. For each company show all the production chains (separate row per company/chain). Here the production chain is defined as the intermediate product (ware) that both product for the one bill 
--and material for other where both bills are owned by the same company. Each chain must be presented in the following
--form (MATERIAL1,MATERIAL2,...)-[BILL_ID1]->(INTERMEDIATE_PRODUCT)-[BILL_ID2]-(PRODUCT1, PRODUCT2,...). The result must be sorted by the company.
