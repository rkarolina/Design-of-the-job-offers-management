Database was created in MS SQL Server Management Studio, below you can find some examples:

_I want to create a database_
```SQL
   CREATE DATABASE JobOffersManagementSystem;
```

_I want to create table with foreign keys_
```SQL
CREATE TABLE JobDetails(
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	CompanyId INT NOT NULL FOREIGN KEY REFERENCES Company(Id),
	JobTitle NVARCHAR(50) NOT NULL, --position
	MinSalary MONEY,
	MaxSalary MONEY,
	JobSpecification NVARCHAR(500) NOT NULL, --description - responsibilities
	Requirements NVARCHAR(500) NOT NULL,
	SeniorityLevel INT NOT NULL FOREIGN KEY REFERENCES Seniority(Id),
	FTE INT NOT NULL FOREIGN KEY REFERENCES FTE(Id),
	EmploymentType INT NOT NULL FOREIGN KEY REFERENCES EmploymentType(Id),
	ModeType INT NOT NULL FOREIGN KEY REFERENCES WorkMode(Id),
	OpeningsNumber SMALLINT NOT NULL, --how many people you can hire
	IssueDate DATE NOT NULL,
	ExpiryDate DATE NOT NULL,
	StartDate DATE NOT NULL,
	Benefits NVARCHAR(200) NULL,
	RecruitmentStages SMALLINT NOT NULL --how many interviews candidates need to participate in
);
```

_I want to rename a table_
```SQL
USE JobOffersManagementSystem
GO
EXEC sp_rename 'CompanyAdress', 'CompanyAddress';
```

_I want to find particular record in the table with WHERE condition_
```SQL
SELECT * FROM Countries
WHERE
Country='Poland';
```
_I want to insert some data to the JobDetails Table_
```SQL
INSERT INTO JobDetails
(CompanyId, JobTitle, MinSalary, 
MaxSalary, JobSpecification, Requirements, 
SeniorityLevel, FTE, EmploymentType, ModeType, 
OpeningsNumber, IssueDate, ExpiryDate, StartDate, 
Benefits, RecruitmentStages)
VALUES
(7, 'Team Leader', 11000, 17000, 
'A team leader provides guidance and instruction to a working group about a project or portfolio of projects. 
They are in charge of delegating work, overseeing progress towards goals, and coaching team members as needed', 
'Communication ',1003,1,3004,2000,3,'2023-02-01', '2023-04-30', '2023-05-02', NULL, 1);
```
_I want to modify column in existing table_
```SQL
ALTER TABLE ApplicationStatus
ALTER COLUMN DetailedDescription NVARCHAR(500) NOT NULL;
```

_I want update a record in the table_
```SQL
UPDATE CompanyAddress
SET ProvinceId = 7 , ContryId = 137
WHERE Id=3;
```
_I want to display adresses of the existing companies in the database_
<br>
```SQL
SELECT 
Company.NIP, Company.BusinessName, Company.CompanyDescription, 
Company.FoundationDate, CompanyAddress.City, CompanyAddress.Street, 
CompanyAddress.Building, CompanyAddress.ZipCode
FROM Company
JOIN CompanyAddress ON Company.CompanyAddressId = CompanyAddress.Id
```

_I want to see all added job offers for position name starting from 'Te'_
<br>
```SQL
SELECT *
FROM JobDetails
WHERE JobTitle LIKE 'Te%';
```

_I want to count how many job offers are remote_
<br>
```SQL
SELECT COUNT(1) AS 'Remote jobs'
FROM JobDetails
JOIN WorkMode ON JobDetails.ModeType = WorkMode.Id
WHERE WorkMode.Name = 'Remote';
```

_I want to display all 'B2B' offers in the database only with job title, salary, requirements and start date_
```SQL
SELECT 
JobDetails.JobTitle, JobDetails.MinSalary, JobDetails.MaxSalary, 
JobDetails.Requirements, JobDetails.StartDate
FROM JobDetails
JOIN EmploymentType ON EmploymentType.Id = JobDetails.EmploymentType
WHERE EmploymentType.Name = 'B2B';
```

_I want to display [and save to the view] who applied for a 'Team Leader' Position: <br>
first&last name (of the candidate from [User] table) 
with status of the application in the system and estimated date of starting work in the company._
```SQL
USE JobOffersManagementSystem
GO
CREATE OR ALTER VIEW StatusOfTeamLeaderApplications
AS
SELECT 
[User].FirstName, [User].LastName, ApplicationStatus.[Status], 
JobDetails.JobTitle, JobDetails.StartDate AS EstimatedStartDate
FROM JobApplication
INNER JOIN [User] ON JobApplication.CandidateId=[User].Id
INNER JOIN ApplicationStatus ON  JobApplication.StatusId=ApplicationStatus.Id
INNER JOIN JobDetails ON JobApplication.OfferId=JobDetails.Id
WHERE JobTitle= 'Team Leader'
GO

SELECT * FROM StatusOfTeamLeaderApplications;
```

_I want to see how many years my candidate worked in 'KPMG' AND 'ATZ' Company_
```SQL
SELECT SUM((DATEDIFF(d, StartDate, EndDate)) / 365.25) as 'years-count'
FROM PreviousExperience
WHERE UserId = 3 AND CompanyName = 'KPMG' OR CompanyName = 'ATZ';
```

_I want to see details about previous education and experience of all the users in the database_
```SQL
SELECT 
[User].FirstName, [User].LastName, [User].Email, Education.EducationType, 
PreviousExperience.CompanyName, PreviousExperience.StartDate, PreviousExperience.EndDate
FROM [User]
LEFT JOIN Education ON [User].Id=Education.UserId
LEFT JOIN PreviousExperience ON [User].Id=PreviousExperience.UserId;
```

_I want to display all candidates with their ratings_
```SQL
SELECT 
[User].FirstName, [User].LastName, [User].Email, 
[User].Phone, CandidateRating.Rating, CandidateRating.Opinion
FROM CandidateRating
RIGHT JOIN [User] ON CandidateRating.CandidateId=[User].Id
ORDER BY Rating ASC;
```

_If I use key word (e.g. ADMIN, CASE, CAST, CATALOG, CLASS, TYPE, USER) <br>
for database I need to put it in 
square brackets [ ] (for T-SQL) or quotation marks ""_
```SQL
SELECT DISTINCT JobTitle FROM JobDetails;
SELECT * FROM [User]
WHERE FirstName = 'Caroline';
```


_I want to display unique job titles in my job details table_
```SQL
SELECT DISTINCT JobTitle FROM JobDetails;
```
