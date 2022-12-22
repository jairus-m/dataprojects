-- Union all 12 tables
CREATE TABLE cyclistic AS
SELECT *
FROM(
	SELECT * FROM "202004_divvy_tripdata" apr
	UNION
	SELECT * FROM "202005_divvy_tripdata" may
	UNION
	SELECT * FROM "202006_divvy_tripdata" jun
	UNION
	SELECT * FROM "202007_divvy_tripdata" jul
	UNION 
	SELECT * FROM "202008_divvy_tripdata" aug
	UNION 
	SELECT * FROM "202009_divvy_tripdata" sep
	UNION 
	SELECT * FROM "202010_divvy_tripdata" oct
	UNION
	SELECT * FROM "202011_divvy_tripdata" nov
	UNION
	SELECT * FROM "202012_divvy_tripdata" dce
	UNION
	SELECT * FROM "202101_divvy_tripdata" jan
	UNION 
	SELECT * FROM "202102_divvy_tripdata" feb
	UNION
	SELECT * FROM "202103_divvy_tripdata" mar
); 


--  Which months have the most total avg ride length?
SELECT 
	month,
	ROUND(AVG(minutes),1)
FROM cyclistic 
GROUP BY
	(CASE month 
  WHEN 'Janruary' THEN 1
  WHEN 'February' THEN 2
  WHEN 'March' THEN 3
  WHEN 'April' THEN 4
  WHEN 'May' THEN 5
  WHEN 'June' THEN 6
  WHEN 'July' THEN 7
  WHEN 'August' THEN 8
  WHEN 'September' THEN 9
  WHEN 'October' THEN 10
  WHEN 'November' THEN 11
  WHEN 'December' THEN 12
    END);
    


   -- Monthly ride avg for members:
SELECT 
	month,
	member_casual, 
	ROUND(AVG(minutes),1)
FROM cyclistic 
WHERE member_casual = 'member'
GROUP BY
	(CASE month 
  WHEN 'Janruary' THEN 1
  WHEN 'February' THEN 2
  WHEN 'March' THEN 3
  WHEN 'April' THEN 4
  WHEN 'May' THEN 5
  WHEN 'June' THEN 6
  WHEN 'July' THEN 7
  WHEN 'August' THEN 8
  WHEN 'September' THEN 9
  WHEN 'October' THEN 10
  WHEN 'November' THEN 11
  WHEN 'December' THEN 12
    END),
   member_casual;
   
  -- Monthly ride avg for casual rider:
SELECT 
	month,
	member_casual, 
	ROUND(AVG(minutes),1)
FROM cyclistic 
WHERE member_casual = 'member'
GROUP BY
	(CASE month 
  WHEN 'Janruary' THEN 1
  WHEN 'February' THEN 2
  WHEN 'March' THEN 3
  WHEN 'April' THEN 4
  WHEN 'May' THEN 5
  WHEN 'June' THEN 6
  WHEN 'July' THEN 7
  WHEN 'August' THEN 8
  WHEN 'September' THEN 9
  WHEN 'October' THEN 10
  WHEN 'November' THEN 11
  WHEN 'December' THEN 12
    END),
   member_casual;
   









  -- How many total riders per month?
SELECT 
	month,
	COUNT(DISTINCT ride_id)
FROM cyclistic 
GROUP BY
	(CASE month 
  WHEN 'Janruary' THEN 1
  WHEN 'February' THEN 2
  WHEN 'March' THEN 3
  WHEN 'April' THEN 4
  WHEN 'May' THEN 5
  WHEN 'June' THEN 6
  WHEN 'July' THEN 7
  WHEN 'August' THEN 8
  WHEN 'September' THEN 9
  WHEN 'October' THEN 10
  WHEN 'November' THEN 11
  WHEN 'December' THEN 12
    END);
    
   -- How many member riders per month?
SELECT 
	month,
	COUNT(DISTINCT ride_id)
FROM cyclistic 
WHERE member_casual = 'member'
GROUP BY
	(CASE month 
  WHEN 'Janruary' THEN 1
  WHEN 'February' THEN 2
  WHEN 'March' THEN 3
  WHEN 'April' THEN 4
  WHEN 'May' THEN 5
  WHEN 'June' THEN 6
  WHEN 'July' THEN 7
  WHEN 'August' THEN 8
  WHEN 'September' THEN 9
  WHEN 'October' THEN 10
  WHEN 'November' THEN 11
  WHEN 'December' THEN 12
    END),
   Member_casual;














   
  -- How many casual riders per month?
SELECT 
	month,
	COUNT(DISTINCT ride_id)
