-- I will start cleaning the data. 
-- I will check for dupliacte rows 
SELECT COUNT(*) - COUNT(*) FROM (
  SELECT DISTINCT
    time, v1, v2, v3, v4, v5, v6, v7, v8, v9,
    v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,
    v20, v21, v22, v23, v24, v25, v26, v27, v28,
    amount, class
  FROM credit_card_transactions
) AS distinct_rows;

-- From the above, I know there are no dupliacte values.
-- I will now check if there are any nulls

SELECT 
  COUNT(*) FILTER (WHERE time IS NULL) AS time_nulls,
  COUNT(*) FILTER (WHERE v1 IS NULL) AS v1_nulls,
  COUNT(*) FILTER (WHERE v2 IS NULL) AS v2_nulls,
  COUNT(*) FILTER (WHERE v3 IS NULL) AS v3_nulls,
  COUNT(*) FILTER (WHERE v4 IS NULL) AS v4_nulls,
  COUNT(*) FILTER (WHERE v5 IS NULL) AS v5_nulls,
  COUNT(*) FILTER (WHERE v6 IS NULL) AS v6_nulls,
  COUNT(*) FILTER (WHERE v7 IS NULL) AS v7_nulls,
  COUNT(*) FILTER (WHERE v8 IS NULL) AS v8_nulls,
  COUNT(*) FILTER (WHERE v9 IS NULL) AS v9_nulls,
  COUNT(*) FILTER (WHERE v10 IS NULL) AS v10_nulls,
  COUNT(*) FILTER (WHERE v11 IS NULL) AS v11_nulls,
  COUNT(*) FILTER (WHERE v12 IS NULL) AS v12_nulls,
  COUNT(*) FILTER (WHERE v13 IS NULL) AS v13_nulls,
  COUNT(*) FILTER (WHERE v14 IS NULL) AS v14_nulls,
  COUNT(*) FILTER (WHERE v15 IS NULL) AS v15_nulls,
  COUNT(*) FILTER (WHERE v16 IS NULL) AS v16_nulls,
  COUNT(*) FILTER (WHERE v17 IS NULL) AS v17_nulls,
  COUNT(*) FILTER (WHERE v18 IS NULL) AS v18_nulls,
  COUNT(*) FILTER (WHERE v19 IS NULL) AS v19_nulls,
  COUNT(*) FILTER (WHERE v20 IS NULL) AS v20_nulls,
  COUNT(*) FILTER (WHERE v21 IS NULL) AS v21_nulls,
  COUNT(*) FILTER (WHERE v22 IS NULL) AS v22_nulls,
  COUNT(*) FILTER (WHERE v23 IS NULL) AS v23_nulls,
  COUNT(*) FILTER (WHERE v24 IS NULL) AS v24_nulls,
  COUNT(*) FILTER (WHERE v25 IS NULL) AS v25_nulls,
  COUNT(*) FILTER (WHERE v26 IS NULL) AS v26_nulls,
  COUNT(*) FILTER (WHERE v27 IS NULL) AS v27_nulls,
  COUNT(*) FILTER (WHERE v28 IS NULL) AS v28_nulls,
  COUNT(*) FILTER (WHERE amount IS NULL) AS amount_nulls,
  COUNT(*) FILTER (WHERE class IS NULL) AS class_nulls
FROM credit_card_transactions;

-- There are no nulls in the data. 

-- Now, I will add a new column that catagorizes risky/unusual transactions 
ALTER TABLE credit_card_transactions
ADD COLUMN amount_level TEXT;

--Next, I will bucket the transactions by their amount
UPDATE credit_card_transactions
SET amount_level = CASE
  WHEN amount < 50 THEN 'Low'
  WHEN amount BETWEEN 50 AND 200 THEN 'Medium'
  ELSE 'High'
END;

-- Now, I will run my analysis query
SELECT 
  amount_level,
  COUNT(*) AS total,
  SUM(class) AS fraud_count,
  ROUND(SUM(class)::decimal / COUNT(*), 4) AS fraud_rate
FROM credit_card_transactions
GROUP BY amount_level;

-- High value transactions have the highest fraud rate. 
-- The fraud rate can help us identify potentially risky accounts.

-- Now, I will move along to convert time into hours to better track risky transactions
ALTER TABLE credit_card_transactions ADD COLUMN transaction_hour INTEGER;

UPDATE credit_card_transactions
SET transaction_hour = FLOOR(time / 3600);

-- Now, I will visualize the fraud rate by hour
SELECT 
  transaction_hour,
  COUNT(*) AS total,
  SUM(class) AS fraud_count,
  ROUND(SUM(class)::decimal / COUNT(*), 4) AS fraud_rate
FROM credit_card_transactions
GROUP BY transaction_hour
ORDER BY transaction_hour;

-- I will also clean the hours so they fit the 24-hour schedule
SELECT 
  (FLOOR(time / 3600) % 24) AS hour_of_day,
  COUNT(*) AS total,
  SUM(class) AS fraud_count,
  ROUND(SUM(class)::decimal / COUNT(*), 4) AS fraud_rate
FROM credit_card_transactions
GROUP BY hour_of_day
ORDER BY hour_of_day;

-- Now, I will group these into the fraud rate by amount level and hour of day
SELECT 
  amount_level,
  (FLOOR(time / 3600) % 24) AS hour_of_day,
  COUNT(*) AS total,
  SUM(class) AS fraud_count,
  ROUND(SUM(class)::decimal / COUNT(*), 4) AS fraud_rate
FROM credit_card_transactions
GROUP BY amount_level, hour_of_day
ORDER BY amount_level, hour_of_day;

-- These insights bucket the highest, mideum, and lowest risky transactions for 
