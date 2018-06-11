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