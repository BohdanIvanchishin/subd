ALTER TABLE лікарня 
	DROP COLUMN Email;
    
ALTER TABLE лікар 
	ADD COLUMN Досвід INT NOT NULL;

ALTER TABLE лікар 
	MODIFY COLUMN Прізвище varchar(60) NOT NULL;

ALTER TABLE реєстрація
	DROP FOREIGN KEY Код_лікаря,
    DROP FOREIGN KEY Код_пацієнта;

ALTER TABLE реєстрація
	ADD CONSTRAINT Код_лікаря
	FOREIGN KEY (Код_лікаря) REFERENCES лікар(Код_лікаря)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;

ALTER TABLE реєстрація
	ADD CONSTRAINT Код_пацієнта
	FOREIGN KEY (Код_пацієнта) REFERENCES пацієнт(Код_пацієнта)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;

ALTER TABLE лікар
	DROP FOREIGN KEY Код_відділення,
    DROP FOREIGN KEY Код_категорії,
    DROP FOREIGN KEY Код_спеціалізації,
	DROP FOREIGN KEY Номер_лікарні;


ALTER TABLE лікар
	ADD CONSTRAINT Код_відділення
	FOREIGN KEY (Код_відділення) REFERENCES відділення(Код_відділення)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;
    
ALTER TABLE лікар
	ADD CONSTRAINT Код_категорії
	FOREIGN KEY (Код_категорії) REFERENCES категорія(Код_категорії)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;
    
ALTER TABLE лікар
	ADD CONSTRAINT Код_спеціалізації
	FOREIGN KEY (Код_спеціалізації) REFERENCES спеціалізація(Код_спеціалізації)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;
    
ALTER TABLE лікар
	ADD CONSTRAINT Номер_лікарні
	FOREIGN KEY (Номер_лікарні) REFERENCES лікарня(Номер_лікарні)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;
