# World Layoffs Data Exploration (SQL)

## 📌 Project Overview
This project aims to perform **Exploratory Data Analysis (EDA)** on the global layoffs dataset. The primary objective is to understand workforce reduction trends, industry patterns, and the evolution of the economic crisis from the pandemic era (2020) to the current landscape (2024-2025).

## Tools & Techniques
- **Database:** MySQL
- **SQL Skills Used:**
  - **DML:** Data cleaning and standardization.
  - **Aggregate Functions:** `SUM`, `MAX` for high-level statistics.
  - **String & Date Functions:** `SUBSTRING`, `YEAR` for time-series extraction.
  - **Window Functions:** `DENSE_RANK`, `SUM OVER` for cumulative analysis and ranking.
  - **CTEs (Common Table Expressions):** Managing complex, multi-level queries.

## 📊 Key Findings
Based on the 9 SQL queries executed, here are the key insights discovered:

### 1. Extreme Events
- **Single Day Record:** The highest number of layoffs in a single day reached **22,000 employees**.
- **High Profile Failure:** **Britishvolt** was identified as the company with the highest funds raised that eventually went bankrupt (100% layoffs).

### 2. Market Leaders Impact
- **Top All-Time:** Cumulatively, **Intel** recorded the highest number of workforce reductions in this dataset.
- **Industry Hit:** The **"Other"** category topped the list, followed by specific major industries: **Retail**, **Transportation**, and **Hardware**, reflecting a broad economic impact across logistics and technology sectors.

### 3. Geographic Distribution
- While the United States dominates the global figures, **India** and **Germany** emerged as the most impacted countries in the Asian and European regions respectively, highlighting the global scale of the crisis.

### 4. Evolution of Crisis (Top Layoffs per Year)
Using *Window Functions* to rank the top contributors annually, distinct shifts in the crisis focus were observed:
- **2020 (Pandemic Start):** **Uber** (Transportation/Ride-hailing hit by lockdowns).
- **2021 (Construction/Tech):** **Katerra** (Collapse of a tech-driven construction startup).
- **2022 (Post-Pandemic Pivot):** **Meta** (Major efficiency restructuring).
- **2023 (Year of Efficiency):** **Google** (Profitability focus in Big Tech).
- **2024 - 2025 (Hardware/Chip Crisis):** **Intel** (Signaling a crisis shift towards the Hardware/Semiconductor sector).

### 5. Growth Trend
- **Rolling Total:** The cumulative layoff chart shows an exponential increase with no significant signs of slowing down through the 2025 period.

## 📂 SQL Query Structure
The `Layoffs_EDA_Project.sql` file contains the following analysis steps:
1.  **Data Overview:** Checking data structure and schema.
2.  **Max Layoffs:** Identifying extreme values.
3.  **Bankruptcy Check:** Analyzing companies that went under.
4.  **Top Companies:** All-time ranking of layoffs.
5.  **Industry Analysis:** Impact by sector.
6.  **Yearly Trend:** Total layoffs per year.
7.  **Country Analysis:** Geographic impact analysis.
8.  **Rolling Total:** Cumulative Time Series analysis.
9.  **Yearly Ranking:** Top 5 companies per year (using CTE + Partition By).

---
*This project is documented as part of a Data Analyst portfolio.*
