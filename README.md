
_I want to create a database_
```
   CREATE DATABASE JobOffersManagementSystem;
```

_I want to rename a table_
```
USE JobOffersManagementSystem
GO
EXEC sp_rename 'CompanyAdress', 'CompanyAddress';
```

_I want to find particular record in the table with WHERE condition_
```
SELECT * FROM Countries
WHERE
Country='Poland';
```

_I want to display adresses of the existing companies in the database_
<br>
```
SELECT 
Company.NIP, Company.BusinessName, Company.CompanyDescription, 
Company.FoundationDate, CompanyAddress.City, CompanyAddress.Street, 
CompanyAddress.Building, CompanyAddress.ZipCode
FROM Company
JOIN CompanyAddress ON Company.CompanyAddressId = CompanyAddress.Id
```

_I want to see all added job offers for position name starting from 'Te'_
<br>
```
SELECT *
FROM JobDetails
WHERE JobTitle LIKE 'Te%';
```

_I want to count how many job offers are remote_
<br>
```
SELECT COUNT(1) AS 'Remote jobs'
FROM JobDetails
JOIN WorkMode ON JobDetails.ModeType = WorkMode.Id
WHERE WorkMode.Name = 'Remote';
```

_I want to display all 'B2B' offers in the database only with job title, salary, requirements and start date_
```
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
```
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
```
SELECT SUM((DATEDIFF(d, StartDate, EndDate)) / 365.25) as 'years-count'
FROM PreviousExperience
WHERE UserId = 3 AND CompanyName = 'KPMG' OR CompanyName = 'ATZ';
```

_I want to see details about previous education and experience of all the users in the database_
```
SELECT 
[User].FirstName, [User].LastName, [User].Email, Education.EducationType, 
PreviousExperience.CompanyName, PreviousExperience.StartDate, PreviousExperience.EndDate
FROM [User]
LEFT JOIN Education ON [User].Id=Education.UserId
LEFT JOIN PreviousExperience ON [User].Id=PreviousExperience.UserId;
```

_I want to display all candidates with their ratings_
```
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
```
SELECT DISTINCT JobTitle FROM JobDetails;
SELECT * FROM [User]
WHERE FirstName = 'Caroline';
```


_I want to display unique job titles in my job details table_
```
SELECT DISTINCT JobTitle FROM JobDetails;
```
