DELIMITER //
CREATE FUNCTION encodeNumber (number VARCHAR(45))
RETURNS TINYBLOB READS SQL DATA
BEGIN
	DECLARE result TINYBLOB;
	SET result = AES_ENCRYPT(number, 'qqwweerr');
	RETURN result;
END //

CREATE FUNCTION decodeNumber (number TINYBLOB)
RETURNS VARCHAR(45) READS SQL DATA
BEGIN
	DECLARE result VARCHAR(45);
	SET result = AES_DECRYPT(number, 'qqwweerr');
	RETURN result;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE getPatientCount (IN department VARCHAR(45), 
IN date_in DATE, IN date_out DATE)
BEGIN
DECLARE error VARCHAR(45);
	SET error = 'Неправильно введені дані';
IF (date_in <= date_out) THEN
	BEGIN
	CREATE TABLE
	IF NOT EXISTS хворі(`Відділення` VARCHAR(45), `Кількість_хворих` INT);
	INSERT INTO хворі
	SELECT Назва, COUNT(реєстрація.Код_пацієнта)
	FROM (відділення INNER JOIN лікар 
ON лікар.Код_відділення = відділення.Код_відділення
	AND відділення.Назва = department
	INNER JOIN реєстрація ON реєстрація.Код_лікаря = лікар.Код_лікаря)
	WHERE реєстрація.Дата_запису BETWEEN date_in AND date_out
	GROUP BY Назва;
END;
ELSE SELECT error;
END IF ;
END //
DELIMITER ;

SELECT Прізвище,`Ім 'я`,`По-батькові`, Вік, encodeNumber(Номер_телефона) AS 'Зашифрована інформація'  
FROM лікарня.пацієнт;

CALL getPatientCount('Терапія', '2020-09-14', '2020-10-14');
SELECT * FROM хворі;

CALL getPatientCount('Терапія', '2020-09-14', '2020-09-01');
SELECT * FROM хворі

