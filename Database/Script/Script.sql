IF OBJECT_Id('dbo.RecPlanLines', 'U') IS NOT NULL 
  DROP TABLE dbo.RecPlanLines; 

IF OBJECT_Id('dbo.RecPlans', 'U') IS NOT NULL 
  DROP TABLE dbo.RecPlans; 
  
IF OBJECT_Id('dbo.SalesOrderLines', 'U') IS NOT NULL 
  DROP TABLE dbo.SalesOrderLines; 

IF OBJECT_Id('dbo.SalesOrders', 'U') IS NOT NULL 
  DROP TABLE dbo.SalesOrders; 
  
IF OBJECT_Id('dbo.Suppliers', 'U') IS NOT NULL 
  DROP TABLE dbo.Suppliers;

IF OBJECT_Id('dbo.Products', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Products];

  IF OBJECT_Id('dbo.SalesOrderStatus', 'U') IS NOT NULL 
  DROP TABLE dbo.SalesOrderStatus; 

IF OBJECT_Id('dbo.DiscountTypes', 'U') IS NOT NULL 
  DROP TABLE dbo.DiscountTypes; 

IF OBJECT_Id('dbo.RecPlanStatus', 'U') IS NOT NULL 
  DROP TABLE dbo.RecPlanStatus; 

IF OBJECT_Id('dbo.Stocks', 'U') IS NOT NULL 
  DROP TABLE dbo.Stocks; 
  
IF OBJECT_Id('dbo.Regions', 'U') IS NOT NULL 
  DROP TABLE dbo.Regions; 

IF OBJECT_Id('dbo.Customers', 'U') IS NOT NULL 
 DROP TABLE dbo.Customers; 

IF OBJECT_Id('dbo.CustomerAddress', 'U') IS NOT NULL 
 DROP TABLE dbo.CustomerAddress; 


  CREATE TABLE [dbo].[Products]
(
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar] (50) NOT NULL,
	[Description] [varchar] (255) NOT NULL,
	[EntryAuthor] [varchar] (32) NOT NULL DEFAULT (SUSER_SNAME()),
	[EntryDate] [DATETIME] NOT NULL DEFAULT (GETDATE()),
	[LastAuthor] [VARCHAR] (32) NOT NULL DEFAULT (suser_sname()),
	[LastUpdate] [datetime] NOT NULL  DEFAULT (getdate()),
	CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductId])
)

  CREATE TABLE [dbo].[Suppliers]
(
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar] (50) NOT NULL,
	[Description] [varchar] (255) NOT NULL,
	[EntryAuthor] [varchar] (32) NOT NULL DEFAULT (suser_sname()),
	[EntryDate] [datetime] NOT NULL DEFAULT (getdate()),
	[LastAuthor] [varchar] (32) NOT NULL DEFAULT (suser_sname()),
	[LastUpdate] [datetime] NOT NULL  DEFAULT (getdate()),
	CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED ([SupplierId])
)



CREATE TABLE [dbo].[SalesOrders]
(
	[SalesOrderId] [int] IDENTITY(1,1) NOT NULL,
    [SalesOrderStatusId] [int] NOT NULL,    
	[SupplierId] [int] NOT NULL,
	[ExpectedDate] [datetime] NULL,
	[CurrencyId] [char] (3)  NOT NULL,
	[CurrencyRate] [decimal] (15, 5) NOT NULL DEFAULT ((1)),
	[StockId] [INT] NOT NULL,
	[EntryAuthor] [varchar] (32)  NOT NULL  DEFAULT (suser_sname()),
	[EntryDate] [datetime] NOT NULL  DEFAULT (getdate()),
	[LastAuthor] [varchar] (32)  NOT NULL  DEFAULT (suser_sname()),
	[LastUpdate] [datetime] NOT NULL  DEFAULT (getdate()),
	CONSTRAINT [PK_SalesOrders] PRIMARY KEY CLUSTERED ([SalesOrderId]),
	CONSTRAINT FK_Supplier_SalesOrders FOREIGN KEY ([SupplierId])  REFERENCES Suppliers([SupplierId]),
	CONSTRAINT FK_Stock_SalesOrders FOREIGN KEY ([StockId])  REFERENCES Stocks([StockId])
    
)


