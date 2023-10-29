USE JobOffersManagementSystem
GO

INSERT INTO CompanyAdress(City, Street, Building, ZipCode)
VALUES ('Warsaw', 'Kwiatowa', '222', '00111');

INSERT INTO CompanyAdress(City, Street, Building, ZipCode)
VALUES 
('Wroc³aw', 'Lotnicza', '12', '54-155'),
('Warszawa','Bielañska','12','00-085');

--adding new tables and connecting them with Company Adress table
CREATE TABLE Countries(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Country NVARCHAR(50) NOT NULL);

CREATE TABLE Province(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Province NVARCHAR(50) NOT NULL,
ContryId INT NOT NULL FOREIGN KEY REFERENCES Countries(Id));

--added new columns to the table with null values to change after providing a data in existing records
ALTER TABLE CompanyAdress
ADD ProvinceId INT NULL FOREIGN KEY REFERENCES Province(Id), 
ContryId INT NULL FOREIGN KEY REFERENCES Countries(Id);

--renaming table name 
USE JobOffersManagementSystem
GO
EXEC sp_rename 'CompanyAdress', 'CompanyAddress';

--checking Id of Country = Poland in the Countries table
SELECT * FROM Countries
WHERE
Country='Poland';

--Poland Id = 137, populating polish voivodeships to the province table
INSERT INTO Province(Province, ContryId)
VALUES
('dolnoœl¹skie', 137),
('kujawsko-pomorskie', 137),
('lubelskie', 137),
('lubuskie', 137),
('³ódzkie', 137),
('ma³opolskie', 137),
('mazowieckie', 137),
('opolskie', 137),
('podkarpackie', 137),
('podlaskie', 137),
('pomorskie', 137),
('œl¹skie', 137),
('œwiêtokrzyskie', 137),
('warmiñsko-mazurskie', 137),
('wielkopolskie', 137),
('zachodniopomorskie', 137);

SELECT * FROM Province;

INSERT INTO Countries(Country)
VALUES 
('Afghanistan'),('Albania'),('Algeria'),('Andorra'),('Angola'),('Antigua and Barbuda'),('Argentina'),('Armenia'),('Austria'),('Azerbaijan'),('Bahrain'),
('Bangladesh'),('Barbados'),('Belarus'),('Belgium'),('Belize'),('Benin'),('Bhutan'),('Bolivia'),('Bosnia and Herzegovina'),('Botswana'),('Brazil'),
('Brunei'),('Bulgaria'),('Burkina Faso'),('Burundi'),('Cabo Verde'),('Cambodia'),('Cameroon'),('Canada'),('Central African Republic'),('Chad'),
('Channel Islands'),('Chile'),('China'),('Colombia'),('Comoros'),('Congo'),('Costa Rica'),('Côte d''Ivoire'),('Croatia'),('Cuba'),('Cyprus'),
('Czech Republic'),('Denmark'),('Djibouti'),('Dominica'),('Dominican Republic'),('DR Congo'),('Ecuador'),('Egypt'),('El Salvador'),('Equatorial Guinea'),
('Eritrea'),('Estonia'),('Eswatini'),('Ethiopia'),('Faeroe Islands'),('Finland'),('France'),('French Guiana'),('Gabon'),('Gambia'),('Georgia'),
('Germany'),('Ghana'),('Gibraltar'),('Greece'),('Grenada'),('Guatemala'),('Guinea'),('Guinea-Bissau'),('Guyana'),('Haiti'),('Holy See'),
('Honduras'),('Hong Kong'),('Hungary'),('Iceland'),('India'),('Indonesia'),('Iran'),('Iraq'),('Ireland'),('Isle of Man'),('Israel'),('Italy'),
('Jamaica'),('Japan'),('Jordan'),('Kazakhstan'),('Kenya'),('Kuwait'),('Kyrgyzstan'),('Laos'),('Latvia'),('Lebanon'),('Lesotho'),('Liberia'),('Libya'),
('Liechtenstein'),('Lithuania'),('Luxembourg'),('Macao'),('Madagascar'),('Malawi'),('Malaysia'),('Maldives'),('Mali'),('Malta'),('Mauritania'),('Mauritius'),
('Mayotte'),('Mexico'),('Moldova'),('Monaco'),('Mongolia'),('Montenegro'),('Morocco'),('Mozambique'),('Myanmar'),('Namibia'),('Nepal'),('Netherlands'),('Nicaragua'),
('Niger'),('Nigeria'),('North Korea'),('North Macedonia'),('Norway'),('Oman'),('Pakistan'),('Panama'),('Paraguay'),('Peru'),('Philippines'),('Poland'),
('Portugal'),('Qatar'),('Réunion'),('Romania'),('Russia'),('Rwanda'),('Saint Helena'),('Saint Kitts and Nevis'),('Saint Lucia'),('Saint Vincent and the Grenadines'),
('San Marino'),('Sao Tome & Principe'),('Saudi Arabia'),('Senegal'),('Serbia'),('Seychelles'),('Sierra Leone'),('Singapore'),('Slovakia'),('Slovenia'),('Somalia'),
('South Africa'),('South Korea'),('South Sudan'),('Spain'),('Sri Lanka'),('State of Palestine'),('Sudan'),('Suriname'),('Sweden'),('Switzerland'),('Syria'),
('Taiwan'),('Tajikistan'),('Tanzania'),('Thailand'),('The Bahamas'),('Timor-Leste'),('Togo'),('Trinidad and Tobago'),('Tunisia'),('Turkey'),('Turkmenistan'),
('Uganda'),('Ukraine'),('United Arab Emirates'),('United Kingdom'),('United States'),('Uruguay'),('Uzbekistan'),('Venezuela'),
('Vietnam'),('Western Sahara'),('Yemen'),('Zambia'),('Zimbabwe');

