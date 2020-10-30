INSERT INTO пацієнт VALUES
(5, 'Сизмов', 'Антон', 'Вікторович', 34, 'Чоловік', 'Золочів', 'Степана Бандери', 1, '+380977562123');

INSERT INTO пацієнт VALUES
(6, 'Мельник', 'Андрій', 'Петрович', 45, 'Чоловік', 'Золочів', 'Стуса', 8, '+380964567890'),
(7, 'Серкіс', 'Марія', 'Петрівна', 43, 'Жінка', 'Золочів', 'Вокзальна', 2, '+380964521678'),
(8, 'Петриняк', 'Василь', 'Миколайович', 66, 'Чоловік', 'Золочів', 'Тернопільська', 7, '+380962123870')

LOAD DATA INFILE 'C:/tmp/patient.csv' 
    INTO TABLE пацієнт FIELDS TERMINATED BY ',' 
    LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/tmp/doctor.csv' 
     INTO TABLE лікар FIELDS TERMINATED BY ',' 
     LINES TERMINATED BY '\n'

UPDATE пацієнт SET Номер_будинку = 4
	WHERE Прізвище='Іванчишин';

UPDATE лікар SET Досвід = Досвід + 2;

DELETE FROM реєстрація
WHERE Дата_запису < '2020-03-20'


