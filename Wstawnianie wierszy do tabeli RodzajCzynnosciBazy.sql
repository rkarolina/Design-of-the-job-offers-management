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
INSERT INTO [dbo].[RodzajCzynnosciBazy]([Id],[RodzajCzynnosci],[OpisProcesu])VALUES(10002,'Artyku�y Bran�owe','Poradniki dotycz�ce pracy')
INSERT INTO [dbo].[RodzajCzynnosciBazy]([Id],[RodzajCzynnosci],[OpisProcesu])VALUES(10003,'instrukcja','Instrukcje korzystania z systemu')
INSERT INTO [dbo].[RodzajCzynnosciBazy]([Id],[RodzajCzynnosci],[OpisProcesu])VALUES(10004,'inspiracja','Artyku� motywuj�cy')
INSERT INTO [dbo].[RodzajCzynnosciBazy]([Id],[RodzajCzynnosci],[OpisProcesu])VALUES(10005,'pytanie','Zapytania od u�ytkownika (do sekcji Q&A) ')
GO