--displaying existing records in the table
SELECT * FROM CompanyAddress;

/* Province Id and CountryId have NULL values
I want to provide details for province annd country in existing records */

UPDATE CompanyAddress
SET ProvinceId = 7 , ContryId = 137
WHERE Id=1;

UPDATE CompanyAddress
SET ProvinceId = 1 , ContryId = 137
WHERE Id=2;

UPDATE CompanyAddress
SET ProvinceId = 7 , ContryId = 137
WHERE Id=3;

SELECT * FROM CompanyAddress;

INSERT INTO CompanyAddress(City, Street, Building, ApartmentNumber, ZipCode, ProvinceId, ContryId)
VALUES 
('Opole', 'Nowa', '1', '2', '00777', 8, 137),
('Opole', 'Nowa', '11a', '2bc', '00777', 8, 137),
('Luboszyce', 'Kawowa', '3', '3a', '00776', 8, 137),
('Zawada', 'Zawadzka', '7', NULL , '00776', 8, 137),
('Poznañ', 'Poznañska', '234', NULL , '00333', 15, 137),
('Poznañ', 'Warszawska', '300', NULL , '00333', 15, 137),
('Poznañ', 'Belgijska', '56', '15' , '00333', 15, 137),
('Warszawa', 'Belgijska', '233', NULL , '00999', 7, 137),
('Warszawa', 'Wiejska', '10', NULL , '00999', 7, 137),
('Warszawa', 'Nowomiejska', '100', '222A' , '00999', 7, 137);

SELECT * FROM CompanyAddress;

