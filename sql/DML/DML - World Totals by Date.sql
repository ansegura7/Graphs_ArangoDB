USE [OVS_DEVOPS_WFS]
GO
WITH [cte_data] AS (
	SELECT [date], COUNT(*) AS [count_country],
		   SUM([total_cases]) AS [total_cases], SUM([total_deaths]) AS [total_deaths], SUM([total_tests]) AS [total_tests]
	  FROM [dbo].[v_daily_covid19_data]
	 --WHERE [country] = 'Colombia' AND [total_cases] > 0
	 GROUP BY [date]
)
SELECT [date], [count_country], [total_cases], [total_deaths], 
	   CAST(100.0 * [total_deaths] / [total_cases] AS float) AS [perc_deaths]
  FROM [cte_data]
 ORDER BY [date];
GO