-- 4.1 Show the product with the largest average price over the market.
--ДОДЕЛАТЬ
-- SELECT PRODUCT.WARE, COUNT(PRODUCT.WARE), SUM(PRODUCT.PRICE)
-- FROM PRODUCT
-- GROUP BY PRODUCT.WARE
-- ORDER BY PRODUCT.WARE

-- 4.2. Show one sample ware from each category.

-- SELECT DISTINCT c.CLASS, (SELECT PRODUCT.WARE FROM PRODUCT, CATEGORY WHERE PRODUCT.WARE = CATEGORY.WARE AND CATEGORY.CLASS = c.CLASS LIMIT 1) 
-- FROM CATEGORY c

-- 4.3. Show the most expensive ware in each category and its price

-- SELECT DISTINCT c.CLASS, c.WARE, (SELECT MAX(PRODUCT.PRICE) FROM PRODUCT, CATEGORY WHERE PRODUCT.WARE = CATEGORY.WARE AND CATEGORY.CLASS = c.CLASS LIMIT 1) AS MAX
-- FROM CATEGORY c, PRODUCT p
-- GROUP BY c.CLASS
-- ORDER BY c.CLASS

-- 4.4. Show the list of all the “greedy” companies, i.e. companies selling all the wares they are producing with prices at least 20% higher than average price for this product on the market.



-- 4.5. Show the companies that produce all the wares from any category. Result should contain the company
-- and the category and be sorted by the category. If the company covers multiple categories in such way,
-- there should be multiple rows for this company. To prove that the result is correct enrich it with the
-- additional column showing all the wares in the given category that the given company is actually producing.
-- 4.6. For each bill of material show the company, all the materials, products, total price of all the products
-- considering their amounts. There must be exactly one row per bill and the result must be ordered by
-- company.
-- 4.7. For each product show
-- - all the unique sets of materials used in different variants of bills of materials
-- - all the possible byproducts (i.e. additional products in the same bill of materials)
-- There must be exactly one row per ware.
-- 4.8. Show all the companies with the largest number of different wares they producing and their lists of
-- wares in alphabetical order.
