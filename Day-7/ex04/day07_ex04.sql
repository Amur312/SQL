SELECT name, COUNT(p.name) AS count_of_visits FROM person AS p
JOIN person_visits AS pv ON p.id = pv.person_id
GROUP BY p.name
HAVING COUNT(p.name) > 3