## Victims Count by Sex using CASE function ##
Select
	Count(vict_sex)	as Vict_count,
	Sum(CASE When vict_sex = "F" THEN 1 ELSE 0 END) as Female_count,
	Sum(CASE When vict_sex = "M" THEN 1 ELSE 0 END) as Male_Count,
    	Sum(CASE When vict_sex = "X" THEN 1 ELSE 0 END) as Unknown_sex
From 
	crimedata
limit 20;

## Crime count by area ##
Select
	area_name,
    count(*) as crime_count
From
	crimedata
GROUP BY
	1
Order by
	2 desc;

## Victims avg per area ##
Select
	area_name,
	Round(avg(vict_age)) as average_age
from
	crimedata
group by
	1;

## Top 10 places where most of the crimes occured ##
Select
	DISTINCT premis_desc,
    count(premis_desc) as premise_count
from
	crimedata
group by
	1
order by
	2 desc
Limit 10;

## Count of Hand Guns and Strong-Arms attacks crimes ##
select
	sum(CASE WHEN weapon_desc like "%hand gun%" THEN 1 ELSE 0 END) as Hand_Gun,
    sum(CASE WHEN weapon_desc like "%strong-arm%" THEN 1 ELSE 0 END) as Physical_Attacks
from
	crimedata
