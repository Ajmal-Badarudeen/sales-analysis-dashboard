-- 1. Total Sales
SELECT SUM(Sales) FROM superstore;

-- 2. Total Profit
SELECT SUM(Profit) FROM superstore;

-- 3. Profit Margin
SELECT SUM(Profit)/SUM(Sales) FROM superstore;

-- 4. Sales by Region
SELECT Region, SUM(Sales) FROM superstore GROUP BY Region;

-- 5. Profit by Region
SELECT Region, SUM(Profit) FROM superstore GROUP BY Region;

-- 6. Top 10 Customers
SELECT [Customer Name], SUM(Sales) s FROM superstore GROUP BY [Customer Name] ORDER BY s DESC LIMIT 10;

-- 7. Top Products
SELECT [Product Name], SUM(Sales) s FROM superstore GROUP BY [Product Name] ORDER BY s DESC LIMIT 10;

-- 8. Loss-making Products
SELECT [Product Name], SUM(Profit) p FROM superstore GROUP BY [Product Name] HAVING p < 0;

-- 9. Category Performance
SELECT Category, SUM(Sales), SUM(Profit) FROM superstore GROUP BY Category;

-- 10. Sub-category Profit
SELECT Sub-Category, SUM(Profit) FROM superstore GROUP BY Sub-Category;

-- 11. Monthly Sales
SELECT strftime('%Y-%m',[Order Date]) m, SUM(Sales) FROM superstore GROUP BY m;

-- 12. Monthly Profit
SELECT strftime('%Y-%m',[Order Date]) m, SUM(Profit) FROM superstore GROUP BY m;

-- 13. Orders per Customer
SELECT [Customer Name], COUNT(*) FROM superstore GROUP BY [Customer Name];

-- 14. Repeat Customers (>5 orders)
SELECT [Customer Name] FROM superstore GROUP BY [Customer Name] HAVING COUNT(*)>5;

-- 15. Avg Order Value
SELECT AVG(Sales) FROM superstore;

-- 16. Region-wise AOV
SELECT Region, AVG(Sales) FROM superstore GROUP BY Region;

-- 17. Discount Impact
SELECT Discount, AVG(Profit) FROM superstore GROUP BY Discount;

-- 18. High Discount Loss
SELECT * FROM superstore WHERE Discount > 0.3 AND Profit < 0;

-- 19. Top Cities
SELECT City, SUM(Sales) FROM superstore GROUP BY City ORDER BY SUM(Sales) DESC LIMIT 10;

-- 20. Shipping Delay
SELECT AVG(julianday([Ship Date]) - julianday([Order Date])) FROM superstore;

-- 21. Segment Sales
SELECT Segment, SUM(Sales) FROM superstore GROUP BY Segment;

-- 22. Segment Profit
SELECT Segment, SUM(Profit) FROM superstore GROUP BY Segment;

-- 23. CLV (basic)
SELECT [Customer Name], SUM(Sales) FROM superstore GROUP BY [Customer Name];

-- 24. Yearly Sales
SELECT strftime('%Y',[Order Date]), SUM(Sales) FROM superstore GROUP BY 1;

-- 25. Yearly Profit
SELECT strftime('%Y',[Order Date]), SUM(Profit) FROM superstore GROUP BY 1;
