CREATE TABLE [dbo].[PurchaseOrderLines]
(
	[PurchaseOrderId] int NOT NULL,
	[PurchaseOrderLineNo] int NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderedQty] int NOT NULL,
	[RecivedQty] int NULL,
	[PriceTypeId] int NOT NULL,
	[PurchaseOrderPrice] [decimal] (15, 5) NOT NULL DEFAULT ((1)),
	[ExpectedDate] [datetime] NULL,
	[DeliveryDate] [datetime] NULL,
	[DiscountTypeId] INT NOT NULL  DEFAULT ((1)),
	[DiscountValue] INT NULL,
	[EntryAuthor] [VARCHAR] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[EntryDate] [DATETIME] NOT NULL  DEFAULT (GETDATE()),
	[LastAuthor] [VARCHAR] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[LastUpdate] [DATETIME] NOT NULL  DEFAULT (GETDATE()),
	CONSTRAINT [PK_PurchaseOrderLines] PRIMARY KEY CLUSTERED ([PurchaseOrderId],[PurchaseOrderLineNo]),
	CONSTRAINT FK_Products_PurchaseOrderLines FOREIGN KEY ([ProductId])  REFERENCES Products([ProductId]),
	CONSTRAINT FK_DiscountTypes_PurchaseOrderLines FOREIGN KEY (DiscountTypeId)  REFERENCES DiscountTypes([DiscountTypeId]),
	

	
)