CREATE TABLE [dbo].[SalesOrderLines]
(
	[SalesOrderId] int NOT NULL,
	[SalesOrderLineNo] int NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderedQty] int NOT NULL,
	[RecivedQty] int NULL,
	[PriceTypeId] int NOT NULL,
	[SalesOrderPrice] [decimal] (15, 5) NOT NULL DEFAULT ((1)),
	[ExpectedDate] [datetime] NULL,
	[DeliveryDate] [datetime] NULL,
	[DiscountTypeId] INT NOT NULL  DEFAULT ((1)),
	[DiscountValue] INT NULL,
	[DiscountPercent] INT NULL,
	[EntryAuthor] [VARCHAR] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[EntryDate] [DATETIME] NOT NULL  DEFAULT (GETDATE()),
	[LastAuthor] [VARCHAR] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[LastUpdate] [DATETIME] NOT NULL  DEFAULT (GETDATE()),
	CONSTRAINT [PK_SalesOrderLines] PRIMARY KEY CLUSTERED ([SalesOrderId],[SalesOrderLineNo]),
	CONSTRAINT FK_Products_SalesOrderLines FOREIGN KEY ([ProductId])  REFERENCES Products([ProductId]),
	CONSTRAINT FK_DiscountTypes_SalesOrderLines FOREIGN KEY (DiscountTypeId)  REFERENCES DiscountTypes([DiscountTypeId]),
	

	
)

CREATE TABLE [dbo].[RecPlans]
(
[RecPlanId] [int] IDENTITY(1,1) NOT NULL,
[RecPlanStatusId] [INT] NOT NULL, 
[SupplierId] [INT] NOT NULL,
[ExpectedDate] [DATETIME] NULL,
[StockId] [INT] not null,
[EntryAuthor] [VARCHAR] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[EntryDate] [DATETIME] NOT NULL  DEFAULT (GETDATE()),
[LastAuthor] [VARCHAR] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[LastUpdate] [DATETIME] NOT NULL  DEFAULT (GETDATE()),
CONSTRAINT [PK_RecPlans] PRIMARY KEY CLUSTERED ([RecPlanId]),
CONSTRAINT FK_Supplier_RecPlans FOREIGN KEY ([SupplierId])  REFERENCES Suppliers([SupplierId]),
CONSTRAINT FK_Stock_RecPlans FOREIGN KEY ([StockId])  REFERENCES Stocks([StockId])
)




CREATE TABLE [dbo].[RecPlanLines]
(
[RecPlanId] INT NOT NULL,
[RecPlanLineNo] INT NOT NULL,
[SalesOrderId] INT NOT NULL,
[SalesOrderLineNo] INT NOT NULL,
[ExpectedQty] INT NOT NULL,
[RecivedQty] INT NULL,
[DeliveryDate] [DATETIME] NULL,
[EntryAuthor] [VARCHAR] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[EntryDate] [DATETIME] NOT NULL  DEFAULT (GETDATE()),
[LastAuthor] [VARCHAR] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[LastUpdate] [DATETIME] NOT NULL  DEFAULT (GETDATE()),
CONSTRAINT [PK_RecPlanLines] PRIMARY KEY CLUSTERED ([RecPlanId],[RecPlanLineNo]),
CONSTRAINT FK_RecPlans_RecPlanLines FOREIGN KEY ([RecPlanId])  REFERENCES RecPlans([RecPlanId]),
CONSTRAINT FK_SalesOrder_RecPlanLines FOREIGN KEY ([SalesOrderId])  REFERENCES SalesOrders([SalesOrderId])
)
CREATE TABLE [dbo].[SalesOrderStatus]
(
	[SalesOrderStatusId] [INT] IDENTITY(1,1) NOT NULL,
	[Name] [VARCHAR] (32) NOT NULL, 
	[Description] [VARCHAR] (255) NULL,
	CONSTRAINT [PK_SalesOrderStatus] PRIMARY KEY CLUSTERED ([SalesOrderStatusId]),
	--CONSTRAINT FK_SalesOrder_SalesOrderStatus FOREIGN KEY ([SalesOrderStatusId])  REFERENCES SalesOrders([SalesOrderStatusId])
)

