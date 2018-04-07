﻿

IF OBJECT_ID('dbo.SalesOrderLines', 'U') IS NOT NULL 
  DROP TABLE dbo.SalesOrderLines; 

IF OBJECT_ID('dbo.SalesOrders', 'U') IS NOT NULL 
  DROP TABLE dbo.SalesOrders; 

CREATE TABLE [dbo].[SalesOrders]
(
	[SalesOrderID] [bigint] IDENTITY(1,1) NOT NULL,
    [Cono] [int] NOT NULL,
    [SalesOrderStatusId] [int] NOT NULL,    
	[SupplierId] [int] NOT NULL,
	[ExpectedDate] [datetime] NULL,
	[CurrencyId] [char] (3) COLLATE Polish_CI_AS NOT NULL,
	[CurrencyRate] [decimal] (15, 5) NOT NULL DEFAULT ((1)),
	[StockCode] [char] (2) NOT NULL,
	[RegionId] [char] (2) NOT NULL,
	[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_POrders_EntryAuthor] DEFAULT (suser_sname()),
	[EntryDate] [datetime] NOT NULL CONSTRAINT [DF_POrders_EntryDate] DEFAULT (getdate()),
	[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_POrders_LastAuthor] DEFAULT (suser_sname()),
	[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF_POrders_LastUpdate] DEFAULT (getdate()),
	CONSTRAINT [PK_SalesOrders] PRIMARY KEY CLUSTERED ([SalesOrderId])
)



CREATE TABLE [dbo].[SalesOrderLines]
(
	[SalesOrderID] int NOT NULL,
	[SalesOrderLineNo] int NOT NULL,
    [Cono] [int] NOT NULL,
    [SalesOrderStatusId] [int] NOT NULL,    
	[PartNumber] [varchar] (15),
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