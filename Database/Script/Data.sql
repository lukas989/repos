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
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (1, 'WA', 'Warszawa główny magazyn')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (1, 'WR', 'Warszawa magazym reklamacyjny')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (1, 'WT', 'Warszawa magazym transportowy')


