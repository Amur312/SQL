WITH gender_visits AS (
    SELECT
        p.name AS pizzeria_name,
        pe.gender
    FROM
        person_visits pv
            JOIN person pe ON pv.person_id = pe.id
            JOIN pizzeria p ON pv.pizzeria_id = p.id
),
     women_visits AS (
         SELECT pizzeria_name
         FROM gender_visits
         WHERE gender = 'female'
     ),
     men_visits AS (
         SELECT pizzeria_name
         FROM gender_visits
         WHERE gender = 'male'
     ),
     exclusive_women_visits AS (
         SELECT pizzeria_name
         FROM women_visits
         EXCEPT ALL
         SELECT pizzeria_name
         FROM men_visits
     ),
     exclusive_men_visits AS (
         SELECT pizzeria_name
         FROM men_visits
         EXCEPT ALL
         SELECT pizzeria_name
         FROM women_visits
     )
SELECT pizzeria_name
FROM exclusive_women_visits
UNION ALL
SELECT pizzeria_name
FROM exclusive_men_visits
ORDER BY pizzeria_name;
