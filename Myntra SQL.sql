--create table
CREATE TABLE myntra (
    pants_id SERIAL PRIMARY KEY,
    brand_name VARCHAR(100),
    pants_description TEXT,
    price DECIMAL(10,2),
    MRP DECIMAL(10,2),
    discount_percent DECIMAL(5,2),
    ratings DECIMAL(3,2),
    number_of_ratings INT
);

--Run table
SELECT * FROM myntra;

--import data
COPY myntra(brand_name, pants_description, price, MRP, discount_percent, ratings, number_of_ratings)
FROM 'C:/Users/aryak/Desktop/Data Analyst/SQL/myntra_dataset_ByScraping.csv'
DELIMITER ',' CSV HEADER;


DROP TABLE myntra;

--Alter Myntra Table
ALTER TABLE myntra
ALTER COLUMN number_of_ratings TYPE FLOAT;


--Add Column
ALTER TABLE myntra
ADD COLUMN cost FLOAT;

-- Add Data In Cost Column
UPDATE myntra
SET cost = FLOOR(price * (0.3 + random() * 0.4));




--Project

--Calculate Effective Selling Price After Discount

SELECT 
  pants_id,
  brand_name,
  price,
  discount_percent,
  ROUND(price * (1 - discount_percent / 100), 2) AS effective_price
FROM myntra;


-- Aggregate Brand Performanc
SELECT 
  brand_name,
  COUNT(*) AS total_products,
  AVG(price) AS avg_price,
  AVG(ratings) AS avg_rating,
  SUM(number_of_ratings) AS total_ratings
FROM myntra
GROUP BY brand_name
ORDER BY total_ratings DESC;



--Filter High-Performing Product
SELECT *
FROM myntra
WHERE ratings >= 3.5 AND number_of_ratings > 1000
ORDER BY ratings DESC, number_of_ratings DESC;



--💸 Cost Efficiency Analysis (with your cost column)
SELECT 
  pants_id,
  brand_name,
  price,
  cost,
  ROUND((price - cost)::NUMERIC, 2) AS margin,
  ROUND(((price - cost) / cost)::NUMERIC, 2) AS margin_percent
FROM myntra
WHERE cost IS NOT NULL
ORDER BY margin_percent DESC;


--Flag High-Margin, High-Rated Products by Brand
SELECT 
  brand_name,
  pants_id,
  price,
  cost,
  ROUND((price - cost)::NUMERIC, 2) AS margin,
  ROUND(((price - cost) / cost)::NUMERIC * 100, 2) AS margin_percent,
  ratings,
  number_of_ratings,
  CASE 
    WHEN ratings >= 4.5 AND number_of_ratings > 500 THEN 'Top Performer'
    WHEN ratings >= 4.0 THEN 'Good Performer'
    ELSE 'Average'
  END AS performance_flag
FROM myntra
WHERE cost IS NOT NULL
  AND ((price - cost) / cost) * 100 >= 50
ORDER BY margin_percent DESC, ratings DESC;