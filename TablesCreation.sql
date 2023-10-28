CREATE DATABASE JobOffersManagementSystem;
GO

USE JobOffersManagementSystem;

CREATE TABLE CompanyAdress(
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	City NVARCHAR(50) NOT NULL,
	Street NVARCHAR(50) NOT NULL,
	Building VARCHAR(4) NOT NULL, --for example 273B
	ApartmentNumber VARCHAR(4) NULL,
	ZipCode CHAR(6) NOT NULL
);

CREATE TABLE Company(
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	CompanyAddressId INT NOT NULL FOREIGN KEY REFERENCES CompanyAdress(Id),
	NIP CHAR(10) NOT NULL, --no need to calculate data on this column
	KRS CHAR(10) NULL, --no need to calculate data on this column
	Regon CHAR(14) NULL,
	BusinessName NVARCHAR(50) NOT NULL, --company name
	CompanyDescription NVARCHAR(500) NOT NULL,
	FoundationDate DATE NOT NULL
);

CREATE TABLE Seniority(
	Id INT NOT NULL PRIMARY KEY,
	SeniorityLevel NVARCHAR(15) NOT NULL --junior/mId/senior/intern etc
);

--Remote, Onsite, Hybrid
CREATE TABLE WorkMode(
	Id INT PRIMARY KEY,
	[Name] NVARCHAR(15) NOT NULL
);

-- contract, mandate contract, b2b
CREATE TABLE EmploymentType(
	Id INT NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(20)
);

-- full-time, 1/2, 1/4, 1/2, 1/8
CREATE TABLE FTE(
	Id INT NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(20)
);

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


CREATE TABLE [Role](
	Id INT NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(10) NOT NULL --admin, candidate, moderator
);

CREATE TABLE [User](
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) NOT NULL,
	Position NVARCHAR(30) NULL,
	RoleId INT NOT NULL FOREIGN KEY REFERENCES [Role](Id),
	Phone NVARCHAR(50) NULL,
	UserName NVARCHAR(20) NOT NULL,
);


CREATE TABLE AttachmentType(
	Id INT NOT NULL PRIMARY KEY,
	AttachmentTypeName NVARCHAR(20) NOT NULL
);

CREATE TABLE Attachment(
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	AttachmentTypeId INT NOT NULL FOREIGN KEY REFERENCES AttachmentType(Id),
	FileId INT NOT NULL,
	UploadedOn DATETIME NOT NULL, --when user added an attachment
	UserId INT NOT NULL FOREIGN KEY REFERENCES [User](Id) --one user can add multiple attachments
);

CREATE TABLE ApplicationStatus(
	Id INT NOT NULL PRIMARY KEY,
	[Status] NVARCHAR(50) NOT NULL, --(new, rejected, offer, hired)
	UserNotification NVARCHAR(100) NOT NULL, --"we received you application" and so on.
	DetailedDescription NVARCHAR(80) NOT NULL --how particular notification works
);


CREATE TABLE JobApplication(
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	OfferId INT NOT NULL FOREIGN KEY REFERENCES JobDetails(Id), --job offer no.
	CandidateId INT NOT NULL FOREIGN KEY REFERENCES [User](Id),
	StatusId INT NOT NULL FOREIGN KEY REFERENCES ApplicationStatus(Id)
);


CREATE TABLE ApplicationAttachment(
	Id INT NOT NULL FOREIGN KEY REFERENCES Attachment(Id),
	JobApplicationId INT NOT NULL FOREIGN KEY REFERENCES JobApplication(Id)
);


CREATE TABLE Education(
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	EducationType NVARCHAR(20) NOT NULL,
	UserId INT NULL FOREIGN KEY REFERENCES [User](Id)
)

CREATE TABLE PreviousExperience(
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	UserId INT NOT NULL FOREIGN KEY REFERENCES [User](Id),
	StartDate DATE NOT NULL,
	EndDate DATE NULL,
	CompanyName NVARCHAR(20) NOT NULL
);

--after interview
CREATE TABLE CandidateRating(
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	Opinion NVARCHAR(100) NULL,
	Rating INT NULL,
	CandidateId INT NOT NULL FOREIGN KEY REFERENCES [User](Id)
);

