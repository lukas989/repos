delete from [dbo].[Products]
delete from [dbo].[Suppliers]
insert into [dbo].[Suppliers] ([Name], [Description] ) VALUES  ('DELL PC','Producent sprzętu komputerowego dell')
insert into [dbo].[Suppliers] ([Name], [Description] ) VALUES  ('DELL USA PC','Producent sprzętu komputerowego dell dystrybutor USA')
insert into [dbo].[Suppliers] ([Name], [Description] ) VALUES  ('Kaspersky software EU','Kaspersky internet security EU')
insert into [dbo].[Suppliers] ([Name], [Description] ) VALUES  ('Lenovo Company','Chiński producent sprzętu komputerowego')
insert into [dbo].[Suppliers] ([Name], [Description] ) VALUES  ('Lenovo Poland Support','Polski przedstawicielstwo chińskigo producent sprzętu komputerowego')

declare @supplierId int = 0;
select  @supplierId = [SupplierId] from [dbo].[Suppliers] where [Name] = 'DELL PC'

insert into [dbo].[Products]([Name],[Description],[SupplierId]) VALUES ('Dell Inspiron 15 (5567)',''	,@supplierId)
insert into [dbo].[Products]([Name],[Description],[SupplierId]) VALUES ('Dell Inspiron 15 (5567)',''	,@supplierId)
insert into [dbo].[Products]([Name],[Description],[SupplierId]) VALUES ('Dell Inspiron 15 (5567)',''	,@supplierId)

select  @supplierId = [SupplierId] from [dbo].[Suppliers] where [Name] = 'DELL USA PC'
insert into [dbo].[Products]([Name],[Description],[SupplierId]) VALUES ('Dell Vostro 5468',''			,@supplierId)

select  @supplierId = [SupplierId] from [dbo].[Suppliers] where [Name] = 'Lenovo Company'
insert into [dbo].[Products]([Name],[Description],[SupplierId]) VALUES ('Lenovo ThinkPad X270 (20HN0016PB)',''	,@supplierId)
insert into [dbo].[Products]([Name],[Description],[SupplierId]) VALUES ('Lenovo IdeaPad 510S (80SJ005PPB)',''	,@supplierId)

select  @supplierId = [SupplierId] from [dbo].[Suppliers] where [Name] = 'Lenovo Poland Support'
insert into [dbo].[Products]([Name],[Description],[SupplierId]) VALUES ('Lenovo IdeaPad 510S (80SJ005PPB) - Support 3 years',''	,@supplierId)


select  @supplierId = [SupplierId] from [dbo].[Suppliers] where [Name] = 'Kaspersky software EU'
insert into [dbo].[Products]([Name],[Description],[SupplierId]) VALUES ('Small Office Security','',@supplierId)
insert into [dbo].[Products]([Name],[Description],[SupplierId]) VALUES ('Anti-Virus','',@supplierId)
insert into [dbo].[Products]([Name],[Description],[SupplierId]) VALUES ('Internet Security','',@supplierId)
insert into [dbo].[Products]([Name],[Description],[SupplierId]) VALUES ('Total Security','',@supplierId)


delete from [dbo].[CustomerAddress]
delete from [dbo].[CustomerAddressTypes]
delete from [dbo].[Customers]
insert into [dbo].[Customers]([Name],[FirstName],[LastName],[Description],[TaxNumber],[Email],[IsBlocked],[EntryAuthor],[EntryDate],[LastAuthor],[LastUpdate])values
(null,'Bartosz','Pawlak','Pracownik firmy','84120102516','BartoszPawlak@jourrapide.com',0,user_name(),getdate(),user_name(),getdate()),
('Egidiusz Borkowski Soft','Egidiusz','Borkowski','','5228857093','EgidiuszBorkowskiSoft@gmail.com',0,user_name(),getdate(),user_name(),getdate()),
('Dream Home Improvements','Roman','Czarnecki','','1078538495','Roman@DreamHome.com',0,user_name(),getdate(),user_name(),getdate())



