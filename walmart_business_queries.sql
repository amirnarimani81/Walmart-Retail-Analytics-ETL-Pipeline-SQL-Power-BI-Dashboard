-- Walmart Project Queries - MySQL

SELECT * FROM walmart;

-- DROP TABLE walmart;

-- DROP TABLE walmart;

-- Count total records
SELECT COUNT(*) FROM walmart;

-- Count payment methods and number of transactions by payment method
SELECT 
    payment_method,
    COUNT(*) AS no_payments
FROM walmart
GROUP BY payment_method;

-- Count distinct branches
SELECT COUNT(DISTINCT branch) FROM walmart;

-- Find the minimum quantity sold
SELECT MIN(quantity) FROM walmart;

-- Business Problem Q1: Find different payment methods, number of transactions, and quantity sold by payment method
SELECT 
    payment_method,
    COUNT(*) AS no_payments,
    SUM(quantity) AS no_qty_sold
FROM walmart
GROUP BY payment_method;

-- Project Question #2: Identify the highest-rated category in each branch
-- Display the branch, category, and avg rating
SELECT branch, category, avg_rating
FROM (
    SELECT 
        branch,
        category,
        AVG(rating) AS avg_rating,
        RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) AS rank
    FROM walmart
    GROUP BY branch, category
) AS ranked
WHERE rank = 1;

-- Q3: Identify the busiest day for each branch based on the number of transactions
SELECT branch, day_name, no_transactions
FROM (
    SELECT 
        branch,
        DAYNAME(STR_TO_DATE(date, '%d/%m/%Y')) AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS rank
    FROM walmart
    GROUP BY branch, day_name
) AS ranked
WHERE rank = 1;

-- Q4: Calculate the total quantity of items sold per payment method
SELECT 
    payment_method,
    SUM(quantity) AS no_qty_sold
FROM walmart
GROUP BY payment_method;

-- Q5: Determine the average, minimum, and maximum rating of categories for each city
SELECT 
    city,
    category,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    AVG(rating) AS avg_rating
FROM walmart
GROUP BY city, category;

-- Q6: Calculate the total profit for each category
SELECT 
    category,
    SUM(unit_price * quantity * profit_margin) AS total_profit
FROM walmart
GROUP BY category
ORDER BY total_profit DESC;

-- Q7: Determine the most common payment method for each branch
WITH cte AS (
    SELECT 
        branch,
        payment_method,
        COUNT(*) AS total_trans,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS rank
    FROM walmart
    GROUP BY branch, payment_method
)
SELECT branch, payment_method AS preferred_payment_method
FROM cte
WHERE rank = 1;

-- Q8: Categorize sales into Morning, Afternoon, and Evening shifts
SELECT
    branch,
    CASE 
        WHEN HOUR(TIME(time)) < 12 THEN 'Morning'
        WHEN HOUR(TIME(time)) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS num_invoices
FROM walmart
GROUP BY branch, shift
ORDER BY branch, num_invoices DESC;

-- Q9: Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)
WITH revenue_2022 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2022
    GROUP BY branch
),
revenue_2023 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2023
    GROUP BY branch
)
SELECT 
    r2022.branch,
    r2022.revenue AS last_year_revenue,
    r2023.revenue AS current_year_revenue,
    ROUND(((r2022.revenue - r2023.revenue) / r2022.revenue) * 100, 2) AS revenue_decrease_ratio
FROM revenue_2022 AS r2022
JOIN revenue_2023 AS r2023 ON r2022.branch = r2023.branch
WHERE r2022.revenue > r2023.revenue
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;

-- Q10 Calculate the total sales (Total) for each category and rank the categories based on the highest sales.
SELECT 
    Category,
    SUM(Total) AS total_sales,
    RANK() OVER (ORDER BY SUM(Total) DESC) AS sales_rank
FROM walmart
GROUP BY Category;



-- Q11 Calculate the total monthly sales for each year and show the month-over-month difference.
WITH monthly_sales AS (
    SELECT 
        YEAR(Date) AS year,
        MONTH(Date) AS month,
        SUM(Total) AS total_sales
    FROM walmart
    GROUP BY year, month
)
SELECT *,
       total_sales - LAG(total_sales) OVER (PARTITION BY year ORDER BY month) AS month_diff
FROM monthly_sales
ORDER BY year, month;

-- Q12 Label each sale hour as "High" if total sales exceed 10,000 and "Low" otherwise.
SELECT 
    HOUR(Time) AS sale_hour,
    SUM(Total) AS total_sales,
    CASE 
        WHEN SUM(Total) > 10000 THEN 'High'
        ELSE 'Low'
    END AS sales_level
FROM walmart
GROUP BY sale_hour
ORDER BY total_sales DESC;

-- Q13 Calculate the percentage contribution of each branch to the overall sales.
SELECT 
    Branch,
    SUM(Total) AS branch_sales,
    ROUND((SUM(Total) / (SELECT SUM(Total) FROM walmart) * 100), 2) AS sales_percent
FROM walmart
GROUP BY Branch
ORDER BY sales_percent DESC;



-- Q14 Show how much total sales occurred on weekdays versus weekends.
SELECT 
    CASE 
        WHEN DAYOFWEEK(Date) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    SUM(Total) AS total_sales
FROM walmart
GROUP BY day_type;