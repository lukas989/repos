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
GO
ALTER TABLE [dbo].[SalesOrderLines] ADD CONSTRAINT [PK_POrderLine] PRIMARY KEY CLUSTERED ([SalesOrderID], [SalesOrderLineNo])
GO
ALTER TABLE [dbo].[SalesOrderLines]  ADD CONSTRAINT FK_SalesOrders_SalesOrderLines FOREIGN KEY ([SalesOrderID])  REFERENCES [dbo].[SalesOrders] ([SalesOrderID])
GO
ALTER TABLE [dbo].[SalesOrderLines] ADD CONSTRAINT FK_SalesOrderLines_DiscountTypes FOREIGN KEY ([DiscountTypeId])  REFERENCES [dbo].[DiscountTypes] ([DiscountTypeId])