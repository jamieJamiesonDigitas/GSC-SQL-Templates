SELECT date, page, device, query, country, clicks, impressions, position,
  CASE 
    WHEN text_contains(query, r'[YOUR BRAND NAME') THEN 'Brand'
    ELSE 'Non-brand'
  END AS queryType
FROM ["DATASET NAME"]
