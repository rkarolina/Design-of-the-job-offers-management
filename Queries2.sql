USE JobOffersManagementSystem
GO

INSERT INTO [User](FirstName, LastName, Email, Position, RoleId, Phone, UserName)
VALUES
('Dominika', 'Nowacka', 'domi@domi.com', 'Tester', 3, '566-666-000', 'domno'),
('Mateusz', 'Mateuszewicz', 'mmateuszewicz@onet.com', 'Tster', 3, NULL, 'mmateusz'),
('Marcin', 'Kowalski', 'mkowalski@pl.com', 'Team Lead', 3, NULL, 'mkowalsk'),
('Krzysztof', 'Zbielski', 'kzbielski@vp.pl', 'Recruitment Specialist', 4, NULL, 'kzbiel'),
('Zygmunt', 'Szarafiñski', 'zszarafinski@vp.pl', 'Administrator', 1, '555555555', 'zygmunt');

INSERT INTO [User](FirstName, LastName, Email, Position, RoleId, Phone, UserName)
VALUES
('Agnieszka', 'Mioduszewska', 'amiod@pl.com', 'Tester', 3, '500600700', 'amiod'),
('Barbara', 'Florek', 'basiaflorek@kr.com', 'Teter', 3, NULL, 'bflor');

SELECT * FROM [User];

-- shows first three records of the table 
SELECT TOP 3 * FROM [User];

-- shows first three records of the table in ascending order (FirstName)
SELECT TOP 3 * FROM [User] ORDER BY FirstName ASC;
-- shows first three records of the table with more than 4 letters of FirstName
SELECT TOP 3 * FROM [User]
WHERE LEN(FirstName) > 4
ORDER BY FirstName ASC;

SELECT TOP 3 * FROM [User]
WHERE LEN(FirstName) > 4
ORDER BY FirstName DESC;

-- I want to display length (numer of characters of the FirstName) in ascending order
SELECT TOP 10 FirstName, LEN(FirstName) AS FirstNameLength 
FROM [User] 
ORDER BY LEN(FirstName) ASC, FirstName ASC;

SELECT TOP 10 FirstName, LEN(FirstName) AS FirstNameLength 
FROM [User] 
ORDER BY LEN(FirstName) DESC, FirstName DESC;

SELECT TOP 3 FirstName, LEN(FirstName) AS FirstNameLength 
FROM [User] 
ORDER BY LEN(FirstName), FirstName DESC;

-- to avoid duplicates I will use SELECT DISTINCT
SELECT DISTINCT TOP 3 FirstName, LEN(FirstName) AS FirstNameLength 
FROM [User] 
ORDER BY LEN(FirstName), FirstName DESC;

--Query the list of users LastName starting with vowels (i.e., a, e, i, o, or u). The result cannot contain duplicates.
SELECT DISTINCT * from [User] WHERE LEFT(LastName,1) in ('a', 'e', 'i', 'o', 'u');

-- the same only for k, m letters
SELECT DISTINCT * from [User] WHERE LEFT(LastName,1) in ('m', 'k');

-- Extract 6 characters from the text in the "LastName" column (starting from left):
SELECT LEFT(LastName, 6) AS ExtractString
FROM [User];

-- Extract 3 characters from the text in the "LastName" column (starting from right):
SELECT RIGHT(LastName, 3) AS ExtractString
FROM [User];

-- Query the list of users which have vowels (i.e., a, e, i, o, and u) 
-- as both their first and last characters. The result cannot contain duplicates
SELECT DISTINCT * from [User] WHERE LEFT(FirstName,1) in ('a', 'e', 'i', 'o', 'u') AND RIGHT(FirstName,1) IN ('a', 'e', 'i', 'o', 'u');

-- Query the list of users that do not start with vowels
-- without duplicates
SELECT DISTINCT * from [User]
WHERE LEFT(FirstName,1) NOT IN ('a', 'e', 'i', 'o', 'u');

-- Query the list of users that either do not start with vowels or do not end with vowels
SELECT DISTINCT * 
from [User]
WHERE LEFT(FirstName,1) NOT IN('a', 'e', 'i', 'o', 'u') OR RIGHT(FirstName,1) NOT IN ('a', 'e', 'i', 'o', 'u');

-- Query the list of users that both do not start AND end with vowels
SELECT DISTINCT * 
from [User]
WHERE LEFT(FirstName,1) NOT IN('a', 'e', 'i', 'o', 'u') AND RIGHT(FirstName,1) NOT IN ('a', 'e', 'i', 'o', 'u');


SELECT * FROM [User];
SELECT * FROM JobApplication;
SELECT * FROM JobDetails;

SELECT SUM(JobDetails.MinSalary) AS 'Sum of Min Salary for HR Specialists in the opening positions'
FROM JobDetails
WHERE JobTitle = 'HR Specialist';

SELECT COUNT(1) AS 'How many job req are open?'
FROM JobDetails 
WHERE JobTitle = 'HR Specialist';

SELECT AVG(JobDetails.MinSalary)
FROM JobDetails
WHERE JobTitle = 'HR Specialist';

SELECT ROUND(AVG(JobDetails.MinSalary),2)
FROM JobDetails
WHERE JobTitle = 'HR Specialist';