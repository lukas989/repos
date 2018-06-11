delete from [dbo].[CustomerAddressTypes]
insert into [dbo].[CustomerAddressTypes] ([Name], [Description] ) VALUES ( 'Korespondencyjny','Adresy do korespondencji')
insert into [dbo].[CustomerAddressTypes] ([Name], [Description] ) VALUES ( 'Siedziby / Zamieszkania','Adresy siedziby / zamieszkania')
insert into [dbo].[CustomerAddressTypes] ([Name], [Description] ) VALUES ( 'Oddziału','Ares oddziału firmy')

delete from [dbo].[DiscountTypes]
insert into [dbo].[DiscountTypes]([Name], [Description] ) VALUES ( 'Procenty','Wartość obniżki w procentach')
insert into [dbo].[DiscountTypes]([Name], [Description] ) VALUES ( 'Waluta','Wartość obniżki w walucie')

delete from [dbo].[Suppliers]
insert into [dbo].[Suppliers] ([Name], [Description] ) VALUES  ('DELL','Producent sprzętu komputerowego dell')
insert into [dbo].[Suppliers] ([Name], [Description] ) VALUES  ('Kaspersky','Kaspersky internet security')
insert into [dbo].[Suppliers] ([Name], [Description] ) VALUES  ('Lenovo','Chiński producent sprzętu komputerowego')

delete from [dbo].[Regions]
insert into [dbo].[Regions] ([Name], [Description] ) VALUES  ('cent', 'centrum' )
insert into [dbo].[Regions] ([Name], [Description] ) VALUES  ('płn', 'północ')
insert into [dbo].[Regions] ([Name], [Description] ) VALUES  ('płd','południe')
insert into [dbo].[Regions] ([Name], [Description] ) VALUES  ('wsch','wschód' )
insert into [dbo].[Regions] ([Name], [Description] ) VALUES  ('zach', 'zachód' )


delete from [dbo].[Stocks]
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (1, 'CA', 'Warszawa główny magazyn')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (1, 'CR', 'Warszawa magazym reklamacyjny')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (1, 'CT', 'Warszawa magazym transportowy')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (1, 'CV', 'Magazyn wirtualny - licencje')

insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (2, 'NA', 'Północ główny magazyn')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (2, 'NR', 'Północ magazym transportowy')

insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (3, 'SA', 'Południe główny magazyn')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (3, 'SR', 'Południe magazym transportowy')

insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (4, 'EA', 'Wschód główny magazyn')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (4, 'ER', 'Wschód magazym transportowy')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (4, 'EE', 'Wschód magazym Export')

insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (5, 'WA', 'Zachód główny magazyn')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (5, 'WR', 'Zachód magazym transportowy')

insert into [dbo].[Products]([Name],[Description]) VALUES ('Lenovo ThinkPad X270 (20HN0016PB)','')
insert into [dbo].[Products]([Name],[Description]) VALUES ('Lenovo IdeaPad 510S (80SJ005PPB)','')

insert into [dbo].[Products]([Name],[Description]) VALUES ('Dell Vostro 5468','')
insert into [dbo].[Products]([Name],[Description]) VALUES ('Dell Inspiron 15 (5567)','')
insert into [dbo].[Products]([Name],[Description]) VALUES ('Dell Inspiron 15 (5567)','')
insert into [dbo].[Products]([Name],[Description]) VALUES ('Dell Inspiron 15 (5567)','')

insert into [dbo].[Products]([Name],[Description]) VALUES ('Small Office Security','')
insert into [dbo].[Products]([Name],[Description]) VALUES ('Anti-Virus','')
insert into [dbo].[Products]([Name],[Description]) VALUES ('Internet Security','')
insert into [dbo].[Products]([Name],[Description]) VALUES ('Total Security','')
