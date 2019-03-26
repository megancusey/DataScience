/*select year, sum(VGTCount) as 'vgtCount' from VideoGameData
where MuncipalityCd = 1
and month = 12
group by year

select year, count(establishment) as 'establishmentCount'
from VideoGameData
where MuncipalityCd = 1
and month = 12
group by year*/
with a as(
select year, month, establishment, vgtcount, (fundsin-FundsOut)/VGTCount as 'x' from VideoGameData
where MuncipalityCd = 1
and VGTCount = 5
and year = 2014
)

select cast(AVG(x) as decimal(18,2)) from a
/*

select distinct vgtcount from VideoGameData
where MuncipalityCd = 1
--and year = 2017
*/

With a as (SELECT 
case
when month in(3,4,5)
then 'Spring'
when month in (6,7,8)
then 'Summer'
when month in (9,10,11)
then 'Fall'
when month in (12,1,2)
then 'Winter'
End as 'Season'
, year, 'Auburn' as 'Municipality', sum(fundsOut) as 'fundsOut',sum(fundsIn) as 'fundsIn'  FROM VideoGameData
WHERE MuncipalityCd = 1
group by month, year)


select season, year, Municipality,  sum(fundsOut)/sum(fundsIn) as 'FundsOutFundsInRatio' from a
group by Season, year, Municipality


select * from VideoGameData