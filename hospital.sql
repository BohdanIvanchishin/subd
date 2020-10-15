CREATE SCHEMA IF NOT EXISTS `Лікарня` DEFAULT CHARACTER SET utf8 ;
USE `Лікарня` ;

CREATE TABLE IF NOT EXISTS `Лікарня`.`Пацієнт` (
  `Код_пацієнта` INT NOT NULL AUTO_INCREMENT,
  `Прізвище` VARCHAR(45) NOT NULL,
  `Ім'я` VARCHAR(45) NOT NULL,
  `По-батькові` VARCHAR(45) NOT NULL,
  `Вік` INT NOT NULL,
  `Стать` VARCHAR(45) NOT NULL,
  `Місто` VARCHAR(45) NOT NULL,
  `Вулиця` VARCHAR(45) NOT NULL,
  `Номер_будинку` INT NOT NULL,
  `Номер_телефона` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Код_пацієнта`)
)ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Лікарня`.`Спеціалізація` (
  `Код_спеціалізації` INT NOT NULL AUTO_INCREMENT,
  `Назва` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Код_спеціалізації`)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Лікарня`.`Категорія` (
  `Код_категорії` INT NOT NULL,
  `Назва` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Код_категорії`)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Лікарня`.`Лікарня` (
  `Номер_лікарні` INT NOT NULL,
  `Назва` VARCHAR(45) NOT NULL,
  `Місто` VARCHAR(45) NOT NULL,
  `Вулиця` VARCHAR(45) NOT NULL,
  `Номер_будинку` VARCHAR(45) NOT NULL,
  `Номер_телефону` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Номер_лікарні`)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Лікарня`.`Відділення` (
  `Код_відділення` INT NOT NULL AUTO_INCREMENT,
  `Назва` VARCHAR(45) NOT NULL,
  `Кількість` INT NOT NULL,
  PRIMARY KEY (`Код_відділення`)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Лікарня`.`Лікар` (
  `Код_лікаря` INT NOT NULL AUTO_INCREMENT,
  `Прізвище` VARCHAR(45) NOT NULL,
  `Ім'я` VARCHAR(45) NOT NULL,
  `По-батькові` VARCHAR(45) NOT NULL,
  `Код_спеціалізації` INT NOT NULL,
  `Код_категорії` INT NOT NULL,
  `Номер_лікарні` INT NOT NULL,
  `Код_відділення` INT NOT NULL,
  PRIMARY KEY (`Код_лікаря`),
  CONSTRAINT `Код_спеціалізації`
    FOREIGN KEY (`Код_спеціалізації`)
    REFERENCES `Лікарня`.`Спеціалізація` (`Код_спеціалізації`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Код_категорії`
    FOREIGN KEY (`Код_категорії`)
    REFERENCES `Лікарня`.`Категорія` (`Код_категорії`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Номер_лікарні`
    FOREIGN KEY (`Номер_лікарні`)
    REFERENCES `Лікарня`.`Лікарня` (`Номер_лікарні`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Код_відділення`
    FOREIGN KEY (`Код_відділення`)
    REFERENCES `Лікарня`.`Відділення` (`Код_відділення`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Лікарня`.`Реєстрація` (
  `Номер_реєстрації` INT NOT NULL,
  `Код_пацієнта` INT NOT NULL,
  `Дата_запису` DATE NOT NULL,
  `Дата_виписки` DATE NULL,
  `Код_лікаря` INT NOT NULL,
  `Діагноз` VARCHAR(45) NOT NULL,
  `Номер_палати` INT NOT NULL,
  PRIMARY KEY (`Номер_реєстрації`),
  CONSTRAINT `Код_пацієнта`
    FOREIGN KEY (`Код_пацієнта`)
    REFERENCES `Лікарня`.`Пацієнт` (`Код_пацієнта`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Код_лікаря`
    FOREIGN KEY (`Код_лікаря`)
    REFERENCES `Лікарня`.`Лікар` (`Код_лікаря`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;
