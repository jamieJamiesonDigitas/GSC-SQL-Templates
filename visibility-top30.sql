 #Calculate Visiblity using a top 30 index
 
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
