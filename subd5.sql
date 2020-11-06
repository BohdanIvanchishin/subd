CREATE TABLE реєстрація_1 LIKE реєстрація;
INSERT INTO реєстрація_1
SELECT * FROM реєстрація
WHERE Дата_запису > '2020-04-09'

CREATE TABLE реєстрація_2 LIKE реєстрація;
INSERT INTO реєстрація_2
SELECT * FROM реєстрація
WHERE Дата_запису < '2020-04-13'

SELECT * FROM реєстрація_1
UNION
SELECT * FROM реєстрація_2

SELECT * FROM реєстрація_1 WHERE
Номер_реєстрації IN (SELECT Номер_реєстрації FROM реєстрація_2)

SELECT * FROM реєстрація_2 WHERE
Номер_реєстрації NOT IN (SELECT Номер_реєстрації FROM реєстрація_1)

SELECT * FROM реєстрація_1, реєстрація_2