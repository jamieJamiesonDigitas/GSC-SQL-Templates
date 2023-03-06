#create column based on query type (branded vs non-brand)

SELECT date, page, device, query, country, clicks, impressions, position,
  CASE 
    WHEN regex_contains(query, r'[YOUR BRAND NAME') THEN 'Brand'
    ELSE 'Non-brand'
  END AS queryType
FROM ["DATASET NAME"]
