

CREATE DATABASE hospital;
USE hospital;

DESCRIBE diabetic_data;
SELECT * FROM diabetic_data;
SELECT COUNT(readmitted) FROM diabetic_data WHERE readmitted=">30";
