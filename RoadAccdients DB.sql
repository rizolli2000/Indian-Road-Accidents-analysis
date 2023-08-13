
SELECT *
FROM RoadAccidentsData
WHERE State = 'Andhra Pradesh';
Query to Get Total Number of Accidents for Each Year:
sql

SELECT State, [2018] AS Accidents2018, [2019] AS Accidents2019, [2020] AS Accidents2020
FROM (
    SELECT State, [2018], [2019], [2020]
    FROM RoadAccidentsData
) AS SourceTable
PIVOT (
    SUM([2018]) FOR Year IN ([2018], [2019], [2020])
) AS PivotTable;
------- to Calculate Average Accidents Per Lakh Population for Each Year:

SELECT State,
       AVG([2018]) AS AvgAccidents2018,
       AVG([2019]) AS AvgAccidents2019,
       AVG([2020]) AS AvgAccidents2020
FROM (
    SELECT State, [2018], [2019], [2020]
    FROM RoadAccidentsData
) AS SourceTable
PIVOT (
    AVG([2018]) FOR Year IN ([2018], [2019], [2020])
) AS PivotTable
GROUP BY State;
--------to Find States with the Highest Accident Rates in 2020:

SELECT TOP 5 State, [2020] AS Accidents2020
FROM RoadAccidentsData
ORDER BY [2020] DESC;
Query to Calculate Total Persons Killed in Each Year:
sql
Copy code
SELECT State,
       [2017] AS Killed2017,
       [2018] AS Killed2018,
       [2019] AS Killed2019,
       [2020] AS Killed2020
FROM RoadAccidentsData;


--------Calculate the Change in Accidents from 2018 to 2020 for Each State:

SELECT State, ([2020] - [2018]) AS ChangeInAccidents
FROM RoadAccidentsData;
Query to Calculate the Average Persons Killed Per Year for Each State:
sql
Copy code
SELECT State, AVG([2017]) AS AvgKilled2017, AVG([2018]) AS AvgKilled2018, AVG([2019]) AS AvgKilled2019, AVG([2020]) AS AvgKilled2020
FROM RoadAccidentsData
GROUP BY State;
Query to Find States with the Highest Share in Deaths in 2020:
sql
Copy code
SELECT TOP 5 State, [2020] AS ShareInDeath2020
FROM RoadAccidentsData
----------- to Calculate the Average Injury Per Lakh Population for Each Year:

SELECT State,
       AVG([2017]) AS AvgInjury2017,
       AVG([2018]) AS AvgInjury2018,
       AVG([2019]) AS AvgInjury2019,
       AVG([2020]) AS AvgInjury2020
FROM RoadAccidentsData
GROUP BY State;
Query to Calculate the Average Injury Per 10,000 Km of Roads for Each Year:


SELECT State,
       AVG([2017]) AS AvgInjuryPerKm2017,
       AVG([2018]) AS AvgInjuryPerKm2018,
       AVG([2019]) AS AvgInjuryPerKm2019,
       AVG([2020]) AS AvgInjuryPerKm2020
FROM RoadAccidentsData
GROUP BY State;
------------- Calculate the Total Accidents Per 10,000 Vehicles for Each Year:

SELECT State,
       [2017] AS AccidentsPer10kVehicles2017,
       [2018] AS AccidentsPer10kVehicles2018,
       [2019] AS AccidentsPer10kVehicles2019,
       [2020] AS AccidentsPer10kVehicles2020
FROM RoadAccidentsData;
Query to Calculate the Total Accidents Per 10,000 Km of Roads for Each Year:

SELECT State,
       [2017] AS AccidentsPer10kKmRoads2017,
       [2018] AS AccidentsPer10kKmRoads2018,
       [2019] AS AccidentsPer10kKmRoads2019,
       [2020] AS AccidentsPer10kKmRoads2020
FROM RoadAccidentsData;