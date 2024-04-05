--1 Get all the unique companies producing Drinking water in alphabetic order.
--SELECT DISTINCT MANUFACTURER.COMPANY FROM MANUFACTURER, PRODUCT WHERE MANUFACTURER.BILL_ID = PRODUCT.BILL_ID AND PRODUCT.WARE = "Drinking water" 
--ORDER BY COMPANY ASC

--2 Get all the companies producing wares in Raw food category. Result must contain unique pairs of
--companies and wares producing by them from the given category and must be sorted by the ware first and
--the company name next.
--SELECT MANUFACTURER.COMPANY, PRODUCT.WARE FROM MANUFACTURER, PRODUCT, CATEGORY WHERE MANUFACTURER.BILL_ID = PRODUCT.BILL_ID AND PRODUCT.WARE = CATEGORY.WARE AND CATEGORY.CLASS = "Raw food" 
--ORDER BY PRODUCT.WARE, MANUFACTURER.COMPANY

--3 Get all the unique wares in alphabetical order that can be produced from wares in Mineral category.

--4 Get all the unique companies producing both wares from Fuel and Food categories. Use appropriate set
--operation in the query.
--SELECT BILL_ID FROM MANUFACTURER
--INTERSECT
--SELECT BILL_ID FROM PRODUCT, CATEGORY WHERE CATEGORY.CLASS = "Fuel" OR CATEGORY.CLASS = "Food"

--SELECT WARE FROM PRODUCT
--INTERSECT
--SELECT WARE FROM CATEGORY WHERE CATEGORY.CLASS = "Fuel"
--UNION
--SELECT WARE FROM CATEGORY WHERE CATEGORY.CLASS = "Food"


--5 Rewrite the previous query without using the set operations. Enrich the result with wares from both
--categories. It is acceptable to get multiple rows for companies producing multiple wares from any category
--mentioned, but the rows must be unique in result.

--6 Get all the companies in alphabetical order that producing at least 2 different wares from the same
--category.

--7 Get all the unique wares in alphabetical order that can be produced using nothing besides wares in
--Mineral category.

--8 Get all the unique companies in alphabetical order implementing production chains. The production
--chain is at least two subsequent bills of materials when the first bill producing ware that is in use as material
--in the second bill. Example of such chain in terms of wares is Grain->Meat cow->Meat.

--9 Modify the query from the previous task to show also the production chain in terms of wares (3 of 
--them) with additional sorting by middle one (that both a material and a product for the given company).