CREATE TABLE [dbo].[DiscountTypes]
(
	[DiscountTypeId] [INT] IDENTITY(1,1) NOT NULL,
	[Name] [VARCHAR] (32) NOT NULL, 
	[Description] [VARCHAR] (255) NULL,
	CONSTRAINT [PK_DiscountTypes] PRIMARY KEY CLUSTERED ([DiscountTypeId])
)

CREATE TABLE [dbo].[RecPlanStatus]
(
	[RecPlanStatusId] [INT] IDENTITY(1,1) NOT NULL,
	[Name] [VARCHAR] (32) NOT NULL, 
	[Description] [VARCHAR] (255) NULL,
	CONSTRAINT [PK_RecPlanStatus] PRIMARY KEY CLUSTERED ([RecPlanStatusId])
)

CREATE TABLE [dbo].[Regions]
(
	[RegionId] [INT] IDENTITY(1,1) NOT NULL,
	[Name] [VARCHAR] (32) NOT NULL, 
	[Description] [VARCHAR] (255) NULL,
	CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED ([RegionId])
)

CREATE TABLE [dbo].[Stocks]
(
	[StockId] [INT] IDENTITY(1,1) NOT NULL,
	[RegionId] [INT] NOT NULL,
	[Name] [VARCHAR] (32) NOT NULL, 
	[Description] [VARCHAR] (255) NULL,
	CONSTRAINT [PK_Stocks] PRIMARY KEY CLUSTERED ([StockId])
)


CREATE TABLE [dbo].[Customers]
(
	[CustomerId] [INT] IDENTITY(1,1) NOT NULL,
	[Name] [VARCHAR] (200) NULL,
	[FirstName] [VARCHAR] (200) NULL,
	[LastName] [VARCHAR] (200) NULL,
	[Description] [VARCHAR] (1500) NULL,
	[TaxNumber] [VARCHAR] (20) NULL,
	[Email] [VARCHAR] (100) NOT NULL,
	[NationalCourtRegister] [VARCHAR] (20) NULL,
	[IsBlocked] [BIT] NOT NULL DEFAULT 0, 
	[EntryAuthor] [VARCHAR] (32) NOT NULL DEFAULT (SUSER_SNAME()),
	[EntryDate] [DATETIME] NOT NULL DEFAULT (GETDATE()),
	[LastAuthor] [VARCHAR] (32) NOT NULL DEFAULT (SUSER_SNAME()),
	[LastUpdate] [DATETIME] NOT NULL DEFAULT (GETDATE()),
	CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerId])	
)

CREATE TABLE [dbo].[CustomerAddress]
(
	[CustomerAddressId] [INT] IDENTITY(1,1) NOT NULL,
	[CustomerId] [INT] NOT NULL,
	[Street]	VARCHAR(255) NOT NULL,
	[City]		VARCHAR(255) NOT NULL,
	[Zipcode]	VARCHAR(15)  NOT NULL,
	[Country]	VARCHAR(2)  NOT NULL,
	[Description]	VARCHAR(255)  NULL,
	CONSTRAINT [PK_CustomerAddress] PRIMARY KEY CLUSTERED ([CustomerAddressId]),
	CONSTRAINT FK_Customers_CustomerAddress FOREIGN KEY ([CustomerId])  REFERENCES Customers([CustomerId])
	
)

--CONSTRAINT FK_RecPlanLines_SalesOrderLines FOREIGN KEY ([SalesOrderId],[SalesOrderLineNo])  REFERENCES RecPlanLines([SalesOrderId],[SalesOrderLineNo])

--