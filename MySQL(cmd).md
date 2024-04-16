CREATE DATABASE IF NOT EXISTS HumanFriends;

-- Создание таблицы (домашние животные)
CREATE TABLE IF NOT EXISTS Pets (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Type VARCHAR(50),
    BirthDate DATE,
    Commands VARCHAR(255)
);