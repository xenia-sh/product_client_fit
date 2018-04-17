create view dynamic_products_leavers as 
SELECT        id, product, product_name, 
CASE WHEN end_use >= '2006-01-01' AND end_use <= '2006-01-31' THEN 1 ELSE 0 END AS January06_new, 
CASE WHEN end_use >= '2006-02-01' AND end_use <= '2006-02-28' THEN 1 ELSE 0 END AS February06_new, 
CASE WHEN end_use >= '2006-03-01' AND end_use <= '2006-03-31' THEN 1 ELSE 0 END AS March06_new, 
CASE WHEN end_use >= '2006-04-01' AND end_use <= '2006-04-30' THEN 1 ELSE 0 END AS April06_new, 
CASE WHEN end_use >= '2006-05-01' AND end_use <= '2006-05-31' THEN 1 ELSE 0 END AS May06_new, 
CASE WHEN end_use >= '2006-06-01' AND end_use <= '2006-06-30' THEN 1 ELSE 0 END AS June06_new, 
CASE WHEN end_use >= '2006-07-01' AND end_use <= '2006-07-31' THEN 1 ELSE 0 END AS July06_new, 
CASE WHEN end_use >= '2006-08-01' AND end_use <= '2006-08-30' THEN 1 ELSE 0 END AS August06_new, 
CASE WHEN end_use >= '2006-09-01' AND end_use <= '2006-09-30' THEN 1 ELSE 0 END AS September06_new, 
CASE WHEN end_use >= '2006-10-01' AND end_use <= '2006-10-31' THEN 1 ELSE 0 END AS October06_new, 
CASE WHEN end_use >= '2006-11-01' AND end_use <= '2006-11-30' THEN 1 ELSE 0 END AS November06_new, 
CASE WHEN end_use >= '2006-12-01' AND end_use <= '2006-12-31' THEN 1 ELSE 0 END AS December06_new
FROM            products
-- when they left (stopped using the product) 

create view dynamic_products as
SELECT        id, product, product_name, 
CASE WHEN [start_use] >= '2006-01-01' AND [start_use] <= '2006-01-31' THEN 1 ELSE 0 END AS January06_new, 
CASE WHEN [start_use] >= '2006-02-01' AND [start_use] <= '2006-02-28' THEN 1 ELSE 0 END AS February06_new, 
CASE WHEN [start_use] >= '2006-03-01' AND [start_use] <= '2006-03-31' THEN 1 ELSE 0 END AS March06_new, 
CASE WHEN [start_use] >= '2006-04-01' AND [start_use] <= '2006-04-30' THEN 1 ELSE 0 END AS April06_new, 
CASE WHEN [start_use] >= '2006-05-01' AND [start_use] <= '2006-05-31' THEN 1 ELSE 0 END AS May06_new, 
CASE WHEN [start_use] >= '2006-06-01' AND [start_use] <= '2006-06-30' THEN 1 ELSE 0 END AS June06_new, 
CASE WHEN [start_use] >= '2006-07-01' AND [start_use] <= '2006-07-31' THEN 1 ELSE 0 END AS July06_new, 
CASE WHEN [start_use] >= '2006-08-01' AND [start_use] <= '2006-08-30' THEN 1 ELSE 0 END AS August06_new, 
CASE WHEN [start_use] >= '2006-09-01' AND [start_use] <= '2006-09-30' THEN 1 ELSE 0 END AS September06_new, 
CASE WHEN [start_use] >= '2006-10-01' AND [start_use] <= '2006-10-31' THEN 1 ELSE 0 END AS October06_new, 
CASE WHEN [start_use] >= '2006-11-01' AND [start_use] <= '2006-11-30' THEN 1 ELSE 0 END AS November06_new, 
CASE WHEN [start_use] >= '2006-12-01' AND [start_use] <= '2006-12-31' THEN 1 ELSE 0 END AS December06_new
FROM           products
--when they joined (began using the product) 

SELECT        id, COUNT(id) AS n_lines_left
FROM            dbo.dynamic_products_leavers
WHERE        (product_name LIKE '%Product 1%')
GROUP BY id    --how many times each client for a given product "left" 


SELECT        id, COUNT(id) AS n_lines_left
FROM            dbo.dynamic_products
WHERE        (product_name LIKE '%Product 1%')
GROUP BY id  --how many times each client for a given product "joined" (bought another one)

--Overlap case 

--Case when ends the usage and then buys it again 


