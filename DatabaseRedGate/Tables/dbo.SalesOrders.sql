CREATE TABLE [dbo].[SalesOrders]
(
[SalesOrderId] [int] NOT NULL IDENTITY(1, 1),
[SalesOrderStatusId] [int] NOT NULL,
[CustomerId] [int] NOT NULL,
[ExpectedDate] [datetime] NULL,
[CurrencyId] [char] (3) COLLATE Polish_CI_AS NOT NULL,
[CurrencyRate] [decimal] (15, 5) NOT NULL CONSTRAINT [DF__SalesOrde__Curre__7C4F7684] DEFAULT ((1)),
[StockId] [int] NOT NULL,
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__SalesOrde__Entry__7D439ABD] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF__SalesOrde__Entry__7E37BEF6] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__SalesOrde__LastA__7F2BE32F] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF__SalesOrde__LastU__00200768] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalesOrders] ADD CONSTRAINT [PK_SalesOrder] PRIMARY KEY CLUSTERED  ([SalesOrderId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalesOrders] ADD CONSTRAINT [FK_Customers_SalesOrder] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([CustomerId])
GO
