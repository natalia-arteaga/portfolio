-- I'll start visualizing my data

SELECT * FROM diabetes

-- Now, I'll see where I may have 0 = invalid in some fields 
SELECT 
  COUNT(*) FILTER (WHERE glucose = 0) AS glucose_zeros,
  COUNT(*) FILTER (WHERE bloodpressure = 0) AS bloodpressure_zeros,
  COUNT(*) FILTER (WHERE skinthickness = 0) AS skinthickness_zeros,
  COUNT(*) FILTER (WHERE insulin = 0) AS insulin_zeros,
  COUNT(*) FILTER (WHERE bmi = 0) AS bmi_zeros
FROM diabetes;

-- Now, I will work to clean my data and add NULL where applicable

UPDATE diabetes SET glucose = NULL WHERE glucose = 0;
UPDATE diabetes SET insulin = NULL WHERE insulin = 0;
UPDATE diabetes SET bmi = NULL WHERE bmi = 0;
UPDATE diabetes SET bloodpressure = NULL WHERE bloodpressure = 0;
UPDATE diabetes SET skinthickness = NULL WHERE skinthickness = 0;

-- In the below, I am just confirming that the null clean up work is completed

SELECT 
  COUNT(*) FILTER (WHERE glucose IS NULL) AS null_glucose,
  COUNT(*) FILTER (WHERE insulin IS NULL) AS null_insulin,
  COUNT(*) FILTER (WHERE bmi IS NULL) AS null_bmi,
  COUNT(*) FILTER (WHERE bloodpressure IS NULL) AS null_bp,
  COUNT(*) FILTER (WHERE skinthickness IS NULL) AS null_skin
FROM diabetes;

-- Now, I wil 

SELECT 
  outcome,
  COUNT(*) AS patient_count
FROM diabetes
GROUP BY outcome
ORDER BY outcome;


-- For easier parsing of the data, now I will extract a new table without the NULL values and use it in my tableau dashboard 

SELECT outcome, ROUND(AVG(glucose), 1)
FROM diabetes
WHERE glucose IS NOT NULL
GROUP BY outcome;


