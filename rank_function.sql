/*Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. 
Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. 
If more than one wand has same power, sort the result in order of descending age.*/

SELECT id, 
age,
coins_needed, 
power FROM (
SELECT 
w.id, 
wp.age,
w.coins_needed, 
w.power,
RANK() over (partition by wp.age,w.power order by w.coins_needed asc) as rk
FROM wands w
INNER JOIN wands_property wp
ON w.code= wp.code
WHERE wp.is_evil= 0
) T WHERE T.RK=1
ORDER BY power DESC,age DESC
