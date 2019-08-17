CREATE TABLE [dbo].[SalesOrderLines] (
    [SalesOrderId]       INT             NOT NULL,
    [SalesOrderLineNo]   INT             NOT NULL,
    [ProductId]          INT             NOT NULL,
    [OrderedQty]         INT             NOT NULL,
    [RecivedQty]         INT             NOT NULL,
    [PurchaseOrderPrice] DECIMAL (15, 5) DEFAULT ((1)) NOT NULL,
    [ExpectedDate]       DATETIME        NULL,
    [DeliveryDate]       DATETIME        NULL,
    [EntryAuthor]        VARCHAR (32)    DEFAULT (suser_sname()) NOT NULL,
    [EntryDate]          DATETIME        DEFAULT (getdate()) NOT NULL,
    [LastAuthor]         VARCHAR (32)    DEFAULT (suser_sname()) NOT NULL,
    [LastUpdate]         DATETIME        DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SalesOrderLines] PRIMARY KEY CLUSTERED ([SalesOrderId] ASC, [SalesOrderLineNo] ASC),
    CONSTRAINT [FK_Products_SalesOrderLines] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products] ([ProductId]),
    CONSTRAINT [FK_SalesOrders_SalesOrderLines] FOREIGN KEY ([SalesOrderId]) REFERENCES [dbo].[SalesOrders] ([SalesOrderId])
);

