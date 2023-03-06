#Example of stacked SQL in one query

SELECT * From (
  WITH temporaryTable1 AS (
    SELECT * FROM "[DATASET NAME]"
  ),
  temporaryTable2 AS (
    SELECT date, page, device, query, country, clicks, impressions, position,
      CASE 
        WHEN regexp_contains(query, r'[BRAND NAME]') THEN 'Brand'
        ELSE 'Non-brand'
      END AS queryType,
      CASE
        when round(position,0) < 4 Then 1
        else 0
      END AS Top3,
      CASE
        when round(position,0) < 11 and round(position,0) > 4 Then 1
        else 0
      END AS Top4_10,
      CASE
        when round(position,0) < 11 Then 1
        else 0
      END AS Top10,
      CASE
        when round(position,0) < 21 Then 1
        else 0
      END AS Top20,
      CASE
        when round(position,0) < 31 Then 1
        else 0
      END AS Top30,
      CASE
        when round(position,0) < 51 Then 1
        else 0
      END AS Top50,
      CASE
        when round(position,0) < 100 Then 1
        else 0
      END AS Ranked,
      CASE
        when round(position,0) = 1 Then 30
        when round(position,0) = 2 Then 29
        when round(position,0) = 3 Then 28
        when round(position,0) = 4 Then 27
        when round(position,0) = 5 Then 26
        when round(position,0) = 6 Then 25
        when round(position,0) = 7 Then 24
        when round(position,0) = 8 Then 23
        when round(position,0) = 9 Then 22
        when round(position,0) = 10 Then 21
        when round(position,0) = 11 Then 20
        when round(position,0) = 12 Then 19
        when round(position,0) = 13 Then 18
        when round(position,0) = 14 Then 17
        when round(position,0) = 15 Then 16
        when round(position,0) = 16 Then 15
        when round(position,0) = 17 Then 14
        when round(position,0) = 18 Then 13
        when round(position,0) = 19 Then 12
        when round(position,0) = 20 Then 11
        when round(position,0) = 21 Then 10
        when round(position,0) = 22 Then 9
        when round(position,0) = 23 Then 8
        when round(position,0) = 24 Then 7
        when round(position,0) = 25 Then 6
        when round(position,0) = 26 Then 5
        when round(position,0) = 27 Then 4
        when round(position,0) = 28 Then 3
        when round(position,0) = 29 Then 2
        when round(position,0) = 30 Then 1
        else 0
      END AS visibilityTop30
    FROM temporaryTable1
  ),
  temporaryTable3 AS (
    SELECT 
      DATE_TRUNC(date, WEEK(Sunday)) AS week_date, 
      country, 
      page, 
      queryType, 
      SUM(clicks) AS clicks,
      SUM(impressions) AS impressions, 
      AVG(position) AS position,
      SUM(Top3) AS Top3,
      SUM(Top4_10) AS Top4_10,
      SUM(Top10) AS Top10,
      SUM(Top20) AS Top20,
      SUM(Top30) AS Top30,
      SUM(Top50) AS Top50,
      SUM(Ranked) AS Ranked,
      SUM(visibilityTop30) AS visibilityTop30,
      COUNT(query) AS numberOfQueries
    FROM temporaryTable2 
    GROUP BY week_date, country, page, queryType
  ) 
  SELECT * 
  FROM temporaryTable3

    #join with a custom mapping table
    LEFT JOIN [DATASET NAME]
    ON temporaryTable3.page = [[customMappingTable]e.page
  ) temporaryTable4
