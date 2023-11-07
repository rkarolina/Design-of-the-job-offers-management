USE JobOffersManagementSystem
GO

-- I want to display all records in CompanyAddress table with information about country and voivodeship (from other tables)
SELECT CompanyAddress.City, CompanyAddress.Street, CompanyAddress.Building, CompanyAddress.ApartmentNumber, CompanyAddress.ZipCode, Countries.Country, Province.Province 
FROM CompanyAddress
JOIN Countries ON CompanyAddress.ContryId = Countries.Id
JOIN Province ON CompanyAddress.ProvinceId = Province.Id;

-- I want to display adresses of the existing companies in the database
SELECT Company.NIP, Company.BusinessName, Company.CompanyDescription, Company.FoundationDate, CompanyAddress.City, CompanyAddress.Street, CompanyAddress.Building, CompanyAddress.ZipCode
FROM Company
JOIN CompanyAddress ON Company.CompanyAddressId = CompanyAddress.Id

-- I want to count how many job offers are remote
SELECT COUNT(1) AS 'Remote jobs'
FROM JobDetails
JOIN WorkMode ON JobDetails.ModeType = WorkMode.Id
WHERE WorkMode.Name = 'Remote';

-- I want to display all 'B2B' offers in the database only with job title, salary, requirements and start date
SELECT JobDetails.JobTitle, JobDetails.MinSalary, JobDetails.MaxSalary, JobDetails.Requirements, JobDetails.StartDate
FROM JobDetails
JOIN EmploymentType ON EmploymentType.Id = JobDetails.EmploymentType
WHERE EmploymentType.Name = 'B2B';

-- I want to display only Users only with 'Recruiter' role in the system
SELECT [User].FirstName, [User].LastName, [User].Email
FROM [User]
JOIN [Role] ON [Role].Id = [User].RoleId
WHERE [Role].Name = 'Recruiter';

/* I want to display [and save to the view] who applied for a 'Team Leader' Position - first&last name (of the candidate from [User] table) 
with status of the application in the system and estimated date of starting work in the company. */
USE JobOffersManagementSystem
GO
CREATE OR ALTER VIEW StatusOfTeamLeaderApplications
AS
SELECT [User].FirstName, [User].LastName, ApplicationStatus.[Status], JobDetails.JobTitle, JobDetails.StartDate AS EstimatedStartDate
FROM JobApplication
INNER JOIN [User] ON JobApplication.CandidateId=[User].Id
INNER JOIN ApplicationStatus ON  JobApplication.StatusId=ApplicationStatus.Id
INNER JOIN JobDetails ON JobApplication.OfferId=JobDetails.Id
WHERE JobTitle= 'Team Leader'
GO

SELECT * FROM StatusOfTeamLeaderApplications;

-- I want to see how many years my candidate worked in 'KPMG' AND 'ATZ' Company
SELECT SUM((DATEDIFF(d, StartDate, EndDate)) / 365.25) as 'years-count'
FROM PreviousExperience
WHERE UserId = 3 AND CompanyName = 'KPMG' OR CompanyName = 'ATZ';

--I want to see details about previous education and experience of all the users in the database
SELECT [User].FirstName, [User].LastName, [User].Email, Education.EducationType, PreviousExperience.CompanyName, PreviousExperience.StartDate, PreviousExperience.EndDate
FROM [User]
LEFT JOIN Education ON [User].Id=Education.UserId
LEFT JOIN PreviousExperience ON [User].Id=PreviousExperience.UserId;

-- I want to review my opinions and rate of candidates in ascending order
SELECT [User].FirstName, [User].LastName, [User].Email, [User].Phone, CandidateRating.Rating, CandidateRating.Opinion
FROM CandidateRating
INNER JOIN [User] ON CandidateRating.CandidateId=[User].Id
ORDER BY Rating ASC;

-- I want to display all candidates with their ratings
SELECT [User].FirstName, [User].LastName, [User].Email, [User].Phone, CandidateRating.Rating, CandidateRating.Opinion
FROM CandidateRating
RIGHT JOIN [User] ON CandidateRating.CandidateId=[User].Id
ORDER BY Rating ASC;
-- the same
SELECT [User].FirstName, [User].LastName, [User].Email, [User].Phone, CandidateRating.Rating, CandidateRating.Opinion
FROM  [User]
LEFT JOIN CandidateRating ON CandidateRating.CandidateId=[User].Id
ORDER BY Rating ASC;

-- I want to see only candidates with rating = 5
SELECT [User].FirstName, [User].LastName, [User].Email, [User].Phone, CandidateRating.Rating, CandidateRating.Opinion
FROM [User]
JOIN CandidateRating ON [User].Id=CandidateRating.CandidateId
WHERE Rating = 5;

-- I want to see all job offers added by Company name starting from '2nd' with expiry date of each offer
SELECT JobTitle, MinSalary, MaxSalary, JobSpecification, ExpiryDate, Company.BusinessName
FROM JobDetails
JOIN Company ON JobDetails.CompanyId=Company.Id
WHERE Company.BusinessName LIKE '2nd%'

SELECT *
FROM JobDetails
WHERE JobTitle LIKE 'Te%';

SELECT DISTINCT JobTitle FROM JobDetails;
SELECT * FROM [User]
WHERE FirstName = 'Caroline';