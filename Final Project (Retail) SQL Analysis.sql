-- Final Project Analysis
SELECT * FROM retail_customers;
SELECT * FROM retail_transactions;

-- Join retail cutomers and retail transations tables on Customer ID
SELECT customer_Id, Gender, city_code, transaction_id, prod_category
FROM retail_customers
INNER JOIN retail_transactions
ON customer_Id = cust_id;

-- Identify the number of transations across genders
SELECT Gender, count(transaction_id) as 'Amount of Transactions' 
FROM retail_transactions
INNER JOIN retail_customers
ON cust_id = customer_Id
GROUP BY Gender;

-- Identify the number of items in Personal applicances - the total sales, the total tax and total quantity
SELECT prod_category, SUM(Tax) AS 'Total Tax', SUM(total_amt) AS 'Total Sales', SUM(Qty) AS'Total Sold' 
FROM retail_transactions
WHERE prod_subcategory = 'Personal Appliances'
GROUP BY prod_subcategory;

-- Identify the top selling products in clothing for women through sub category
SELECT prod_category AS 'Product', (total_amt) AS 'Sales Amount', transaction_id AS 'Tansaction ID',cust_id AS 'Customer ID', Store_type AS 'Store Type', city_code AS 'City Code'
FROM retail_transactions
INNER JOIN retail_customers
ON cust_id = customer_Id
WHERE GENDER ='F' AND prod_subcategory = 'Women' 
GROUP BY prod_category;

-- Identify store type produces the most returns
SELECT Store_type AS 'Store Type', total_amt AS 'Sales',
CASE 
WHEN (total_amt) <0 THEN 'Negative Return Ratio'
ELSE 'Positive Returns Ratio'
END AS 'Returns Ratio'
FROM retail_transactions
GROUP BY Store_type;