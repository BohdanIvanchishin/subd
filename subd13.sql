SHOW INDEX FROM реєстрація;

SHOW INDEX FROM лікар;

SHOW INDEX FROM відділення;

CREATE INDEX nameINDX2 ON відділення (Код_відділення, Назва);
SHOW INDEX FROM відділення;

CREATE INDEX docINDX2 ON реєстрація (Номер_реєстрації, Код_лікаря);
SHOW INDEX FROM реєстрація;

EXPLAIN
SELECT Назва, COUNT(реєстрація.Код_пацієнта) AS 'Кількість пацієнтів' 
FROM відділення INNER JOIN лікар 
ON лікар.Код_відділення = відділення.Код_відділення 
INNER JOIN реєстрація 
ON реєстрація.Код_лікаря = лікар.Код_лікаря 
GROUP BY Назва;

EXPLAIN
SELECT STRAIGHT_JOIN Назва, COUNT(реєстрація.Код_пацієнта) AS 'Кількість пацієнтів' 
FROM відділення INNER JOIN лікар 
ON лікар.Код_відділення = відділення.Код_відділення 
INNER JOIN реєстрація 
ON реєстрація.Код_лікаря = лікар.Код_лікаря
 GROUP BY Назва
