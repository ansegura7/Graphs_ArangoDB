-- Daily data by country
SELECT [country], [total_cases], [total_deaths], ISNULL([total_recovered], 0) AS [total_recovered], [active_cases], ISNULL([serious_critical], 0) AS [serious_critical], 
	   ISNULL([tot_cases_1m_pop], 0) AS [tot_cases_1m_pop], ISNULL([deaths_1m_pop], 0) AS [deaths_1m_pop], ISNULL([total_tests], 0) AS [total_tests], 
	   ISNULL([tests_1m_pop], 0) AS [tests_1m_pop], [date], 
	   (CASE WHEN total_cases > 0 THEN 100.0 * total_deaths / total_cases ELSE 0 END) AS [perc_deaths],
	   (CASE WHEN total_tests > 0 THEN 100.0 * total_cases / total_tests ELSE 0 END) AS [perc_infection]
  FROM [dbo].[v_daily_covid19_data];
GO

-- Colombia daily data
SELECT [country], [total_cases], [total_deaths], ISNULL([total_recovered], 0) AS [total_recovered], [active_cases], ISNULL([serious_critical], 0) AS [serious_critical], 
	   ISNULL([tot_cases_1m_pop], 0) AS [tot_cases_1m_pop], ISNULL([deaths_1m_pop], 0) AS [deaths_1m_pop], ISNULL([total_tests], 0) AS [total_tests], 
	   ISNULL([tests_1m_pop], 0) AS [tests_1m_pop], [date], 
	   (CASE WHEN total_cases > 0 THEN 100.0 * total_deaths / total_cases ELSE 0 END) AS [perc_deaths],
	   (CASE WHEN total_tests > 0 THEN 100.0 * total_cases / total_tests ELSE 0 END) AS [perc_infection]
  FROM [dbo].[v_daily_covid19_data]
 WHERE [country] = 'Colombia';
GO

-- USA full data
SELECT *
  FROM [dbo].[covid19_data]
 WHERE [country] = 'USA'
 ORDER BY [datestamp] DESC;
GO
