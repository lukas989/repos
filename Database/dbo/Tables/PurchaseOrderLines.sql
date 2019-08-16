CREATE TABLE [dbo].[PurchaseOrderLines] (
    [PurchaseOrderId]     INT             NOT NULL,
    [PurchaseOrderLineNo] INT             NOT NULL,
    [ProductId]           INT             NOT NULL,
    [OrderedQty]          INT             NOT NULL,
    [RecivedQty]          INT             NOT NULL,
    [PriceTypeId]         INT             NOT NULL,
    [PurchaseOrderPrice]  DECIMAL (15, 5) DEFAULT ((1)) NOT NULL,
    [ExpectedDate]        DATETIME        NULL,
    [DiscountTypeId]      INT             DEFAULT ((1)) NOT NULL,
    [DiscountValue]       INT             NULL,
    [EntryAuthor]         VARCHAR (32)    DEFAULT (suser_sname()) NOT NULL,
    [EntryDate]           DATETIME        DEFAULT (getdate()) NOT NULL,
    [LastAuthor]          VARCHAR (32)    DEFAULT (suser_sname()) NOT NULL,
    [LastUpdate]          DATETIME        DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_PurchaseOrderLines] PRIMARY KEY CLUSTERED ([PurchaseOrderId] ASC, [PurchaseOrderLineNo] ASC),
    CONSTRAINT [FK_Products_PurchaseOrderLines] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products] ([ProductId]),
    CONSTRAINT [FK_PurchaseOrders_PurchaseOrderLines] FOREIGN KEY ([PurchaseOrderId]) REFERENCES [dbo].[PurchaseOrders] ([PurchaseOrderId])
);

