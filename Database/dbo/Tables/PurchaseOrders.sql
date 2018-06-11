CREATE TABLE [dbo].[PurchaseOrders]
(
	[PurchaseOrderId] INT IDENTITY(1,1) NOT NULL,
    [PurchaseOrderStatusId] INT NOT NULL,    
	[SupplierId] INT NOT NULL,
	[ExpectedDate] datetime NULL,
	[CurrencyId] char (3)  NOT NULL,
	[CurrencyRate] decimal (15, 5) NOT NULL DEFAULT ((1)),
	[StockId] INT NOT NULL,
	[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (suser_sname()),
	[EntryDate] datetime NOT NULL  DEFAULT (getdate()),
	[LastAuthor] varchar (32)  NOT NULL  DEFAULT (suser_sname()),
	[LastUpdate] datetime NOT NULL  DEFAULT (getdate()),
	CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY CLUSTERED ([PurchaseOrderId]),
	CONSTRAINT FK_Supplier_PurchaseOrders FOREIGN KEY ([SupplierId])  REFERENCES Suppliers([SupplierId]),
	CONSTRAINT FK_Stock_PurchaseOrders FOREIGN KEY ([StockId])  REFERENCES Stocks([StockId])
    
)