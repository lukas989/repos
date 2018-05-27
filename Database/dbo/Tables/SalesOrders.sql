CREATE TABLE [dbo].[SalesOrders]
(
	[SalesOrderId] [INT] IDENTITY(1,1) NOT NULL,
    [SalesOrderStatusId] [INT] NOT NULL,    
	[CustomerId] [INT] NOT NULL,
	[ExpectedDate] [DATETIME] NULL,
	[CurrencyId] [CHAR] (3)  NOT NULL,
	[CurrencyRate] [DECIMAL] (15, 5) NOT NULL DEFAULT ((1)),
	[StockId] [INT] NOT NULL,
	[EntryAuthor] [VARCHAR] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[EntryDate] [DATETIME] NOT NULL  DEFAULT (GETDATE()),
	[LastAuthor] [VARCHAR] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[LastUpdate] [DATETIME] NOT NULL  DEFAULT (GETDATE()),
	CONSTRAINT [PK_SalesOrder] PRIMARY KEY CLUSTERED ([SalesOrderId])    ,
	CONSTRAINT FK_Customers_SalesOrder FOREIGN KEY ([CustomerId])  REFERENCES Customers([CustomerId]),
	CONSTRAINT [FK_SalesOrders_SalesOrderStatus] FOREIGN KEY ([SalesOrderStatusId])  REFERENCES SalesOrderStatus([SalesOrderStatusId])
)