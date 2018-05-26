IF OBJECT_ID('dbo.RecPlanLines', 'U') IS NOT NULL 
  DROP TABLE dbo.RecPlanLines; 

IF OBJECT_ID('dbo.RecPlans', 'U') IS NOT NULL 
  DROP TABLE dbo.RecPlans; 
  
IF OBJECT_ID('dbo.SalesOrderLines', 'U') IS NOT NULL 
  DROP TABLE dbo.SalesOrderLines; 

IF OBJECT_ID('dbo.SalesOrders', 'U') IS NOT NULL 
  DROP TABLE dbo.SalesOrders; 
  
IF OBJECT_ID('dbo.Suppliers', 'U') IS NOT NULL 
  DROP TABLE dbo.Suppliers;

IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Products];

  IF OBJECT_ID('dbo.SalesOrderStatus', 'U') IS NOT NULL 
  DROP TABLE dbo.SalesOrderStatus; 

IF OBJECT_ID('dbo.DiscountTypes', 'U') IS NOT NULL 
  DROP TABLE dbo.DiscountTypes; 

IF OBJECT_ID('dbo.RecPlanStatus', 'U') IS NOT NULL 
  DROP TABLE dbo.RecPlanStatus; 

IF OBJECT_ID('dbo.Stocks', 'U') IS NOT NULL 
  DROP TABLE dbo.Stocks; 
  
IF OBJECT_ID('dbo.Regions', 'U') IS NOT NULL 
  DROP TABLE dbo.Regions; 


  CREATE TABLE [dbo].[Products]
(
	[ProductID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar] (50) NOT NULL,
	[Description] [varchar] (255) NOT NULL,
	[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_POrders_EntryAuthor] DEFAULT (suser_sname()),
	[EntryDate] [datetime] NOT NULL CONSTRAINT [DF_POrders_EntryDate] DEFAULT (getdate()),
	[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_POrders_LastAuthor] DEFAULT (suser_sname()),
	[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF_POrders_LastUpdate] DEFAULT (getdate()),
	CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED ([SupplierID])
)

  CREATE TABLE [dbo].[Suppliers]
(
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar] (50) NOT NULL,
	[Description] [varchar] (255) NOT NULL,
	[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_POrders_EntryAuthor] DEFAULT (suser_sname()),
	[EntryDate] [datetime] NOT NULL CONSTRAINT [DF_POrders_EntryDate] DEFAULT (getdate()),
	[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_POrders_LastAuthor] DEFAULT (suser_sname()),
	[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF_POrders_LastUpdate] DEFAULT (getdate()),
	CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED ([SupplierID])
)



CREATE TABLE [dbo].[SalesOrders]
(
	[SalesOrderID] [bigint] IDENTITY(1,1) NOT NULL,
    [SalesOrderStatusId] [int] NOT NULL,    
	[SupplierId] [int] NOT NULL,
	[ExpectedDate] [datetime] NULL,
	[CurrencyId] [char] (3) COLLATE Polish_CI_AS NOT NULL,
	[CurrencyRate] [decimal] (15, 5) NOT NULL DEFAULT ((1)),
	[StockId] [int],
	[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_POrders_EntryAuthor] DEFAULT (suser_sname()),
	[EntryDate] [datetime] NOT NULL CONSTRAINT [DF_POrders_EntryDate] DEFAULT (getdate()),
	[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_POrders_LastAuthor] DEFAULT (suser_sname()),
	[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF_POrders_LastUpdate] DEFAULT (getdate()),
	CONSTRAINT [PK_SalesOrders] PRIMARY KEY CLUSTERED ([SalesOrderId])
)
ALTER TABLE [dbo].[SalesOrders]  ADD CONSTRAINT FK_SalesOrders_SalesOrderStatus FOREIGN KEY ([SalesOrderStatusId])  REFERENCES [dbo].[SalesOrderStatus] ([SalesOrderStatusId]) 
ALTER TABLE [dbo].[SalesOrders]  ADD CONSTRAINT FK_SalesOrders_Stocks FOREIGN KEY ([StockId])  REFERENCES [dbo].[Stocks] ([StockId]) 