INSERT INTO Company(CompanyAddressId, NIP, KRS, Regon, BusinessName, CompanyDescription, FoundationDate)
VALUES
(1, '1231231231', '1231231231', NULL, 'First Company Sp. z o.o.', 'The best company in Warsaw', '1999-10-10'),
(2, '2222222222', '2222222222', NULL, '2nd Company Sp. z o.o.', 'We sell computers', '2007-05-10'),
(3, '3213213213', NULL , NULL, 'Three', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', '2007-05-10'),
(4, '4564564564', NULL , NULL, '666', 'Recruitment agency', '2014-08-25');

SELECT * FROM Company;

INSERT INTO Seniority(Id, SeniorityLevel)
VALUES
(1000, 'trainee'),
(1001, 'assistant'),
(1002, 'junior'),
(1003, 'mid'),
(1004, 'senior'),
(1005, 'expert'),
(1006, 'lead'),
(1007, 'manager'),
(1008, 'head'),
(1009, 'executive');

SELECT * FROM Seniority;

INSERT INTO WorkMode(Id, [Name])
VALUES
(2000, 'Remote'),
(2001, 'Hybrid'),
(2002, 'Office'),
(2003, 'Other');

INSERT INTO EmploymentType(Id, [Name])
VALUES
(3000, 'employment agreement'),
(3001, 'fixed-term contract'),
(3002, 'temporary contract'),
(3003, ' mandate contract'),
(3004, 'B2B'),
(3005, 'student agreement');

INSERT INTO FTE(Id, [Name])
VALUES
(1, 'full-time'),
(2, 'part-time'),
(3, '1/2'),
(4, '1/4'),
(5, '1/8'),
(6, 'other');


INSERT INTO Role(Id, [Name])
VALUES
(1, 'Admin'),
(2, 'Moderator'),
(3, 'Candidate'),
(4, 'Recruiter');

INSERT INTO JobDetails(CompanyId, JobTitle, MinSalary, MaxSalary, JobSpecification, Requirements, SeniorityLevel, FTE, EmploymentType, ModeType, OpeningsNumber, IssueDate, ExpiryDate, StartDate, Benefits, RecruitmentStages)
VALUES
(4, 'HR Specialist', 4000, 8000, 'A Human Resource Specialist is responsible for the day-to-day operations, 
including recruiting new employees or processing termination paperwork, 
preparing compensation packages with company policies set out by law, 
and fostering healthy workplace practices throughout every department.', 
'MS Office, Communiaction Skills, Advanced English, Analitycal skills, HR Enthusiast',1003,1,3000,2001,1, '2023-06-06', '2023-06-30', '2023-08-01', 'Luxmed, fruit Thursdays, extra day off for birthday', 1),
(4, 'HR Specialist', 6000, 9000, 'A Human Resource Specialist is responsible for the day-to-day operations, 
including recruiting new employees or processing termination paperwork, 
preparing compensation packages with company policies set out by law, 
and fostering healthy workplace practices throughout every department.', 
'MS Office, Communiaction Skills, Advanced English, Analitycal skills, HR Enthusiast',1003,1,3000, 2001,3,'2023-08-01', '2023-08-30', '2023-10-01', 'Luxmed, fruit Thursdays, extra day off for birthday', 2),
(5, 'HR Specialist', 4500, 7500, 'A Human Resource Specialist is responsible for the day-to-day operations, 
including recruiting new employees or processing termination paperwork, 
preparing compensation packages with company policies set out by law, 
and fostering healthy workplace practices throughout every department.', 
'MS Office, Communiaction Skills, Advanced English, Analitycal skills, HR Enthusiast',1003,1,3000,2001,1, '2023-01-01', '2023-01-30', '2023-03-01', 'Luxmed, fruit Thursdays, extra day off for birthday', 1),
(5, 'Tester', 4500, 7500, 'As a software tester, you will be involved in the quality assurance stage of software development and deployment', 
'MS Office, Communiaction, Postman, SQL, Java',1003,1,3000,2001,2,'2023-03-01', '2023-04-30', '2023-06-01', 'Luxmed, fruit Thursdays, extra day off for birthday', 1),
(5, '.NET Developer', 10000, 15000, 'NET developers design, develop, and maintain Microsoft-based software and web applications tailored to the needs of an organization. 
They demonstrate expertise in the . Net framework and fluency in various programming languages. 
They conduct extensive application testing to enhance functionality and user experience. ', 
'C#, SQL, .NET',1003,1,3004,2000,1,'2023-02-01', '2023-04-30', '2023-05-02', NULL, 1),
(6, 'Java Developer', 10000, 15000, 'A Java Developer is a programmer who designs, develops, and manages Java-based applications and software. 
With most large organizations using Java to implement software systems and backend services, a Java developer is one of the most sought-after jobs today.', 
'Java, SQL ',1003,1,3004,2000,2,'2023-02-01', '2023-04-30', '2023-05-02', NULL, 3),
(7, 'Team Leader', 11000, 17000, 'A team leader provides guidance and instruction to a working group about a project or portfolio of projects. 
They are in charge of delegating work, overseeing progress towards goals, and coaching team members as needed', 
'Communication ',1003,1,3004,2000,3,'2023-02-01', '2023-04-30', '2023-05-02', NULL, 1);

ALTER TABLE [User]
ALTER COLUMN Phone VARCHAR(15) NULL;

INSERT INTO [User](FirstName, LastName, Email, Position, RoleId, Phone, UserName)
VALUES
('Kate', 'Nowak', 'katenowak@xyz.com', 'Tester', 3, '5xx-xxx-000', 'katekate'),
('Kate', 'Flower', 'flower@xyz.com', 'Junior HR Specialist', 3, NULL, 'flowerkate'),
('Mark', 'Hanks', 'mhanks@xyz.com', 'Team Lead', 3, NULL, 'mhanks'),
('Karol', 'Grzyb', 'krzyb@pl.com', 'Team Lead', 3, NULL, 'kgrzyb'),
('Anne', 'Kowalski', 'akowalskisksk@vp.pl', 'Recruitment Specialist', 4, NULL, 'akowalski'),
('Caroline', 'Kowalski', 'kkowalskisksk@vp.pl', 'Recruitment Specialist', 4, '121121212', 'carolinek'),
('Konrad', 'Kaczynski', 'kasndvfghfv@vp.pl', 'Administrator', 1, '500078888', 'konradk');

INSERT INTO AttachmentType(Id, AttachmentTypeName)
VALUES
(1, 'CV'),
(2, 'Cover letter'),
(3, 'Portfolio'),
(4, 'Certificate'),
(5, 'Other');

--NVARCHAR(100) was not enough to some of the data, need to increase the size
ALTER TABLE ApplicationStatus
ALTER COLUMN DetailedDescription NVARCHAR(500) NOT NULL;

INSERT INTO ApplicationStatus(Id, [Status], UserNotification, DetailedDescription)
VALUES
(1, 'New', 'received application', 'Dear Candidate, We received your application. Our team is currently in the process of reviewing all applications. 
If your qualifications match our requirements, we will be in touch to discuss the next steps in the selection process. 
In the meantime, please explore our website and social media channels to learn more about our company culture and the work we do.
HR Team'),
(2, 'Interview', 'invited to interview', 'Dear Candidate, we are pleased to inform you that your application has been carefully reviewed,
and we are impressed with your qualifications and experience. We would like to invite you to an interview to learn more about your candidacy.
Please read the details for your interview and confirm your availability for the scheduled interview by replying to this email or contacting us. HR Team'),
(3, 'Offer', 'Hiring manager accepted a candidate for the position', 'Your draft here'),
(4, 'Hired', 'Cnadidate will be hired','Dear Candidate, we are thrilled to officially welcome you to the [Your Company] team! Congratulations on your new role as [Job Title]
and we are excited to have you on board. Please see the details in next e-mail. HR Team'),
(5, 'Rejected', 'When candidate will not work for you', 'Dear Candidate, Thank you very much for your application! We have looked at it carefully. 
Unfortunately, looking at your skills and experience, we know that they do not exactly match the profile of our ideal candidate.
We wish you the best of luck in your continued job search!
HR Team');

INSERT INTO JobApplication(OfferId, CandidateId, StatusId)
VALUES(13, 4, 2), (13, 8, 5), (16, 3, 3), (16, 6, 1), (19, 5, 3), (19, 6, 2), (17, 6, 1), (17, 9, 5);

INSERT INTO Attachment(AttachmentTypeId, FileId, UploadedOn, UserId)
VALUES
(1, 1, '2023-03-01', 3),
(2, 2, '2023-03-01', 3),
(3, 3, '2023-03-01', 3),
(1, 4, '2023-06-06', 4),
(2, 4, '2023-06-06', 4);

INSERT INTO ApplicationAttachment(Id, JobApplicationId)
VALUES(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8);

INSERT INTO Education(EducationType, UserId)
VALUES
('Bachelor of Science', 3),
('Master of Science', 4);

INSERT INTO PreviousExperience(UserId, StartDate, EndDate, CompanyName)
VALUES
(3, '2010-01-01', '2020-06-30', 'KPMG'),
(3, '2008-05-01', '2009-09-30', 'ATZ'),
(3, '2020-05-01', '2022-12-31', 'XYZ'),
(3, '2016-04-01', '2021-08-31', 'Best Company');

INSERT INTO CandidateRating(Opinion, Rating, CandidateId)
VALUES
('proffesional, talented, able to work in a team', 5, 3),
('achiever and eager to learn ', 4, 4);
