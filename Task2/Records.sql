CREATE DATABASE IF NOT EXISTS `school`;
USE `school`;

CREATE TABLE Records (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    RecordDate DATE NOT NULL,
    Dept VARCHAR(50) NOT NULL
);

INSERT INTO Records (Name, RecordDate, Dept) VALUES
('Venkatesh', '2026-02-10', 'CSE-DS'),
('Karthik', '2026-02-15', 'CSE-DS'),
('Simbha', '2026-02-01', 'Finance'),
('Arif', '2026-02-12', 'IT');
