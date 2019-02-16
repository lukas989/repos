CREATE TABLE [dbo].[PurchaseOrders]
(
[PurchaseOrderId] [int] NOT NULL IDENTITY(1, 1),
[PurchaseOrderStatusId] [int] NOT NULL,
[SupplierId] [int] NOT NULL,
[ExpectedDate] [datetime] NULL,
[CurrencyId] [char] (3) COLLATE Polish_CI_AS NOT NULL,
[CurrencyRate] [decimal] (15, 5) NOT NULL CONSTRAINT [DF__PurchaseO__Curre__6A30C649] DEFAULT ((1)),
[StockId] [int] NOT NULL,
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__PurchaseO__Entry__6B24EA82] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF__PurchaseO__Entry__6C190EBB] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__PurchaseO__LastA__6D0D32F4] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF__PurchaseO__LastU__6E01572D] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY CLUSTERED  ([PurchaseOrderId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD CONSTRAINT [FK_Stock_PurchaseOrders] FOREIGN KEY ([StockId]) REFERENCES [dbo].[Stocks] ([StockId])
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD CONSTRAINT [FK_Supplier_PurchaseOrders] FOREIGN KEY ([SupplierId]) REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
