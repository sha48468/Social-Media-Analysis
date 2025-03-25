# Social Media User Analysis

## Project Overview
This project explores patterns in social media usage through data analysis and machine learning. The process involves extracting and storing data in SQL, performing complex queries, visualizing key trends using Python, and building predictive models to estimate user engagement times. Despite various optimization attempts, the model faced inherent limitations due to dataset constraints.

## Workflow
### **1) Data Import & Storage (SQL)**
- The dataset was initially imported into **SQL Server**.
- Various **SQL queries** were executed, including:
  - Basic retrieval (`SELECT`, `WHERE`, `GROUP BY`).
  - Aggregations and calculations (`AVG()`, `COUNT()`).
  - Advanced filtering and conditional queries.
- Complex **queries** were performed to analyze trends based on gender, location, and platform usage.

### **2️) Data Analysis & Visualization (Python)**
- The dataset was exported from SQL and processed using **Pandas**.
- Visualizations were created using **Matplotlib** and **Seaborn** to explore:
  - Trends in **user engagement**.
  - Differences in **platform popularity**.
  - Correlations between **demographics and usage**.

### **3️) Predictive Modeling (Machine Learning)**
- A **Linear Regression model** was trained to predict `time_spent` on social media.
- Features such as **age and income** were used to build the model.
- Mean Absolute Error (**MAE**) was calculated to evaluate model performance.
- Various improvements were attempted, including:
  - **Feature Scaling** (Standardization & Normalization).
  - **Feature Engineering** (income-age ratio, categorical encoding).
  - **Alternative Models** (Random Forest, Gradient Boosting).
- Despite optimization efforts, the model exhibited an inherent level of error due to dataset limitations.

## Key Findings
- Users exhibit different **engagement levels** based on age, profession, and platform preference.
- **Facebook and Instagram** show the highest average time spent per session.
- Linear regression provided reasonable predictions but with a **notable error margin**.
- Additional **data collection** or more complex models may be required for better accuracy.

## Future Improvements
- Experimenting with **advanced ML models** such as XGBoost or Neural Networks.
- Collecting **more detailed user behavior data** (e.g., time of day, frequency of engagement).
- **Deploying the model** as an interactive dashboard for further real-world validation.
- Exploring **categorical predictions** instead of exact numerical predictions.

## How to Use
1. Clone the repository:
   ``git clone https://github.com/sha48468/Social-Media-Analysis.git ``
2. Run the SQL scripts to set up the database.
3. Execute Python scripts to generate visualizations and ML predictions.

## Technologies Used
- **SQL Server** – Data storage and querying.
- **Python (Pandas, Matplotlib, Seaborn, Scikit-learn)** – Data processing, visualization, and machine learning.
- **Jupyter Notebook** – Interactive analysis and model development.

---
### Contributors
Shahar Moskovics - [LinkedIn](www.linkedin.com/in/shahar-moskovics) | [GitHub](https://github.com/sha48468/Social-Media-Analysis.git)

