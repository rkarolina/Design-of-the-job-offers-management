USE [JobOffersMngSystem]
GO

INSERT INTO [dbo].[Pracodawca]
           ([IdAdresuFirmy]
           ,[NIP]
           ,[KRS]
           ,[Regon]
           ,[NazwaFirmy]
           ,[OpisPracodawcy]
           ,[DataZalozenia]
           ,[Reprezentacja])
     VALUES
           (1,'6651815893','0000078170',310281708,'DEICHMANN-OBUWIE SP. Z O.O.',
		   'Grupa Deichmann jest najwiêkszym detalicznym sprzedawc¹ obuwia w Europie. Firma zosta³a za³o¿ona w 1913 roku w Essen w Niemczech przez Heinricha Deichmanna i jest obecnie w³asnoœci¹ trzeciego pokolenia rodziny. W Polsce dzia³amy od 1997 r. i zatrudniamy obecnie ponad 2000 osób. Jako firma rozwijaj¹ca siê w sposób zrównowa¿ony, od kilkudziesiêciu lat mo¿emy zapewniæ naszym pracownikom stabiln¹ pracê w dobrej atmosferze oraz szansê dalszego rozwoju. Deichmann w liczbach: Ponad 100 lat tradycji 3900 sklepów w 26 krajach Ponad 170.000.000 par butów sprzedawanych rocznie 250 sklepów i 2000 pracowników w Polsce',
		   '2002-01-08','Zarzad'),
		   (2,'7740001454', NULL, NULL,'POLSKI KONCERN NAFTOWY ORLEN S A',
		   'Chcemy tworzyæ nowe rozwi¹zania w obszarze energetyki i mobilnoœci oparte na zaawansowanych, czystych technologiach. To one bêd¹ kluczem do realizacji naszego d³ugofalowego celu, osi¹gniêcia neutralnoœci emisyjnej w 2050 roku.',
		   '2001-07-19','ZARZ¥D PKN ORLEN S.A.')
GO


