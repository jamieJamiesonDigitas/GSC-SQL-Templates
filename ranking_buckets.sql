#Calculate top ranking buckets

CASE
  when round(position,0) < 11 Then 1
  else 0
END AS Top10,
CASE
  when round(position,0) < 4 Then 1
  else 0
END AS Top3,
CASE
  when round(position,0) < 11 and round(position,0) > 4 Then 1
  else 0
END AS Top4_10
