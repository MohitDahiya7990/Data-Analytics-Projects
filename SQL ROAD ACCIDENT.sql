use [Road Accident Database]
select * from road_accident

--Current year casulties
Select Sum(number_of_casualties) As CY_Casualties
From road_accident
Where YEAR(accident_date) = '2022'

---Current year casulties as dry road surface conditions
Select Sum(number_of_casualties) As CY_Casualties
From road_accident
Where YEAR(accident_date) = '2022' AND road_surface_conditions = 'Dry'

--Curent year Accidnets
Select Count(distinct accident_index) AS CY_Accidents
From road_accident
Where YEAR(accident_date) = '2022'

--CY YEAR FATAL CASUALTIES
Select Sum(number_of_casualties) AS CY_Fatal_Casualties
From road_accident
Where YEAR(accident_date) = '2022' AND accident_severity = 'fatal'


--CY YEAR Serious CASUALTIES
Select Sum(number_of_casualties) AS CY_Fatal_Casualties
From road_accident
Where YEAR(accident_date) = '2022' AND accident_severity = 'Serious'

--CY YEAR Slight CASUALTIES
Select Sum(number_of_casualties) AS CY_Fatal_Casualties
From road_accident
Where YEAR(accident_date) = '2022' AND accident_severity = 'Slight'

--% of total casualties for slight
Select CAST(Sum(number_of_casualties) AS DECIMAL(10,2)) * 100/
(Select CAST(sum(number_of_casualties) AS Decimal(10,2)) FROM road_accident ) AS  PCT
From road_accident
Where accident_severity = 'Slight'

--% of total casualties for serious
Select CAST(Sum(number_of_casualties) AS DECIMAL(10,2)) * 100/
(Select CAST(sum(number_of_casualties) AS Decimal(10,2)) FROM road_accident ) AS  PCT
From road_accident
Where accident_severity = 'Serious'

--% of total casualties for fatal
Select CAST(Sum(number_of_casualties) AS DECIMAL(10,2)) * 100/
(Select CAST(sum(number_of_casualties) AS Decimal(10,2)) FROM road_accident ) AS  PCT
From road_accident
Where accident_severity = 'fatal'

--Current and Previous Year Montly Trend
Select Datename(Month, Accident_date) AS Month_Name, sum(number_of_casualties) As CY_Casalties
from road_accident
where YEar(accident_date) = '2022'
Group by DATENAME(MONTH, accident_date)

--casualties by road type
select road_type, sum(number_of_casualties) as CY_Casualties From road_accident
where Year(accident_date) = '2022'
group by road_type 

-- casualties by urban and rural
Select urban_or_rural_area, Cast(sum(number_of_casualties) AS decimal(10,2)) * 100/ 
(Select Cast(sum(number_of_casualties) AS decimal(10,2)) From road_accident where Year(accident_date) = '2022') as PCT
from road_accident 
where Year(accident_date) = '2022'
group by urban_or_rural_area

