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
GO
ALTER TABLE [dbo].[SalesOrders]  ADD CONSTRAINT FK_SalesOrders_SalesOrderStatus FOREIGN KEY ([SalesOrderStatusId])  REFERENCES [dbo].[SalesOrderStatus] ([SalesOrderStatusId])
GO
ALTER TABLE [dbo].[SalesOrders]  ADD CONSTRAINT FK_SalesOrders_Stocks FOREIGN KEY ([StockId])  REFERENCES [dbo].[Stocks] ([StockId])