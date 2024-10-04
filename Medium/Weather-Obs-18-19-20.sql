-- 18. Manhattan Distance
select round(abs(max(lat_n) - min(lat_n)) + abs(max(long_w) - min(long_w)),4)
from station;

-- 19. Euclidean Distance
select round(sqrt(power(max(lat_n) - min(lat_n),2) + power(max(long_w) - min(long_w),2)),4)
from station;

-- 20. Median
-- Approach 1
SET @half_count = (SELECT floor(COUNT(*) / 2) FROM station);
-- select @half_count;

SELECT ROUND(lat_n, 4)
FROM station
ORDER BY lat_n
LIMIT 1 offset 249;


-- Approach 2
with ranked_lat as ( SELECT 
    ROW_NUMBER() OVER (ORDER BY lat_n) AS row_num,  -- Adding row number with ORDER BY
    lat_n
FROM station
order by row_num desc )
    
select round(lat_n,4) from ranked_lat
where row_num = (select ceil(count(row_num)/2) from ranked_lat);
