SELECT pizza_name
FROM (SELECT pizza_name,
             -- Функция ROW_NUMBER() присваивает уникальный номер каждой строке внутри каждой группы одинаковых значений 'pizza_name'
             ROW_NUMBER() OVER (
                 -- PARTITION BY создает отдельное окно для каждого уникального 'pizza_name'
                 PARTITION BY pizza_name
                 ORDER BY pizza_name DESC
                 ) AS row
      FROM menu) AS subquery
WHERE row = 1 -- Фильтрация результатов так, чтобы только первая строка каждой группы была включена в конечный результат
ORDER BY pizza_name DESC;
