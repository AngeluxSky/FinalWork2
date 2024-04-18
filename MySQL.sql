CREATE DATABASE IF NOT EXISTS HumanFriends;

-- Создание таблицы (домашние животные)
CREATE TABLE IF NOT EXISTS Pets (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Type VARCHAR(50),
    BirthDate DATE,
    Commands VARCHAR(255)
);

-- Создание таблицы (вьючные животные)
CREATE TABLE IF NOT EXISTS PackAnimals (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Type VARCHAR(50),
    BirthDate DATE,
    Commands VARCHAR(255)
);

-- Заполнение таблицы данными (домашние животные)
INSERT INTO Pets (`Name`, Type, BirthDate, `Commands`)
VALUES
    ('Rex', 'Dog', '2020-01-01', 'Sit, Stay, Fetch'),
    ('Vasya', 'Cat', '2019-05-15', 'Sit, Pounce'),
    ('Osia', 'Hamster', '2021-03-10', 'Roll, Hide'),
    ('Boozy', 'Dog', '2018-12-10', 'Sit, Paw, Bark'),
    ('Murka', 'Cat', '2020-02-20', 'Sit, Pounce, Scratch'),
    ('Asya', 'Hamster', '2021-08-01', 'Roll, Spin'),
    ('Ruby', 'Dog', '2019-11-11', 'Sit, Stay, Roll'),
    ('Oxelot', 'Cat', '2020-06-30', 'Meow, Scratch, Jump');

-- Заполнение таблицы данными (вьючные животные)
INSERT INTO PackAnimals (`Name`, Type, BirthDate, `Commands`)
VALUES
    ('Coco', 'Horse', '2015-07-21', 'Trot, Canter, Gallop'),
    ('Bertie', 'Camel', '2016-11-03', 'Walk, Carry Load'),
    ('Aria', 'Donkey', '2017-09-18', 'Walk, Carry Load, Bray'),
    ('Hannah', 'Horse', '2014-05-05', 'Trot, Canter'),
    ('Fido', 'Camel', '2018-12-12', 'Walk, Sit'),
    ('Pearl', 'Donkey', '2019-01-23', 'Walk, Bray, Kick'),
    ('Penny', 'Horse', '2016-02-29', 'Trot, Jump, Gallop'),
    ('Douglas', 'Camel', '2015-08-14', 'Walk, Run');

-- Удаление записи о верблюдах из таблицы (вьючные животные)
DELETE FROM PackAnimals WHERE Type = 'Camel';

-- Объединение таблиц лошадей и ослов
CREATE TABLE IF NOT EXISTS HorsesAndDonkeys (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Type VARCHAR(50),
    BirthDate DATE,
    Commands VARCHAR(255)
);

INSERT INTO HorsesAndDonkeys (`Name`, Type, BirthDate, `Commands`)
SELECT Name, Type, BirthDate, Commands FROM PackAnimals
WHERE Type IN ('Horse', 'Donkey');

-- Удаление записей о лошадях и ослах из таблицы (вьючные животные)
DELETE FROM PackAnimals WHERE Type IN ('Horse', 'Donkey');

-- Создание новой таблицы с животными (в возрасте от 1 до 3 лет)
CREATE TABLE IF NOT EXISTS YoungAnimals (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Type VARCHAR(50),
    BirthDate DATE,
    AgeMonths INT
);

-- Вставка данных о животных в возрасте от 1 до 3 лет и вычисление их возраста в месяцах
INSERT INTO YoungAnimals (`Name`, Type, BirthDate, `AgeMonths`)
SELECT Name, Type, BirthDate, TIMESTAMPDIFF(MONTH, BirthDate, CURDATE()) AS AgeMonths
FROM Pets
WHERE TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) BETWEEN 1 AND 3;

-- Создание объединенной таблицы
CREATE TABLE IF NOT EXISTS AllAnimals (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Type VARCHAR(50),
    BirthDate DATE,
    Commands VARCHAR(255),
    AgeMonths INT,
    OriginalTable VARCHAR(50)
);

-- Использование созданной таблицы
INSERT INTO AllAnimals (Name, Type, BirthDate, Commands, OriginalTable)
SELECT Name, Type, BirthDate, Commands, 'Pets' AS OriginalTable FROM Pets;
