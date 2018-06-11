delete from [dbo].[CustomerAddressTypes]
insert into [dbo].[CustomerAddressTypes] ([Name], [Description] ) VALUES ( 'Korespondencyjny','Adresy do korespondencji')
insert into [dbo].[CustomerAddressTypes] ([Name], [Description] ) VALUES ( 'Siedziby / Zamieszkania','Adresy siedziby / zamieszkania')
insert into [dbo].[CustomerAddressTypes] ([Name], [Description] ) VALUES ( 'Oddziału','Ares oddziału firmy')

delete from [dbo].[DiscountTypes]
insert into [dbo].[DiscountTypes]([Name], [Description] ) VALUES ( 'Procenty','Wartość obniżki w procentach')
insert into [dbo].[DiscountTypes]([Name], [Description] ) VALUES ( 'Waluta','Wartość obniżki w walucie')

delete from [dbo].[Suppliers]
insert into [dbo].[Suppliers] ([Name], [Description] ) VALUES  ('DELL PC','Producent sprzętu komputerowego dell')
insert into [dbo].[Suppliers] ([Name], [Description] ) VALUES  ('DELL USA PC','Producent sprzętu komputerowego dell dystrybutor USA')
insert into [dbo].[Suppliers] ([Name], [Description] ) VALUES  ('Kaspersky software EU','Kaspersky internet security EU')
insert into [dbo].[Suppliers] ([Name], [Description] ) VALUES  ('Lenovo Company','Chiński producent sprzętu komputerowego')
insert into [dbo].[Suppliers] ([Name], [Description] ) VALUES  ('Lenovo Poland Support','Polski przedstawicielstwo chińskigo producent sprzętu komputerowego')

delete from [dbo].[Producers]
insert into [dbo].[Producers] ([Name], [Description] ) VALUES  ('DELL','')
insert into [dbo].[Producers] ([Name], [Description] ) VALUES  ('Kaspersky','Kaspersky internet security')
insert into [dbo].[Producers] ([Name], [Description] ) VALUES  ('Lenovo','')


delete from [dbo].[Regions]
insert into [dbo].[Regions] ([Name], [Description] ) VALUES  ('cent', 'centrum' )
insert into [dbo].[Regions] ([Name], [Description] ) VALUES  ('płn', 'północ')
insert into [dbo].[Regions] ([Name], [Description] ) VALUES  ('płd','południe')
insert into [dbo].[Regions] ([Name], [Description] ) VALUES  ('wsch','wschód' )
insert into [dbo].[Regions] ([Name], [Description] ) VALUES  ('zach', 'zachód' )


delete from [dbo].[Stocks]
declare @regionId int = 0;
select  @regionId = [RegionId] from [dbo].[Regions] where [Name] = 'cent'
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (@regionId, 'CA', 'Warszawa główny magazyn')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (@regionId, 'CR', 'Warszawa magazym reklamacyjny')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (@regionId, 'CT', 'Warszawa magazym transportowy')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (@regionId, 'CV', 'Magazyn wirtualny - licencje')

select  @regionId = [RegionId] from [dbo].[Regions] where [Name] = 'płn'
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (@regionId, 'NA', 'Północ główny magazyn')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (@regionId, 'NR', 'Północ magazym transportowy')

select  @regionId = [RegionId] from [dbo].[Regions] where [Name] = 'płd'
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (@regionId, 'SA', 'Południe główny magazyn')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (@regionId, 'SR', 'Południe magazym transportowy')

select  @regionId = [RegionId] from [dbo].[Regions] where [Name] = 'wsch'
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (@regionId, 'EA', 'Wschód główny magazyn')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (@regionId, 'ER', 'Wschód magazym transportowy')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (@regionId, 'EE', 'Wschód magazym Export')

select  @regionId = [RegionId] from [dbo].[Regions] where [Name] = 'zach'
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (@regionId, 'WA', 'Zachód główny magazyn')
insert into [dbo].[Stocks] ([RegionId] , [Name], [Description] ) VALUES (@regionId, 'WR', 'Zachód magazym transportowy')



declare @producerId int = 0;
declare @supplierId int = 0;
select  @producerId = [ProducerId] from [dbo].[Producers] where [Name] = 'DELL'
select  @supplierId = [SupplierId] from [dbo].[Suppliers] where [Name] = 'DELL PC'

insert into [dbo].[Products]([Name],[Description],[ProducerId],[SupplierId]) VALUES ('Dell Inspiron 15 (5567)',''	,@producerId,@supplierId)
insert into [dbo].[Products]([Name],[Description],[ProducerId],[SupplierId]) VALUES ('Dell Inspiron 15 (5567)',''	,@producerId,@supplierId)
insert into [dbo].[Products]([Name],[Description],[ProducerId],[SupplierId]) VALUES ('Dell Inspiron 15 (5567)',''	,@producerId,@supplierId)

select  @supplierId = [SupplierId] from [dbo].[Suppliers] where [Name] = 'DELL USA PC'
insert into [dbo].[Products]([Name],[Description],[ProducerId],[SupplierId]) VALUES ('Dell Vostro 5468',''			,@producerId,@supplierId)

select  @producerId = [ProducerId] from [dbo].[Producers] where [Name] = 'Lenovo'
select  @supplierId = [SupplierId] from [dbo].[Suppliers] where [Name] = 'Lenovo Company'
insert into [dbo].[Products]([Name],[Description]) VALUES ('Lenovo ThinkPad X270 (20HN0016PB)',''	,@producerId,@supplierId)
insert into [dbo].[Products]([Name],[Description]) VALUES ('Lenovo IdeaPad 510S (80SJ005PPB)',''	,@producerId,@supplierId)

select  @supplierId = [SupplierId] from [dbo].[Suppliers] where [Name] = 'Lenovo Poland Support'
insert into [dbo].[Products]([Name],[Description]) VALUES ('Lenovo IdeaPad 510S (80SJ005PPB) - Support 3 years',''	,@producerId,@supplierId)


select  @producerId = [ProducerId] from [dbo].[Producers] where [Name] = 'Kaspersky'
select  @supplierId = [SupplierId] from [dbo].[Suppliers] where [Name] = 'Kaspersky software EU'
insert into [dbo].[Products]([Name],[Description]) VALUES ('Small Office Security','',@producerId,@supplierId)
insert into [dbo].[Products]([Name],[Description]) VALUES ('Anti-Virus','',@producerId,@supplierId)
insert into [dbo].[Products]([Name],[Description]) VALUES ('Internet Security','',@producerId,@supplierId)
insert into [dbo].[Products]([Name],[Description]) VALUES ('Total Security','',@producerId,@supplierId)
