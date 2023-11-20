# Checking if Total_Bags column is accurate
SELECT 
  Date,
  Region,
  Small_Bags, 
  Large_Bags, 
  XLarge_Bags,
  Total_Bags,
  Small_Bags + Large_Bags + XLarge_Bags AS Total_Bags_Calc
FROM `avocadodatasetproject.avocado_data.avocado_prices`;

# Finding what percentage of total bags are small bags 
SELECT
  Date,
  Region,
  Total_Bags,
  Small_Bags,
  (Small_Bags/Total_Bags)*100 AS Small_Bags_Percent
FROM `avocadodatasetproject.avocado_data.avocado_prices`
WHERE Total_Bags <> 0;

# Finding what percentage of total bags are large bags 
SELECT
  Date,
  Region,
  Total_Bags,
  Large_Bags,
  (Large_Bags/Total_Bags)*100 AS Large_Bags_Percent
FROM `avocadodatasetproject.avocado_data.avocado_prices`
WHERE Total_Bags <> 0;

# Finding what percentage of total bags are xlarge bags 
SELECT
  Date,
  Region,
  Total_Bags,
  XLarge_Bags,
  (Xlarge_Bags/Total_Bags)*100 AS Xlarge_Bags_Percent
FROM `avocadodatasetproject.avocado_data.avocado_prices`
WHERE Total_Bags <> 0;

# Finding number of orders per year
SELECT
  EXTRACT(year FROM Date) AS year,
  COUNT(*) AS number_of_orders_year,
FROM `avocadodatasetproject.avocado_data.avocado_prices`
GROUP BY year
ORDER BY number_of_orders_year DESC ;

# Finding number of orders per region
SELECT Region,
  COUNT(*) AS number_of_orders_region,
FROM `avocadodatasetproject.avocado_data.avocado_prices`
GROUP BY Region
ORDER BY number_of_orders_region DESC ;

# First and last date recorded
SELECT 
  MIN(Date) AS Min_Date,
  MAX(Date) AS Max_Date
FROM `avocadodatasetproject.avocado_data.avocado_prices` ;

# Creating a temp table
WITH avg_price_over_1 AS (
  SELECT *
  FROM 
    `avocadodatasetproject.avocado_data.avocado_prices`
  WHERE
    AveragePrice >= 1
    
    )

# Count how many orders there are where the price per avocado is over $1

SELECT
  COUNT(*) as cnt
FROM
  avg_price_over_1 ;
