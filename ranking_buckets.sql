#Calculate top ranking buckets

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
END AS Ranked
