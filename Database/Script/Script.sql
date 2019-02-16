﻿IF OBJECT_Id('dbo.ReceiptPlanLines', 'U') IS NOT NULL 
  DROP TABLE dbo.ReceiptPlanLines; 

IF OBJECT_Id('dbo.ReceiptPlans', 'U') IS NOT NULL 
  DROP TABLE dbo.ReceiptPlans; 
  
IF OBJECT_Id('dbo.PurchaseOrderLines', 'U') IS NOT NULL 
  DROP TABLE dbo.PurchaseOrderLines; 

IF OBJECT_Id('dbo.PurchaseOrders', 'U') IS NOT NULL 
  DROP TABLE dbo.PurchaseOrders; 
  
IF OBJECT_Id('dbo.Suppliers', 'U') IS NOT NULL 
  DROP TABLE dbo.Suppliers;

IF OBJECT_Id('dbo.Products', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Products];

  IF OBJECT_Id('dbo.PurchaseOrderStatus', 'U') IS NOT NULL 
  DROP TABLE dbo.PurchaseOrderStatus; 

IF OBJECT_Id('dbo.DiscountTypes', 'U') IS NOT NULL 
  DROP TABLE dbo.DiscountTypes; 

IF OBJECT_Id('dbo.ReceiptPlanStatus', 'U') IS NOT NULL 
  DROP TABLE dbo.ReceiptPlanStatus; 

IF OBJECT_Id('dbo.Stocks', 'U') IS NOT NULL 
  DROP TABLE dbo.Stocks; 
  
IF OBJECT_Id('dbo.Regions', 'U') IS NOT NULL 
  DROP TABLE dbo.Regions; 

IF OBJECT_Id('dbo.Customers', 'U') IS NOT NULL 
 DROP TABLE dbo.Customers; 

IF OBJECT_Id('dbo.CustomerAddress', 'U') IS NOT NULL 
 DROP TABLE dbo.CustomerAddress; 

 
  CREATE TABLE [dbo].[Producers]
(
	[ProducerId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (50) NOT NULL,
	[Description] varchar (255) NOT NULL,
	[EntryAuthor] varchar (32) NOT NULL DEFAULT (SUSER_SNAME()),
	[EntryDate] datetime NOT NULL DEFAULT (GETDATE()),
	[LastAuthor] varchar (32) NOT NULL DEFAULT (suser_sname()),
	[LastUpdate] datetime NOT NULL  DEFAULT (getdate()),
	CONSTRAINT [PK_Producers] PRIMARY KEY CLUSTERED ([ProducerId])
)

  CREATE TABLE [dbo].[Products]
(
	[ProductId] INT IDENTITY(1,1) NOT NULL,
	[ProducerId] INT NOT NULL,
	[SupplierId] INT NOT NULL,
	[Name] varchar (50) NOT NULL,
	[Description] varchar (255) NOT NULL,
	[EntryAuthor] varchar (32) NOT NULL DEFAULT (SUSER_SNAME()),
	[EntryDate] datetime NOT NULL DEFAULT (GETDATE()),
	[LastAuthor] varchar (32) NOT NULL DEFAULT (suser_sname()),
	[LastUpdate] datetime NOT NULL  DEFAULT (getdate()),
	CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductId]),
	CONSTRAINT [FK_Supplier_Products] FOREIGN KEY ([SupplierId])  REFERENCES Suppliers([SupplierId]),
	CONSTRAINT [FK_Producer_Products] FOREIGN KEY ([ProducerId])  REFERENCES Producers([ProducerId])
)

  CREATE TABLE [dbo].[Suppliers]