FROM cyclistic 
WHERE member_casual = 'casual'
GROUP BY
	(CASE month 
  WHEN 'Janruary' THEN 1
  WHEN 'February' THEN 2
  WHEN 'March' THEN 3
  WHEN 'April' THEN 4
  WHEN 'May' THEN 5
  WHEN 'June' THEN 6
  WHEN 'July' THEN 7
  WHEN 'August' THEN 8
  WHEN 'September' THEN 9
  WHEN 'October' THEN 10
  WHEN 'November' THEN 11
  WHEN 'December' THEN 12
    END),
   member_casual;
   
  -- Daily average ride duration:
 SELECT 
	day,
	member_casual,
	ROUND(AVG(minutes),1) as avg_min
FROM cyclistic 
GROUP BY
	(CASE day 
  WHEN 'Monday' THEN 1
  WHEN 'Tuesday' THEN 2
  WHEN 'Wednesday' THEN 3
  WHEN 'Thursday' THEN 4
  WHEN 'Friday' THEN 5
  WHEN 'Saturday' THEN 6
  WHEN 'Sunday' THEN 7
    END);
   
   -- Daily average ride duration for members:
 SELECT 
	day,
	member_casual,
	ROUND(AVG(minutes),1) as avg_min
FROM cyclistic 
WHERE member_casual = 'members'
GROUP BY
	(CASE day 
  WHEN 'Monday' THEN 1
  WHEN 'Tuesday' THEN 2
  WHEN 'Wednesday' THEN 3
  WHEN 'Thursday' THEN 4
  WHEN 'Friday' THEN 5
  WHEN 'Saturday' THEN 6
  WHEN 'Sunday' THEN 7
    END),
   member_casual;
  
  -- Daily average ride duration for casual riders:
 SELECT 
	day,
	member_casual,
	ROUND(AVG(minutes),1) as avg_min
FROM cyclistic 
WHERE member_casual = 'casual'
GROUP BY
	(CASE day 
  WHEN 'Monday' THEN 1
  WHEN 'Tuesday' THEN 2
  WHEN 'Wednesday' THEN 3
  WHEN 'Thursday' THEN 4
  WHEN 'Friday' THEN 5
  WHEN 'Saturday' THEN 6
  WHEN 'Sunday' THEN 7
    END),
   member_casual;
   
  -- Average daily rider count per day (per month):
  CREATE temp table md_part as 
SELECT 
	day,
	month,
	COUNT(DISTINCT ride_id) as avg_day
FROM cyclistic 
GROUP BY month, day
ORDER BY
		(CASE day 
	  WHEN 'Monday' THEN 1
	  WHEN 'Tuesday' THEN 2
	  WHEN 'Wednesday' THEN 3
	  WHEN 'Thursday' THEN 4
	  WHEN 'Friday' THEN 5
	  WHEN 'Saturday' THEN 6
	  WHEN 'Sunday' THEN 7
	    END);
	   
SELECT 
	day,
	ROUND(AVG(avg_day),1)
FROM md_part
GROUP BY 
		(CASE day 
	  WHEN 'Monday' THEN 1
	  WHEN 'Tuesday' THEN 2
	  WHEN 'Wednesday' THEN 3
	  WHEN 'Thursday' THEN 4
	  WHEN 'Friday' THEN 5
	  WHEN 'Saturday' THEN 6
	  WHEN 'Sunday' THEN 7
	    END);


	   
-- Average casual rider per day (per month):
SELECT
     day,
     ROUND(AVG(avg_day),1)
FROM(
   SELECT
	member_casual,
	month,
	day,
	COUNT(DISTINCT ride_id) as avg_day
    FROM cyclistic c 
    GROUP BY
		member_casual,
		month,
		day)
WHERE member_casual = 'casual'
GROUP BY 
	(CASE day 
		  WHEN 'Monday' THEN 1
		  WHEN 'Tuesday' THEN 2
		  WHEN 'Wednesday' THEN 3
		  WHEN 'Thursday' THEN 4
		  WHEN 'Friday' THEN 5
		  WHEN 'Saturday' THEN 6
		  WHEN 'Sunday' THEN 7
		    END);
		   
-- Average member rider per day (per month):
SELECT
  day,
  ROUND(AVG(avg_day),1)
FROM(
   SELECT
	member_casual,
	month,
	day,
	COUNT(DISTINCT ride_id) as avg_day
    FROM cyclistic c 
    GROUP BY
	member_casual,
	Month,
	day)
WHERE member_casual = 'member'
GROUP BY 
	(CASE day 
		  WHEN 'Monday' THEN 1
		  WHEN 'Tuesday' THEN 2
		  WHEN 'Wednesday' THEN 3
		  WHEN 'Thursday' THEN 4
		  WHEN 'Friday' THEN 5
		  WHEN 'Saturday' THEN 6
		  WHEN 'Sunday' THEN 7
		    END);










		   
-- Average ride length of casual riders vs members:
SELECT
	member_casual,
	ROUND(AVG(minutes), 1)
FROM cyclistic c 
GROUP BY member_casual;

-- Total number of casual vs member riders:
SELECT 	
	member_casual,
	COUNT(DISTINCT ride_id) 
	--COUNT(*) as num_riders
FROM cyclistic c 
GROUP BY member_casual;
	