insert into [dbo].[CustomerAddressTypes] ([Name], [Description] ) VALUES ( 'Korespondencyjny','Adresy do korespondencji')
insert into [dbo].[CustomerAddressTypes] ([Name], [Description] ) VALUES ( 'Siedziby / Zamieszkania','Adresy siedziby / zamieszkania')
insert into [dbo].[CustomerAddressTypes] ([Name], [Description] ) VALUES ( 'Oddziału','Adres oddziału firmy')



declare @CustomerId int = 0;
select  @CustomerId = [CustomerId] from [dbo].[Customers] where FirstName = 'Bartosz' and LastName = 'Pawlak'

declare @CustomerAddressType int = 0;
select  @CustomerAddressType = [CustomerAddressTypeId] FROM [dbo].[CustomerAddressTypes] where [Name] = 'Siedziby / Zamieszkania'

insert into [dbo].[CustomerAddress]([CustomerId],[CustomerAddressTypeId],[Street],[City],[Zipcode],[Country],[Description])values
(@CustomerId, @CustomerAddressType , 'ul. Kokosowa 47', 'Zielona Góra', '65-120', 'PL', '2 piętro')

select  @CustomerId = [CustomerId] from [dbo].[Customers] where Name = 'Egidiusz Borkowski Soft'
select  @CustomerAddressType = [CustomerAddressTypeId] FROM [dbo].[CustomerAddressTypes] where [Name] = 'Siedziby / Zamieszkania'
insert into [dbo].[CustomerAddress]([CustomerId],[CustomerAddressTypeId],[Street],[City],[Zipcode],[Country],[Description])values
(@CustomerId, @CustomerAddressType , 'ul. Dobra 77', 'Łódź', '90-030', 'PL', '')

select  @CustomerId = [CustomerId] from [dbo].[Customers] where Name = 'Egidiusz Borkowski Soft'
select  @CustomerAddressType = [CustomerAddressTypeId] FROM [dbo].[CustomerAddressTypes] where [Name] = 'Korespondencyjny'
insert into [dbo].[CustomerAddress]([CustomerId],[CustomerAddressTypeId],[Street],[City],[Zipcode],[Country],[Description])values
(@CustomerId, @CustomerAddressType , 'ul. Miła 2', 'Łódź', '90-001', 'PL', '')



select  @CustomerId = [CustomerId] from [dbo].[Customers] where Name = 'Dream Home Improvements'
select  @CustomerAddressType = [CustomerAddressTypeId] FROM [dbo].[CustomerAddressTypes] where [Name] = 'Siedziby / Zamieszkania'
insert into [dbo].[CustomerAddress]([CustomerId],[CustomerAddressTypeId],[Street],[City],[Zipcode],[Country],[Description])values
(@CustomerId, @CustomerAddressType , 'ul. Nefrytowa 1', 'Warszawa', '03-680', 'PL', '')

select  @CustomerAddressType = [CustomerAddressTypeId] FROM [dbo].[CustomerAddressTypes] where [Name] = 'Korespondencyjny'
insert into [dbo].[CustomerAddress]([CustomerId],[CustomerAddressTypeId],[Street],[City],[Zipcode],[Country],[Description])values
(@CustomerId, @CustomerAddressType , 'ul. Nefrytowa 1a', 'Warszawa', '03-680', 'PL', '')

select  @CustomerAddressType = [CustomerAddressTypeId] FROM [dbo].[CustomerAddressTypes] where [Name] = 'Adres oddziału firmy'
insert into [dbo].[CustomerAddress]([CustomerId],[CustomerAddressTypeId],[Street],[City],[Zipcode],[Country],[Description])values
(@CustomerId, @CustomerAddressType , 'ul. Kowalczewskiego Sylwestra 26', 'Kielce', '25-635', 'PL', ''),
(@CustomerId, @CustomerAddressType , 'ul. Ordona Juliana 18', 'Katowice' , '40-163', 'PL', ''),
(@CustomerId, @CustomerAddressType , 'ul. Prząśniczki 86', 'Poznań', '61-070',  'PL', '')