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
		   'Grupa Deichmann jest najwi�kszym detalicznym sprzedawc� obuwia w Europie. Firma zosta�a za�o�ona w 1913 roku w Essen w Niemczech przez Heinricha Deichmanna i jest obecnie w�asno�ci� trzeciego pokolenia rodziny. W Polsce dzia�amy od 1997 r. i zatrudniamy obecnie ponad 2000 os�b. Jako firma rozwijaj�ca si� w spos�b zr�wnowa�ony, od kilkudziesi�ciu lat mo�emy zapewni� naszym pracownikom stabiln� prac� w dobrej atmosferze oraz szans� dalszego rozwoju. Deichmann w liczbach: Ponad 100 lat tradycji 3900 sklep�w w 26 krajach Ponad 170.000.000 par but�w sprzedawanych rocznie 250 sklep�w i 2000 pracownik�w w Polsce',
		   '2002-01-08','Zarzad'),
		   (2,'7740001454', NULL, NULL,'POLSKI KONCERN NAFTOWY ORLEN S A',
		   'Chcemy tworzy� nowe rozwi�zania w obszarze energetyki i mobilno�ci oparte na zaawansowanych, czystych technologiach. To one b�d� kluczem do realizacji naszego d�ugofalowego celu, osi�gni�cia neutralno�ci emisyjnej w 2050 roku.',
		   '2001-07-19','ZARZ�D PKN ORLEN S.A.')
GO


