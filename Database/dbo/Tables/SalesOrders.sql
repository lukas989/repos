CREATE TABLE [dbo].[SalesOrders]
(
	[SalesOrderID] [bigint] IDENTITY(1,1) PRIMARY KEY,
    [SalesOrderStatusId] [int] NOT NULL,    
	[SupplierId] [int] NOT NULL,
	[ExpectedDate] [datetime] NULL,
	[CurrencyId] [char] (3) COLLATE Polish_CI_AS NOT NULL,
	[CurrencyRate] [decimal] (15, 5) NOT NULL DEFAULT ((1)),
	[StockId] [int],
	[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_PSalesOrders_EntryAuthor] DEFAULT (suser_sname()),
	[EntryDate] [datetime] NOT NULL CONSTRAINT [DF_PSalesOrders_EntryDate] DEFAULT (getdate()),
	[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_PSalesOrders_LastAuthor] DEFAULT (suser_sname()),
	[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF_PSalesOrders_LastUpdate] DEFAULT (getdate())
)
GO
ALTER TABLE [dbo].[SalesOrders]  ADD CONSTRAINT FK_SalesOrders_SalesOrderStatus FOREIGN KEY ([SalesOrderStatusId])  REFERENCES [dbo].[SalesOrderStatus] ([SalesOrderStatusId])
GO
ALTER TABLE [dbo].[SalesOrders]  ADD CONSTRAINT FK_SalesOrders_Stocks FOREIGN KEY ([StockId])  REFERENCES [dbo].[Stocks] ([StockId])