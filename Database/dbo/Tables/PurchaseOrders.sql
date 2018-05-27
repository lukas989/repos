CREATE TABLE [dbo].[PurchaseOrders]
(
	[PurchaseOrderId] [int] IDENTITY(1,1) NOT NULL,
    [PurchaseOrderStatusId] [int] NOT NULL,    
	[SupplierId] [int] NOT NULL,
	[ExpectedDate] [datetime] NULL,
	[CurrencyId] [char] (3)  NOT NULL,
	[CurrencyRate] [decimal] (15, 5) NOT NULL DEFAULT ((1)),
	[StockId] [INT] NOT NULL,
	[EntryAuthor] [varchar] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[EntryDate] [datetime] NOT NULL  DEFAULT (GETDATE()),
	[LastAuthor] [varchar] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
	[LastUpdate] [datetime] NOT NULL  DEFAULT (GETDATE()),
	CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY CLUSTERED ([PurchaseOrderId]),
	CONSTRAINT FK_Supplier_PurchaseOrders FOREIGN KEY ([SupplierId])  REFERENCES Suppliers([SupplierId]),
	CONSTRAINT FK_Stock_PurchaseOrders FOREIGN KEY ([StockId])  REFERENCES Stocks([StockId]),
    CONSTRAINT FK_PurchaseOrderStatus_PurchaseOrders FOREIGN KEY ([PurchaseOrderStatusId])  REFERENCES [dbo].[PurchaseOrderStatus]([PurchaseOrderStatusId])
)