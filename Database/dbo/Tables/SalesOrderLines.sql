CREATE TABLE [dbo].[SalesOrderLines]
(
	[SalesOrderId] int NOT NULL,
	[SalesOrderLineNo] int NOT NULL,
	[ProductId] INT NOT NULL,
	[OrderedQty] int NOT NULL,
	[RecivedQty] int NULL,
	[PurchaseOrderPrice] decimal (15, 5) NOT NULL DEFAULT ((1)),
	[ExpectedDate] datetime NULL,
	[DeliveryDate] datetime NULL,
	[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[EntryDate] datetime NOT NULL  DEFAULT (GETDATE()),
	[LastAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[LastUpdate] datetime NOT NULL  DEFAULT (GETDATE()),
	CONSTRAINT [PK_SalesOrderLines] PRIMARY KEY CLUSTERED ([SalesOrderId],[SalesOrderLineNo]),
	CONSTRAINT FK_SalesOrders_SalesOrderLines FOREIGN KEY ([SalesOrderId])  REFERENCES SalesOrders([SalesOrderId]),
	CONSTRAINT FK_Products_SalesOrderLines FOREIGN KEY ([ProductId])  REFERENCES Products([ProductId])
)