CREATE TABLE [dbo].[SalesOrderLines]
(
	[SalesOrderID] int NOT NULL,
	[SalesOrderLineNo] int NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[OrderedQty] int NOT NULL,
	[RecivedQty] int NULL,
	[PriceTypeId] int NOT NULL,
	[SalesOrderPrice] [decimal] (15, 5) NOT NULL DEFAULT ((1)),
	[ExpectedDate] [datetime] NULL,
	[DeliveryDate] [datetime] NULL,
	[DiscountTypeId] int NOT NULL  DEFAULT ((1)),
	[DiscountValue] int NULL,
	[DiscountPercent] int NULL,
	[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_POrders_EntryAuthor] DEFAULT (suser_sname()),
	[EntryDate] [datetime] NOT NULL CONSTRAINT [DF_POrders_EntryDate] DEFAULT (getdate()),
	[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_POrders_LastAuthor] DEFAULT (suser_sname()),
	[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF_POrders_LastUpdate] DEFAULT (getdate())
)
ALTER TABLE [dbo].[SalesOrderLines] ADD CONSTRAINT [PK_POrderLine] PRIMARY KEY CLUSTERED ([SalesOrderID], [SalesOrderLineNo])
ALTER TABLE [dbo].[SalesOrderLines] ADD CONSTRAINT FK_SalesOrderLines_DiscountTypes FOREIGN KEY ([DiscountTypeId])  REFERENCES [dbo].[DiscountTypes] ([DiscountTypeId]) 
ALTER TABLE [dbo].[SalesOrderLines]  ADD CONSTRAINT FK_SalesOrders_SalesOrderLines FOREIGN KEY ([SalesOrderID])  REFERENCES [dbo].[SalesOrders] ([SalesOrderID]) 


CREATE TABLE [dbo].[RecPlans]
(
[RecPlanID] [bigint] IDENTITY(1,1) NOT NULL,
[RecPlanStatusId] [int] NOT NULL, 
[SupplierId] [int] NOT NULL,
[ExpectedDate] [datetime] NULL,
[StockId] [int],
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_PRecPlans_EntryAuthor] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF_PRecPlans_EntryDate] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_PRecPlans_LastAuthor] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF_POrders_LastUpdate] DEFAULT (getdate()),
CONSTRAINT [PK_RecPlans] PRIMARY KEY CLUSTERED ([RecPlanId])
)
ALTER TABLE [dbo].[RecPlans] ADD CONSTRAINT FK_RecPlans_RecPlanStatusId FOREIGN KEY ([RecPlanID])  REFERENCES [dbo].[RecPlanStatus] ([RecPlanStatusId]) 



CREATE TABLE [dbo].[RecPlanLines]
(
[RecPlanID] int NOT NULL,
[RecPlanLineNo] int NOT NULL,
[SalesOrderID] int NOT NULL,
[SalesOrderLineNo] int NOT NULL,
[ExpectedQty] int NOT NULL,
[RecivedQty] int NULL,
[DeliveryDate] [datetime] NULL,
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_PRecPlans_EntryAuthor] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF_PRecPlans_EntryDate] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_PRecPlans_LastAuthor] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF_POrders_LastUpdate] DEFAULT (getdate()),
)
ALTER TABLE [dbo].[RecPlanLines] ADD CONSTRAINT [PK_RecPlanLines] PRIMARY KEY CLUSTERED ([RecPlanID], [RecPlanLineNo])
ALTER TABLE [dbo].[RecPlanLines] ADD CONSTRAINT FK_RecPlans_RecPlanLines FOREIGN KEY ([RecPlanID]) REFERENCES [dbo].[RecPlans] ([RecPlanID]) 
ALTER TABLE [dbo].[RecPlanLines] ADD CONSTRAINT FK_SalesOrderLines_RecPlanLines FOREIGN KEY ([SalesOrderID],[SalesOrderLineNo]) REFERENCES [dbo].[SalesOrderLines] ([SalesOrderID], [SalesOrderLineNo]) 

CREATE TABLE [dbo].[SalesOrderStatus]
(
	[SalesOrderStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar] (32) NOT NULL, 
	[Description] [varchar] (255) NULL
)

CREATE TABLE [dbo].[DiscountTypes]
(
	[DiscountTypesID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar] (32) NOT NULL, 
	[Description] [varchar] (255) NULL
)

CREATE TABLE [dbo].[RecPlanStatus]
(
	[RecPlanStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar] (32) NOT NULL, 
	[Description] [varchar] (255) NULL
)

CREATE TABLE [dbo].[Regions]
(
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar] (32) NOT NULL, 
	[Description] [varchar] (255) NULL
)

CREATE TABLE [dbo].[Stocks]
(
	[StockID] [int] IDENTITY(1,1) NOT NULL,
	[RegionID] [int] NOT NULL,
	[Name] [varchar] (32) NOT NULL, 
	[Description] [varchar] (255) NULL
)
ALTER TABLE [dbo].[Stocks] ADD CONSTRAINT FK_Stocks_Regions FOREIGN KEY ([RegionID]) REFERENCES [dbo].[Regions] ([RegionID]) 

