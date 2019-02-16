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
	[DiscountTypeId] INT NOT NULL  DEFAULT ((1)),
	[DiscountValue] INT NULL,
	[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[EntryDate] datetime NOT NULL  DEFAULT (GETDATE()),
	[LastAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[LastUpdate] datetime NOT NULL  DEFAULT (GETDATE()),
	CONSTRAINT [PK_PurchaseOrderLines] PRIMARY KEY CLUSTERED ([PurchaseOrderId],[PurchaseOrderLineNo]),
	CONSTRAINT FK_PurchaseOrders_PurchaseOrderLines FOREIGN KEY ([PurchaseOrderId])  REFERENCES PurchaseOrders([PurchaseOrderId]),
	CONSTRAINT FK_Products_PurchaseOrderLines FOREIGN KEY ([ProductId])  REFERENCES Products([ProductId])
	

	
)