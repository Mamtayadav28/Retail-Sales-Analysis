-- ===========================================================
-- Retail Sales Analysis using SQL
-- Database: retail_sales.db
-- Table Name: sales
-- Author: Mamta Yadav
-- ===========================================================

-- ============================================================
-- Query 1: Total Number of Records
-- ===========================================================
SELECT COUNT(*) AS Total_Rows
FROM sales;

-- ===========================================================
-- Query 2: Total Revenue
-- ===========================================================
SELECT SUM(Revenue) AS Total_Revenue
FROM sales;

-- ===========================================================
-- Query 3: Average Revenue Per Transaction
-- ===========================================================
SELECT AVG(Revenue) AS Average_Revenue
FROM sales;

-- ===========================================================
-- Query 4: Highest Revenue Transaction
-- ===========================================================
SELECT MAX(Revenue) AS Highest_Revenue
FROM sales;

-- ===========================================================
-- Query 5: Lowest Revenue Transaction
-- ===========================================================
SELECT MIN(Revenue) AS Lowest_Revenue
FROM sales;

-- ===========================================================
-- Query 6: Total Unique Customers
-- ===========================================================
SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM sales;

-- ===========================================================
-- Query 7: Revenue by Country
-- ===========================================================
SELECT
    Country,
    SUM(Revenue) AS Total_Revenue
FROM sales
GROUP BY Country
ORDER BY Total_Revenue DESC;

-- ===========================================================
-- Query 8: Top 10 Customers by Revenue
-- ===========================================================
SELECT
    CustomerID,
    SUM(Revenue) AS Total_Revenue
FROM sales
GROUP BY CustomerID
ORDER BY Total_Revenue DESC
LIMIT 10;

-- ===========================================================
-- Query 9: Top 10 Products by Revenue
-- ===========================================================
SELECT
    Description,
    SUM(Revenue) AS Total_Revenue
FROM sales
GROUP BY Description
ORDER BY Total_Revenue DESC
LIMIT 10;

-- ===========================================================
-- Query 10: Top 10 Most Sold Products
-- ===========================================================
SELECT
    Description,
    SUM(Quantity) AS Total_Quantity
FROM sales
GROUP BY Description
ORDER BY Total_Quantity DESC
LIMIT 10;

-- ===========================================================
-- Query 11: Monthly Revenue
-- ===========================================================
SELECT
    Month_Number,
    Order_Month,
    SUM(Revenue) AS Total_Revenue
FROM sales
GROUP BY Month_Number, Order_Month
ORDER BY Month_Number;

-- ===========================================================
-- Query 12: Revenue by Weekday
-- ===========================================================
SELECT
    Order_Day,
    SUM(Revenue) AS Total_Revenue
FROM sales
GROUP BY Order_Day;

-- ===========================================================
-- Query 13: Revenue by Hour
-- ===========================================================
SELECT
    Order_Hour,
    SUM(Revenue) AS Total_Revenue
FROM sales
GROUP BY Order_Hour
ORDER BY Order_Hour;

-- ===========================================================
-- Query 14: Average Order Value (AOV)
-- ===========================================================
SELECT
    SUM(Revenue) / COUNT(DISTINCT InvoiceNo) AS Average_Order_Value
FROM sales;

-- ===========================================================
-- Query 15: Repeat Customers
-- ===========================================================
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM sales
GROUP BY CustomerID
HAVING COUNT(DISTINCT InvoiceNo) > 1
ORDER BY Total_Orders DESC;

-- ===========================================================
-- Query 16: Top 10 Highest Revenue Invoices
-- ===========================================================
SELECT
    InvoiceNo,
    SUM(Revenue) AS Total_Revenue
FROM sales
GROUP BY InvoiceNo
ORDER BY Total_Revenue DESC
LIMIT 10;

-- ===========================================================
-- Query 17: Products with Revenue Above Average
-- ===========================================================
SELECT
    Description,
    Revenue
FROM sales
WHERE Revenue >
(
    SELECT AVG(Revenue)
    FROM sales
)
ORDER BY Revenue DESC;

-- ===========================================================
-- Query 18: Customers Spending More Than £1000
-- ===========================================================
SELECT
    CustomerID,
    SUM(Revenue) AS Total_Spent
FROM sales
GROUP BY CustomerID
HAVING SUM(Revenue) > 1000
ORDER BY Total_Spent DESC;

-- ===========================================================
-- Query 19: Number of Orders by Country
-- ===========================================================
SELECT
    Country,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM sales
GROUP BY Country
ORDER BY Total_Orders DESC;

-- ===========================================================
-- Query 20: Product Performance Report
-- ===========================================================
SELECT
    Description,
    SUM(Quantity) AS Total_Quantity_Sold,
    SUM(Revenue) AS Total_Revenue,
    AVG(UnitPrice) AS Average_Unit_Price
FROM sales
GROUP BY Description
ORDER BY Total_Revenue DESC
LIMIT 10;