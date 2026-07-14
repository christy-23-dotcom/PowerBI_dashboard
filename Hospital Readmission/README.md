# 🏥 Hospital Readmission Risk Analysis for Diabetic Patients

## 📌 Project Overview

Hospital readmissions are a key healthcare quality indicator that impact patient outcomes, hospital performance, and healthcare costs.

Reducing avoidable readmissions helps improve patient care, optimize hospital resources, and support better clinical decision-making.

This project uses healthcare data analytics to explore readmission patterns among diabetic patients and identify factors associated with readmission risk.

---

## ❓ Why 30-Day Readmission?

A **30-day readmission** is a widely used healthcare quality metric that measures whether a patient returns to the hospital within **30 days of discharge**.

The 30-day period is commonly used because:
- Most preventable complications occur shortly after discharge.
- It reflects the quality of inpatient care, discharge planning, and follow-up care.
- It is an internationally recognized healthcare quality indicator.
- Healthcare organizations use this metric to evaluate quality of care and identify high-risk patient groups.
- Monitoring 30-day readmissions helps improve patient outcomes and reduce healthcare costs.

---

## 🎯 Objectives

- Analyse hospital readmission patterns among diabetic patients.
- Measure key performance indicators such as readmission rate and average length of stay.
- Identify demographic and clinical factors associated with readmissions.
- Explore diagnosis and admission trends.
- Develop an interactive Power BI dashboard for healthcare decision support.

---

## 📂 Dataset

**Dataset:** UCI Machine Learning Repository – Diabetes Dataset

The dataset contains patient encounter information collected from multiple hospitals in the United States and is widely used for healthcare analytics and machine learning research.

---

## 🛠️ Tools Used

- Power BI
- SQL
- DAX
- Excel

---

## 📊 Dashboard Criteria

### KPI Cards
- Total Patients
- Unique Patients
- Readmission Rate
- Average Length of Stay (LOS)

### Visualizations

**Column Charts**
- Readmission by LOS
- Inpatient Visits by Readmission Status

**Donut Charts**
- Readmission Distribution
- Readmission by Gender

**Bar Charts**
- Top Diagnoses Contributing to Readmission
- Emergency vs Elective Admission Comparison

**Line Chart**
- Readmission Rate by Age Group

---

# 📈 Key Findings

## Admission Type Analysis

- Emergency admissions contributed to the highest number of readmissions (**6,200**), followed by Urgent (**2,100**) and Elective (**2,000**).

**Insight**

Emergency admissions show a significantly higher readmission risk compared to other admission types.

---

## Top Diagnoses Associated with Readmission

- Diabetes had the highest readmission frequency (**1,137**).
- Heart Failure was the second major contributor (**968**).
- Other contributing conditions included:
  - Ischemic Heart Disease
  - Heart Attack
  - Stroke
  - Pneumonia

**Insight**

Chronic conditions such as Diabetes and Heart Failure are major drivers of repeated hospital visits.

---

## Average Length of Stay (LOS) by Readmission Status

| Readmission Status | Average LOS |
|-------------------|------------:|
| Readmitted <30 Days | 4.7 Days |
| Readmitted >30 Days | 4.5 Days |
| Not Readmitted | 4.2 Days |

**Insight**

Patients readmitted within 30 days had the highest average LOS, suggesting greater illness severity and higher care needs during the initial hospitalization.

---

## Inpatient Visits by Readmission Status

- Readmitted <30 Days: **1.2 visits**
- Readmitted >30 Days: **0.8 visits**

**Insight**

Patients with 30-day readmissions had more previous inpatient visits, indicating a pattern of complex or recurring health conditions.

---

## 30-Day Readmission Rate by Age Group

- Highest readmission rate observed in **20–30 age group (14%)**
- Older age groups **70–80** and **80–90** showed approximately **12%**
- Middle age groups (**30–60**) remained around **11%**
- Lowest rates observed in younger groups (**0–10: 2%**)

**Insight**

The highest readmission rate was not observed among elderly patients; the 20–30 age group showed the highest risk, indicating that factors beyond age alone may influence readmission.

---

## Gender Distribution Among Readmitted Patients

- Female: **54.17%**
- Male: **45.83%**

**Insight**

Readmissions were slightly higher among female patients, but the difference between genders was relatively small.

---

# 💡 Recommendations

- Strengthen diabetes and heart failure management programs.

  Provide coordinated care pathways for patients with these high-risk conditions to improve chronic disease control and reduce recurrence.

- Implement early follow-up for emergency admissions.

  Introduce structured post-discharge follow-up calls within 72 hours for emergency admission patients to reduce preventable readmissions.

- Develop targeted care plans for high-risk age groups.

  Closely monitor the 20–30 age group due to the highest 30-day readmission rate and investigate underlying factors contributing to their risk.

- Use prior hospitalization history for risk identification.

  Flag patients with multiple previous inpatient visits for enhanced discharge planning and closer post-discharge monitoring.

- Focus on discharge quality rather than length of stay alone.

  Longer hospitalization does not necessarily prevent readmission; improving medication reconciliation, patient education, and follow-up support is essential.

---

# 📌 Conclusion

This dashboard provides valuable insights into hospital readmission patterns among diabetic patients by analyzing demographic, clinical, and hospitalization factors.

The analysis highlights that emergency admissions, chronic conditions such as diabetes and heart failure, previous inpatient visits, and specific age groups contribute significantly to readmission risk.

The dashboard can support healthcare professionals in identifying high-risk patients, improving discharge planning, and making data-driven decisions to reduce avoidable hospital readmissions and improve patient outcomes.

---

## 🚀 Skills Demonstrated

- Healthcare Analytics
- Power BI
- SQL
- DAX
- Data Visualization
- Dashboard Design
- KPI Development
- Data Storytelling

---

📊 Dashboard

The complete interactive dashboard has been included in this repository for easy viewing.

![Hospital Readmission Dashboard](./Hospital%20Readmission/dashboard.png)