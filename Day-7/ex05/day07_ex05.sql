SELECT DISTINCT name FROM person AS p
JOIN person_visits AS pv ON p.id = pv.person_id
ORDER BY name;

