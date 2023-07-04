USE [JobOffersMngSystem]
GO

INSERT INTO [dbo].[RodzajCzynnosciBazy]
           ([Id]
           ,[RodzajCzynnosci]
           ,[OpisProcesu])
     VALUES
           (10001
           ,'artykul'
           ,'Artykuly Branzowe')
GO
INSERT INTO [dbo].[RodzajCzynnosciBazy]([Id],[RodzajCzynnosci],[OpisProcesu])VALUES(10002,'Artyku³y Bran¿owe','Poradniki dotycz¹ce pracy')
INSERT INTO [dbo].[RodzajCzynnosciBazy]([Id],[RodzajCzynnosci],[OpisProcesu])VALUES(10003,'instrukcja','Instrukcje korzystania z systemu')
INSERT INTO [dbo].[RodzajCzynnosciBazy]([Id],[RodzajCzynnosci],[OpisProcesu])VALUES(10004,'inspiracja','Artyku³ motywuj¹cy')
INSERT INTO [dbo].[RodzajCzynnosciBazy]([Id],[RodzajCzynnosci],[OpisProcesu])VALUES(10005,'pytanie','Zapytania od u¿ytkownika (do sekcji Q&A) ')
GO

