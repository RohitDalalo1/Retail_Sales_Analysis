SELECT * FROM Retail_Data;

#1. Total Sales by Category:

SELECT category, SUM([quantity]*[price]) AS Total_Sales
FROM Retail_Data
GROUP BY category;

#2 Monthly Sales Trend:
SELECT 
    FORMAT(invoice_date, 'yyyy-MM') AS month,
    SUM(quantity * price) AS monthly_sales
FROM Retail_Data
GROUP BY FORMAT(invoice_date, 'yyyy-MM')
ORDER BY month DESC;

#3. Top 5 Customers by Sales:
SELECT TOP 5 customer_id, SUM(quantity * price) AS Total_Sales
FROM Retail_Data
GROUP BY customer_id
ORDER BY Total_Sales DESC;

#4 Gender-wise Sales Distribution:
SELECT gender, SUM(quantity * price) AS Total_Sales
FROM Retail_Data
GROUP BY gender;

#5 Payment Method Popularity:
SELECT payment_method, COUNT(*) AS transaction_count
FROM Retail_Data
GROUP BY payment_method
ORDER BY transaction_count DESC;

#6 Age Group Sales Analysis:
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+'
    END AS age_group,
    SUM(quantity * price) AS total_sales
FROM Retail_Data
GROUP BY age_group;

#7 Mall-wise Revenue Contribution:
SELECT shopping_mall, SUM(quantity * price) AS Total_Sales
FROM Retail_Data
GROUP BY shopping_mall;

# Advanced SQL Queries
#1 Daily Sales Performance:
SELECT invoice_date, SUM(quantity * price) AS daily_sales
FROM Retail_Data
GROUP BY invoice_date
ORDER BY invoice_date;

#2 Customer Lifetime Value (CLV):
SELECT customer_id, SUM(quantity * price) AS lifetime_value
FROM Retail_Data
GROUP BY customer_id
ORDER BY lifetime_value DESC;

#3 Category-wise Average Spending per Customer:
SELECT category, customer_id, AVG(quantity * price) AS avg_spending
FROM Retail_Data
GROUP BY category, customer_id;

#4 Identifying Frequent Buyers:
SELECT customer_id, COUNT(invoice_no) AS purchase_frequency
FROM Retail_Data
GROUP BY customer_id
HAVING COUNT(invoice_no) >3;

#5 Peak Shopping Hours Analysis (Assuming timestamp format for invoice_date):
SELECT HOUR(invoice_date) AS shopping_hour, SUM(quantity * price) AS total_sales
FROM Retail_Data
GROUP BY shopping_hour
ORDER BY total_sales DESC;

#6 High-Value Transactions (Above a Threshold):
SELECT 
    invoice_no, 
    customer_id, 
    SUM(quantity * price) AS transaction_value
FROM Retail_Data
GROUP BY invoice_no, customer_id
HAVING SUM(quantity * price) > 5000;

#7 Sales by Gender and Payment Method Combination:
SELECT gender, payment_method, SUM(quantity * price) AS total_sales
FROM Retail_Data
GROUP BY gender, payment_method;

#8 Best-Selling Products by Category: 
SELECT category, invoice_no, SUM(quantity) AS total_quantity_sold
FROM Retail_Data
GROUP BY category, invoice_no
ORDER BY total_quantity_sold DESC;



