-- 4.1 Show the product with the largest average price over the market.
	    SELECT PRODUCT.WARE 
	    FROM PRODUCT
	    WHERE PRODUCT.PRICE = (SELECT MAX(PRODUCT.PRICE) from PRODUCT)
	    GROUP BY PRODUCT.WARE
	    ORDER BY PRODUCT.WARE

-- 4.2. Show one sample ware from each category.
	    SELECT DISTINCT c.CLASS, (SELECT PRODUCT.WARE FROM PRODUCT, CATEGORY WHERE PRODUCT.WARE = CATEGORY.WARE AND CATEGORY.CLASS = c.CLASS LIMIT 1) 
	    FROM CATEGORY c

-- 4.3. Show the most expensive ware in each category and its price
		SELECT c.CLASS, p.WARE, p.PRICE
		FROM CATEGORY c
		JOIN PRODUCT p ON p.WARE = c.WARE
		WHERE p.PRICE = (SELECT MAX(PRICE) FROM PRODUCT WHERE PRODUCT.WARE = p.WARE)
		GROUP BY c.CLASS
		ORDER BY c.CLASS, p.WARE, p.PRICE DESC	
-- 4.4. Show the list of all the “greedy” companies, i.e. companies selling all the wares they are producing with prices at least 20% higher than average price for this product on the market.



-- 4.5. Show the companies that produce all the wares from any category. Result should contain the company
-- and the category and be sorted by the category. If the company covers multiple categories in such way,
-- there should be multiple rows for this company. To prove that the result is correct enrich it with the
-- additional column showing all the wares in the given category that the given company is actually producing.
	    	SELECT m.COMPANY, c.CLASS, (SELECT COUNT(DISTINCT CATEGORY.WARE) FROM CATEGORY WHERE CATEGORY.CLASS = c.CLASS GROUP BY CATEGORY.CLASS) AS NUM_c_WARES, COUNT(DISTINCT p.WARE) AS NUM_WARES, group_concat(DISTINCT p.WARE) AS PRODUCED_WARES
		FROM MANUFACTURER m, PRODUCT p, CATEGORY c
		WHERE p.BILL_ID = m.BILL_ID and c.WARE = p.WARE
		GROUP BY c.CLASS, m.COMPANY 
		HAVING NUM_c_WARES = NUM_WARES
		ORDER BY m.COMPANY
-- 4.6. For each bill of material show the company, all the materials, products, total price of all the products
-- considering their amounts. There must be exactly one row per bill and the result must be ordered by company.
		  SELECT m.COMPANY,
		    (SELECT GROUP_CONCAT(DISTINCT mt.WARE) FROM MATERIAL mt WHERE mt.BILL_ID = m.BILL_ID) AS MATERIALS,
		    (SELECT GROUP_CONCAT(DISTINCT p.WARE) FROM PRODUCT p WHERE p.BILL_ID = m.BILL_ID) AS PRODUCTS,
		    (SELECT SUM(p.PRICE * p.AMOUNT) FROM PRODUCT p WHERE p.BILL_ID = m.BILL_ID) AS PRICE,
		  FROM MANUFACTURER m
		  ORDER BY m.COMPANY
-- 4.7. For each product show
-- all the unique sets of materials used in different variants of bills of materials
-- all the possible byproducts (i.e. additional products in the same bill of materials)
-- There must be exactly one row per ware.
		SELECT p.WARE, (SELECT GROUP_CONCAT(DISTINCT m.WARE) FROM MATERIAL m WHERE m.BILL_ID IN (SELECT BILL_ID FROM PRODUCT p2 WHERE p2.WARE = p.WARE)), 
		(SELECT GROUP_CONCAT(DISTINCT p2.WARE) FROM PRODUCT p2 WHERE p2.BILL_ID IN (SELECT BILL_ID FROM PRODUCT p3 WHERE p3.WARE = p.WARE) AND p2.WARE != p.WARE)
		FROM PRODUCT p
		GROUP BY p.WARE
		ORDER BY p.WARE
-- 4.8. Show all the companies with the largest number of different wares they producing and their lists of
-- wares in alphabetical order.
		  SELECT m.COMPANY,
		      (SELECT COUNT(DISTINCT p.WARE) FROM PRODUCT p WHERE p.BILL_ID = m.BILL_ID) AS NUM,
		      (SELECT group_concat(DISTINCT p.WARE) FROM PRODUCT p WHERE p.BILL_ID = m.BILL_ID ORDER BY p.WARE) AS WARES
		  FROM MANUFACTURER m
		  ORDER BY NUM DESC
