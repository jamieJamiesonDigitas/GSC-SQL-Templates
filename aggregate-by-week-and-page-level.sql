#reduce data to week and page level

temporaryTable AS (
    SELECT 
      DATE_TRUNC(date, WEEK(Sunday)) AS week_date, 
      country, 
      page, 
      queryType, 
      SUM(clicks) AS clicks,
      SUM(impressions) AS impressions, 
      AVG(position) AS position,
      SUM(Top10) AS Top10,
      SUM(Top3) AS Top3,
      SUM(Top4_10) AS Top4_10,
      SUM(visibilityTop20) AS visibilityTop20,
      SUM(visibilityTop30) AS visibilityTop30,
      COUNT(query) AS numberOfQueries
    FROM temporaryTable2 
    GROUP BY week_date, country, page, queryType
  ) 
