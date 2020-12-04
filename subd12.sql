DELIMITER //
CREATE TRIGGER patient_delete BEFORE
DELETE ON реєстрація FOR EACH ROW
BEGIN
INSERT INTO реєстрація_архів (Номер_реєстрації, Код_пацієнта, Дата_запису, Дата_виписки, Код_лікаря, Діагноз, Номер_палати) 
VALUES (OLD.Номер_реєстрації, OLD.Код_пацієнта, OLD.Дата_запису, OLD.Дата_виписки, OLD.Код_лікаря, OLD.Діагноз, OLD.Номер_палати);
END //
DELIMITER ;

DELETE FROM реєстрація WHERE Номер_реєстрації = 13;
SELECT * FROM реєстрація_архів;

CREATE TRIGGER patient_update BEFORE
UPDATE ON пацієнт FOR EACH ROW
INSERT INTO пацієнт_old
SET Дія = 'Змінено', 
	Код_пацієнта = OLD.Код_пацієнта, 
	Прізвище = OLD.Прізвище, 
	`Ім 'я` = OLD.`Ім' я`, 
	`По - батькові` = OLD.`По - батькові`, 
	Вік = OLD.Вік, 
	Стать = OLD.Стать, 
	Місто = OLD.Місто, 
	Вулиця = OLD.Вулиця, 
	Номер_будинку = OLD.Номер_будинку, 
	Номер_телефона = OLD.Номер_телефона, 
	Дата_зміни = NOW();

UPDATE пацієнт SET Вулиця = 'Стуса' WHERE Код_пацієнта = 10;
SELECT * FROM пацієнт_old

DELIMITER //
CREATE TRIGGER пацієнт_кодування BEFORE
INSERT ON пацієнт FOR EACH ROW
BEGIN
IF NEW.Номер_телефона IS NOT NULL THEN
SET NEW.Номер_телефона = TO_BASE64(AES_ENCRYPT(NEW.Номер_телефона, 'keys'));
END IF;
END //
DELIMITER ;

INSERT INTO пацієнт VALUE (14, 'Карпин', 'Ярослав', 'Степанович', 46, 'Чоловік', 'Золочів', 'Нова', 21, '+380964145387')

