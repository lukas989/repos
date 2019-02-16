CREATE TABLE [dbo].[PurchaseOrderLines]
(
[PurchaseOrderId] [int] NOT NULL,
[PurchaseOrderLineNo] [int] NOT NULL,
[ProductId] [int] NOT NULL,
[OrderedQty] [int] NOT NULL,
[RecivedQty] [int] NULL,
[PriceTypeId] [int] NOT NULL,
[PurchaseOrderPrice] [decimal] (15, 5) NOT NULL CONSTRAINT [DF__PurchaseO__Purch__6477ECF3] DEFAULT ((1)),
[ExpectedDate] [datetime] NULL,
[DeliveryDate] [datetime] NULL,
[DiscountTypeId] [int] NOT NULL CONSTRAINT [DF__PurchaseO__Disco__656C112C] DEFAULT ((1)),
[DiscountValue] [int] NULL,
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__PurchaseO__Entry__66603565] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF__PurchaseO__Entry__6754599E] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__PurchaseO__LastA__68487DD7] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF__PurchaseO__LastU__693CA210] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PurchaseOrderLines] ADD CONSTRAINT [PK_PurchaseOrderLines] PRIMARY KEY CLUSTERED  ([PurchaseOrderId], [PurchaseOrderLineNo]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PurchaseOrderLines] ADD CONSTRAINT [FK_DiscountTypes_PurchaseOrderLines] FOREIGN KEY ([DiscountTypeId]) REFERENCES [dbo].[DiscountTypes] ([DiscountTypeId])
GO
ALTER TABLE [dbo].[PurchaseOrderLines] ADD CONSTRAINT [FK_Products_PurchaseOrderLines] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products] ([ProductId])
GO
