-- 1. Exploration: Overview of the cleaned dataset
SELECT * FROM layoffs_cleaned_final;

-- 2. Extremes: Identifying the peak of layoffs in a single record
-- 'max_laid_off' and 'max_percentage' make the output much cleaner.
SELECT MAX(total_laid_off) AS max_laid_off, MAX(percentage_laid_off) AS max_percentage
FROM layoffs_cleaned_final;

-- 3. Failure Analysis: Fully liquidated companies (100% layoffs)
SELECT *
FROM layoffs_cleaned_final
WHERE percentage_laid_off = 1
ORDER BY funds_raised DESC;

-- 4. Corporate Impact: Top 10 companies with the highest cumulative layoffs
-- Using 'total_layoffs' as an alias for the sum.
SELECT company, SUM(total_laid_off) AS total_layoffs
FROM layoffs_cleaned_final
GROUP BY company
ORDER BY total_layoffs DESC
LIMIT 10;

-- 5. Sector Analysis: Layoffs distributed by Industry
-- Using 'total_layoffs' alias for consistency.
SELECT industry, SUM(total_laid_off) AS total_layoffs
FROM layoffs_cleaned_final
GROUP BY industry
ORDER BY total_layoffs DESC;

-- 6. Temporal Analysis: Total layoffs per Year
-- 'layoff_year' and 'total_layoffs' help clarify the time-based data.
SELECT YEAR(`date`) AS layoff_year, SUM(total_laid_off) AS total_layoffs
FROM layoffs_cleaned_final
GROUP BY layoff_year
ORDER BY total_layoffs DESC;

-- 7. Geographic Impact: Total layoffs by Country
-- Using 'total_layoffs' alias for the final ranking.
SELECT country, SUM(total_laid_off) AS total_layoffs
FROM layoffs_cleaned_final
GROUP BY country
ORDER BY total_layoffs DESC;

-- 8. Time Series: Monthly progression and Rolling Total
-- Insight: A "Snowball Effect" view of layoffs accumulating over time.
WITH Rolling_total AS (
    SELECT SUBSTRING(`date`, 1, 7) AS `month`, SUM(total_laid_off) AS total_off
    FROM layoffs_cleaned_final
    GROUP BY `month`
    ORDER BY 1 ASC
)
SELECT
    `month`, 
    total_off, 
    SUM(total_off) OVER(ORDER BY `month`) AS rolling_total
FROM Rolling_total;

-- 9. Advanced Ranking: Top 5 Companies per Year
-- Insight: Using Window Functions to identify the leading layoff contributors for each specific year.
WITH company_year AS (
    SELECT company, YEAR(`date`) AS years, SUM(total_laid_off) AS total_laid_off
    FROM layoffs_cleaned_final
    GROUP BY company, YEAR(`date`)
),
company_year_rank AS (
    SELECT *,
    DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
    FROM company_year
)
SELECT *
FROM company_year_rank
WHERE ranking <= 5
ORDER BY years ASC, total_laid_off DESC;