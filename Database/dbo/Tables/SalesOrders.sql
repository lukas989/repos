CREATE TABLE [dbo].[SalesOrders] (
    [SalesOrderId]       INT             IDENTITY (1, 1) NOT NULL,
    [SalesOrderStatusId] INT             NOT NULL,
    [CustomerId]         INT             NOT NULL,
    [ExpectedDate]       DATETIME        NULL,
    [CurrencyId]         CHAR (3)        NOT NULL,
    [CurrencyRate]       DECIMAL (15, 5) DEFAULT ((1)) NOT NULL,
    [EntryAuthor]        VARCHAR (32)    DEFAULT (suser_sname()) NOT NULL,
    [EntryDate]          DATETIME        DEFAULT (getdate()) NOT NULL,
    [LastAuthor]         VARCHAR (32)    DEFAULT (suser_sname()) NOT NULL,
    [LastUpdate]         DATETIME        DEFAULT (getdate()) NOT NULL,
    [WmsUpdate]          DATETIME        NULL,
    CONSTRAINT [PK_SalesOrder] PRIMARY KEY CLUSTERED ([SalesOrderId] ASC),
    CONSTRAINT [FK_Customers_SalesOrder] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([CustomerId]),
    CONSTRAINT [FK_SalesOrderStatus_SalesOrder] FOREIGN KEY ([SalesOrderStatusId]) REFERENCES [dbo].[SalesOrderStatus] ([SalesOrderStatusId])
);