(
	[SupplierId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (50) NOT NULL,
	[Description] varchar (255) NOT NULL,
	[EntryAuthor] varchar (32) NOT NULL DEFAULT (suser_sname()),
	[EntryDate] datetime NOT NULL DEFAULT (getdate()),
	[LastAuthor] varchar (32) NOT NULL DEFAULT (suser_sname()),
	[LastUpdate] datetime NOT NULL  DEFAULT (getdate()),
	CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED ([SupplierId])
)



CREATE TABLE [dbo].[PurchaseOrders]
(
	[PurchaseOrderId] INT IDENTITY(1,1) NOT NULL,
    [PurchaseOrderStatusId] INT NOT NULL,    
	[SupplierId] INT NOT NULL,
	[ExpectedDate] datetime NULL,
	[CurrencyId] char (3)  NOT NULL,
	[CurrencyRate] decimal (15, 5) NOT NULL DEFAULT ((1)),
	[StockId] INT NOT NULL,
	[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (suser_sname()),
	[EntryDate] datetime NOT NULL  DEFAULT (getdate()),
	[LastAuthor] varchar (32)  NOT NULL  DEFAULT (suser_sname()),
	[LastUpdate] datetime NOT NULL  DEFAULT (getdate()),
	CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY CLUSTERED ([PurchaseOrderId]),
	CONSTRAINT FK_Supplier_PurchaseOrders FOREIGN KEY ([SupplierId])  REFERENCES Suppliers([SupplierId]),
	CONSTRAINT FK_Stock_PurchaseOrders FOREIGN KEY ([StockId])  REFERENCES Stocks([StockId])
    
)


CREATE TABLE [dbo].[PurchaseOrderLines]
(
	[PurchaseOrderId] int NOT NULL,
	[PurchaseOrderLineNo] int NOT NULL,
	[ProductId] INT NOT NULL,
	[OrderedQty] int NOT NULL,
	[RecivedQty] int NULL,
	[PriceTypeId] int NOT NULL,
	[PurchaseOrderPrice] decimal (15, 5) NOT NULL DEFAULT ((1)),
	[ExpectedDate] datetime NULL,
	[DeliveryDate] datetime NULL,
	[DiscountTypeId] INT NOT NULL  DEFAULT ((1)),
	[DiscountValue] INT NULL,
	[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[EntryDate] datetime NOT NULL  DEFAULT (GETDATE()),
	[LastAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[LastUpdate] datetime NOT NULL  DEFAULT (GETDATE()),
	CONSTRAINT [PK_PurchaseOrderLines] PRIMARY KEY CLUSTERED ([PurchaseOrderId],[PurchaseOrderLineNo]),
	CONSTRAINT FK_Products_PurchaseOrderLines FOREIGN KEY ([ProductId])  REFERENCES Products([ProductId]),
	CONSTRAINT FK_DiscountTypes_PurchaseOrderLines FOREIGN KEY (DiscountTypeId)  REFERENCES DiscountTypes([DiscountTypeId]),
	

	
)

CREATE TABLE [dbo].[ReceiptPlans]
(
[ReceiptPlanId] INT IDENTITY(1,1) NOT NULL,
[ReceiptPlanStatusId] INT NOT NULL, 
[SupplierId] INT NOT NULL,
[ExpectedDate] datetime NULL,
[StockId] INT not null,
[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[EntryDate] datetime NOT NULL  DEFAULT (GETDATE()),
[LastAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[LastUpdate] datetime NOT NULL  DEFAULT (GETDATE()),
CONSTRAINT [PK_ReceiptPlans] PRIMARY KEY CLUSTERED ([ReceiptPlanId]),
CONSTRAINT FK_Supplier_ReceiptPlans FOREIGN KEY ([SupplierId])  REFERENCES Suppliers([SupplierId]),
CONSTRAINT FK_Stock_ReceiptPlans FOREIGN KEY ([StockId])  REFERENCES Stocks([StockId])
)




CREATE TABLE [dbo].[ReceiptPlanLines]
(
[ReceiptPlanId] INT NOT NULL,
[ReceiptPlanLineNo] INT NOT NULL,
[PurchaseOrderId] INT NOT NULL,
[PurchaseOrderLineNo] INT NOT NULL,
[ExpectedQty] INT NOT NULL,
[RecivedQty] INT NULL,
[DeliveryDate] datetime NULL,
[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[EntryDate] datetime NOT NULL  DEFAULT (GETDATE()),
[LastAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[LastUpdate] datetime NOT NULL  DEFAULT (GETDATE()),
CONSTRAINT [PK_ReceiptPlanLines] PRIMARY KEY CLUSTERED ([ReceiptPlanId],[ReceiptPlanLineNo]),
CONSTRAINT FK_ReceiptPlans_ReceiptPlanLines FOREIGN KEY ([ReceiptPlanId])  REFERENCES ReceiptPlans([ReceiptPlanId]),
CONSTRAINT FK_PurchaseOrder_ReceiptPlanLines FOREIGN KEY ([PurchaseOrderId])  REFERENCES PurchaseOrders([PurchaseOrderId])
)
CREATE TABLE [dbo].[PurchaseOrderStatus]
(
	[PurchaseOrderStatusId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (32) NOT NULL, 
	[Description] varchar (255) NULL,
	CONSTRAINT [PK_PurchaseOrderStatus] PRIMARY KEY CLUSTERED ([PurchaseOrderStatusId]),
	--CONSTRAINT FK_PurchaseOrder_PurchaseOrderStatus FOREIGN KEY ([PurchaseOrderStatusId])  REFERENCES PurchaseOrders([PurchaseOrderStatusId])
)

CREATE TABLE [dbo].[DiscountTypes]
(
	[DiscountTypeId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (32) NOT NULL, 
	[Description] varchar (255) NULL,
	CONSTRAINT [PK_DiscountTypes] PRIMARY KEY CLUSTERED ([DiscountTypeId])
)

CREATE TABLE [dbo].[ReceiptPlanStatus]
(
	[ReceiptPlanStatusId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (32) NOT NULL, 
	[Description] varchar (255) NULL,
	CONSTRAINT [PK_ReceiptPlanStatus] PRIMARY KEY CLUSTERED ([ReceiptPlanStatusId])
)

CREATE TABLE [dbo].[Regions]
(
	[RegionId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (32) NOT NULL, 
	[Description] varchar (255) NULL,
	CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED ([RegionId])
)

CREATE TABLE [dbo].[Stocks]
(
	[StockId] INT IDENTITY(1,1) NOT NULL,
	[RegionId] INT NOT NULL,
	[Name] varchar (32) NOT NULL, 
	[Description] varchar (255) NULL,
	CONSTRAINT [PK_Stocks] PRIMARY KEY CLUSTERED ([StockId])
)


CREATE TABLE [dbo].[Customers]
(
	[CustomerId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (200) NULL,
	[FirstName] varchar (200) NULL,
	[LastName] varchar (200) NULL,
	[Description] varchar (1500) NULL,
	[TaxNumber] varchar (20) NULL,
	[Email] varchar (100) NOT NULL,
	[NationalCourtRegister] varchar (20) NULL,
	[IsBlocked] [BIT] NOT NULL DEFAULT 0, 
	[EntryAuthor] varchar (32) NOT NULL DEFAULT (SUSER_SNAME()),
	[EntryDate] datetime NOT NULL DEFAULT (GETDATE()),
	[LastAuthor] varchar (32) NOT NULL DEFAULT (SUSER_SNAME()),
	[LastUpdate] datetime NOT NULL DEFAULT (GETDATE()),
	CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerId])	
)

CREATE TABLE [dbo].[CustomerAddress]
(
	[CustomerAddressId] INT IDENTITY(1,1) NOT NULL,
	[CustomerId] INT NOT NULL,
	[CustomerAddressTypeId] INT NOT NULL,
	[Street]	VARCHAR(255) NOT NULL,
	[City]		VARCHAR(255) NOT NULL,
	[Zipcode]	VARCHAR(15)  NOT NULL,
	[Country]	VARCHAR(2)  NOT NULL,
	[Description]	VARCHAR(255)  NULL,
	CONSTRAINT [PK_CustomerAddress] PRIMARY KEY CLUSTERED ([CustomerAddressId]),
	CONSTRAINT FK_Customers_CustomerAddress FOREIGN KEY ([CustomerId])  REFERENCES Customers([CustomerId])
	
)

--CONSTRAINT FK_ReceiptPlanLines_PurchaseOrderLines FOREIGN KEY ([PurchaseOrderId],[PurchaseOrderLineNo])  REFERENCES ReceiptPlanLines([PurchaseOrderId],[PurchaseOrderLineNo])

CREATE TABLE [dbo].[CustomerAddressTypes]
(
	[CustomerAddressTypeId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (32) NOT NULL, 
	[Description] varchar (255) NULL,
	CONSTRAINT [PK_CustomerAddressTypes] PRIMARY KEY CLUSTERED ([CustomerAddressTypeId]),
	--CONSTRAINT FK_PurchaseOrder_PurchaseOrderStatus FOREIGN KEY ([PurchaseOrderStatusId])  REFERENCES PurchaseOrders([PurchaseOrderStatusId])
)


CREATE TABLE [dbo].[SalesOrders]
(
	[SalesOrderId] INT IDENTITY(1,1) NOT NULL,
    [SalesOrderStatusId] INT NOT NULL,    
	[CustomerId] INT NOT NULL,
	[ExpectedDate] datetime NULL,
	[CurrencyId] char (3)  NOT NULL,
	[CurrencyRate] decimal (15, 5) NOT NULL DEFAULT ((1)),
	[StockId] INT NOT NULL,
	[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (suser_sname()),
	[EntryDate] datetime NOT NULL  DEFAULT (getdate()),
	[LastAuthor] varchar (32)  NOT NULL  DEFAULT (suser_sname()),
	[LastUpdate] datetime NOT NULL  DEFAULT (getdate()),
	CONSTRAINT [PK_SalesOrder] PRIMARY KEY CLUSTERED ([SalesOrderId])    ,
	CONSTRAINT FK_Customers_SalesOrder FOREIGN KEY ([CustomerId])  REFERENCES Customers([CustomerId])
)


CREATE TABLE [dbo].[SalesOrderLines]
(
	[SalesOrderId] int NOT NULL,
	[SalesOrderLineNo] int NOT NULL,
	[ProductId] INT NOT NULL,
	[OrderedQty] int NOT NULL,
	[RecivedQty] int NULL,
	[PriceTypeId] int NOT NULL,
	[PurchaseOrderPrice] decimal (15, 5) NOT NULL DEFAULT ((1)),
	[ExpectedDate] datetime NULL,
	[DeliveryDate] datetime NULL,
	[DiscountTypeId] INT NOT NULL  DEFAULT ((1)),
	[DiscountValue] INT NULL,
	[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[EntryDate] datetime NOT NULL  DEFAULT (GETDATE()),
	[LastAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[LastUpdate] datetime NOT NULL  DEFAULT (GETDATE()),
	CONSTRAINT [PK_SalesOrderLines] PRIMARY KEY CLUSTERED ([SalesOrderId],[SalesOrderLineNo]),
	CONSTRAINT FK_Products_SalesOrderLines FOREIGN KEY ([ProductId])  REFERENCES Products([ProductId]),
	CONSTRAINT FK_DiscountTypes_SalesOrderLines FOREIGN KEY (DiscountTypeId)  REFERENCES DiscountTypes([DiscountTypeId]),
)

CREATE TABLE [dbo].[SalesOrderStatus]
(
	[SalesOrderStatusId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (32) NOT NULL, 
	[Description] VARCHAR (255) NULL,
	CONSTRAINT [PK_SalesOrderStatus] PRIMARY KEY CLUSTERED ([SalesOrderStatusId]),
)

