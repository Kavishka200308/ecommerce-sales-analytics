-- =====================================================
-- E-Commerce Sales Analytics
-- SQL Business Analysis
-- =====================================================


-- 1. Total Revenue
SELECT
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM sales;


-- 2. Total Orders and Customers
SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM sales;


-- 3. Revenue by Product Category
SELECT
    Category,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM sales
GROUP BY Category
ORDER BY Total_Revenue DESC;


-- 4. Top 10 Best-Selling Products
SELECT
    Product,
    SUM(Quantity) AS Total_Quantity_Sold
FROM sales
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;


-- 5. Revenue by City
SELECT
    City,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM sales
GROUP BY City
ORDER BY Total_Revenue DESC;


-- 6. Top 10 Customers by Revenue
SELECT
    Customer_ID,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM sales
GROUP BY Customer_ID
ORDER BY Total_Revenue DESC
LIMIT 10;


-- 7. Monthly Revenue
SELECT
    SUBSTR(Order_Date, 1, 7) AS Month,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM sales
GROUP BY Month
ORDER BY Month;


-- 8. Revenue by Payment Method
SELECT
    Payment_Method,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM sales
GROUP BY Payment_Method
ORDER BY Total_Revenue DESC;


-- 9. Average Order Value
SELECT
    ROUND(
        SUM(Revenue) / COUNT(DISTINCT Order_ID),
        2
    ) AS Average_Order_Value
FROM sales;


-- 10. Highest Revenue Order
SELECT
    Order_ID,
    Customer_ID,
    Product,
    City,
    Revenue
FROM sales
ORDER BY Revenue DESC
LIMIT 10;