CREATE TABLE [dbo].[SalesOrderLines]
(
[SalesOrderId] [int] NOT NULL,
[SalesOrderLineNo] [int] NOT NULL,
[ProductId] [int] NOT NULL,
[OrderedQty] [int] NOT NULL,
[RecivedQty] [int] NULL,
[PriceTypeId] [int] NOT NULL,
[PurchaseOrderPrice] [decimal] (15, 5) NOT NULL CONSTRAINT [DF__SalesOrde__Purch__76969D2E] DEFAULT ((1)),
[ExpectedDate] [datetime] NULL,
[DeliveryDate] [datetime] NULL,
[DiscountTypeId] [int] NOT NULL CONSTRAINT [DF__SalesOrde__Disco__778AC167] DEFAULT ((1)),
[DiscountValue] [int] NULL,
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__SalesOrde__Entry__787EE5A0] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF__SalesOrde__Entry__797309D9] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__SalesOrde__LastA__7A672E12] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF__SalesOrde__LastU__7B5B524B] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalesOrderLines] ADD CONSTRAINT [PK_SalesOrderLines] PRIMARY KEY CLUSTERED  ([SalesOrderId], [SalesOrderLineNo]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalesOrderLines] ADD CONSTRAINT [FK_DiscountTypes_SalesOrderLines] FOREIGN KEY ([DiscountTypeId]) REFERENCES [dbo].[DiscountTypes] ([DiscountTypeId])
GO
ALTER TABLE [dbo].[SalesOrderLines] ADD CONSTRAINT [FK_Products_SalesOrderLines] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products] ([ProductId])
GO
