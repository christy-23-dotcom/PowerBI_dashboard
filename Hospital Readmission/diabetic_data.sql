
-- Hospital Readmission Dataset Cleaning and Preparation Using SQL

/*
This dataset represents patients hospitalized for diabetes. It has more than 100K records
This project focuses on cleaning and preparing a diabetic patient hospital dataset using SQL. 
The dataset contained missing values, inconsistent formats, and columns with a high percentage
of missing data. SQL was used to create a staging table, identify duplicate records,
handle missing values, standardize data formats, and remove low-quality columns. 
The cleaned dataset can be used for further analysis of hospital readmissions.
• Creating a staging table
• Checking duplicate records
• Handling missing values
• Cleaning diagnosis and age columns
• Validating data quality
• Removing columns with excessive missing data
• Preparing data for analysis
*/

CREATE DATABASE hospital;
USE hospital;
DESCRIBE diabetic_data;

-- Created a staging table to preserve the raw dataset
CREATE TABLE diabetic_staging LIKE diabetic_data;
INSERT diabetic_staging SELECT * FROM diabetic_data;
SELECT * FROM diabetic_staging LIMIT 10;

-- total patient records
SELECT COUNT(*) FROM diabetic_staging;
SELECT COUNT(DISTINCT(patient_nbr)) FROM diabetic_staging;

-- checked for duplicate
SELECT encounter_id,COUNT(*) FROM diabetic_staging 
GROUP BY encounter_id HAVING COUNT(*)>1;

/*
The dataset contained missing values represented as '?'.
These values were converted to NULL to ensure consistency
and simplify downstream analysis and reporting.
*/
-- Handled missing data
UPDATE diabetic_staging SET race = NULL WHERE race = '?';
UPDATE diabetic_staging SET medical_specialty = NULL WHERE medical_specialty = '?';

/*
The dataset contains three diagnosis columns representing
primary and secondary diagnoses. Missing values in diag_2
and diag_3 were converted to NULL. Age groups were cleaned
by removing bracket notation for easier analysis.
*/
UPDATE diabetic_staging SET diag_2 = NULL WHERE diag_2 = '?';
UPDATE diabetic_staging SET diag_3 = NULL WHERE diag_3 = '?';    
UPDATE diabetic_staging SET age = REPLACE(REPLACE(age,'[',''),')','');

/*
The weight and payer_code columns contained a very high percentage
of missing values (>90% and >40% respectively). Since these fields
provided limited analytical value and would require extensive
imputation, they were removed from the analysis dataset.
*/

SELECT COUNT(*) FROM diabetic_staging WHERE weight ='?';
SELECT COUNT(*) FROM diabetic_staging WHERE payer_code ='?';
ALTER TABLE diabetic_staging 
DROP COLUMN weight,
DROP COLUMN payer_code;

/*
In column admission type id had all mapped as disinct numbers with respect to
type of admission, so added another column to understand the admission type for quick view
*/
SELECT DISTINCT(admission_type_id) FROM diabetic_staging 
GROUP BY admission_type_id;

-- addded new column for admission type
ALTER TABLE diabetic_staging ADD COLUMN admission_category VARCHAR(20);
UPDATE diabetic_staging SET admission_category =
CASE 
  WHEN admission_type_id = 1 THEN 'Emergency'
  WHEN admission_type_id = 2 THEN 'Urgent'
  WHEN admission_type_id = 3 THEN 'Elective'
  WHEN admission_type_id = 4 THEN 'Newborn'
  WHEN admission_type_id IN (5,6,8) THEN 'Unknown'  
  WHEN admission_type_id = 7 THEN 'Trauma Centre'
END;  

-- EDA  
-- readmission distribution
/*
The majority of patients were not readmitted.
35,545 encounters resulted in readmission within 30 days,
while 11,357 encounters resulted in readmission after 30 days.
*/
SELECT readmitted, COUNT(*) AS Total FROM diabetic_staging GROUP BY readmitted; 

-- age distribution
/*
Majority of the age group falls under 70-80 age group
*/
SELECT age, COUNT(*) AS Total FROM diabetic_staging GROUP BY age;

-- Readmitted by gender
/* 
Cannot find any vast diffrence about 7653 difference for 
male from female population
*/
SELECT gender, COUNT(*) AS Total FROM diabetic_staging GROUP BY gender;

-- Readmission by admission type
/*
The emergency admission type is leading as patient might be having 
major condition which may require hospital stay longer
*/
SELECT admission_category, COUNT(*) AS Total FROM diabetic_staging 
WHERE readmitted ='<30' GROUP BY admission_category;

-- length of stay vs readmission
/*
Most of the patient have average stay of 4 days
*/
SELECT AVG(time_in_hospital) avg_hospital_stay, readmitted FROM diabetic_staging
GROUP BY readmitted; 

/*
Readmission can depenend on type of dieseases too. But the dataset consists of ICD 9 codes
mapped instead of medical term so i decided group them based on cardiac, lung, etc. 
Similar icd 9 codes are grouped into one category. So futher analysis will be performed on
top 10 category as a bench mark. All the code description were obtained from AAPC official site
*/
-- Grouping ICD 9 codes
SELECT diag_1, COUNT(*) AS Total FROM diabetic_staging GROUP BY diag_1 
ORDER BY COUNT(*) DESC LIMIT 20;

-- Added new column for ICD 9 codes
ALTER TABLE diabetic_staging ADD diagnosis_category VARCHAR(25);
UPDATE diabetic_staging
SET diagnosis_category=
CASE
    WHEN diag_1 LIKE '250%' THEN 'Diabetes'
    WHEN diag_1 LIKE '428%' THEN 'Heart Failure'
    WHEN diag_1 LIKE '414%' THEN 'Ischemic Heart Disease'
    WHEN diag_1 LIKE '786%' THEN 'Respiratory Symptoms'
    WHEN diag_1 LIKE '410%' THEN 'Heart Attack'
    WHEN diag_1 LIKE '486%' THEN 'Pneumonia'
    WHEN diag_1 LIKE '427%' THEN 'Cardiac Dysrhythmias'
    WHEN diag_1 LIKE '491%' THEN 'Chronic Bronchitis'
    WHEN diag_1 LIKE '715%' THEN 'Osteoarthritis'
    WHEN diag_1 LIKE '682%' THEN 'Cellulitis & Abscess'
    WHEN diag_1 LIKE '434%' THEN 'Stroke'
    ELSE 'Other Diagnoses'
END;  


