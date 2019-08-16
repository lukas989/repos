CREATE TABLE [dbo].[ReceiptPlanLines] (
    [ReceiptPlanId]       INT          NOT NULL,
    [ReceiptPlanLineNo]   INT          NOT NULL,
    [PurchaseOrderId]     INT          NOT NULL,
    [PurchaseOrderLineNo] INT          NOT NULL,
    [ExpectedQty]         INT          NOT NULL,
    [RecivedQty]          INT          NOT NULL,
    [EntryAuthor]         VARCHAR (32) DEFAULT (suser_sname()) NOT NULL,
    [EntryDate]           DATETIME     DEFAULT (getdate()) NOT NULL,
    [LastAuthor]          VARCHAR (32) DEFAULT (suser_sname()) NOT NULL,
    [LastUpdate]          DATETIME     DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ReceiptPlanLines] PRIMARY KEY CLUSTERED ([ReceiptPlanId] ASC, [ReceiptPlanLineNo] ASC),
    CONSTRAINT [FK_PurchaseOrder_ReceiptPlanLines] FOREIGN KEY ([PurchaseOrderId]) REFERENCES [dbo].[PurchaseOrders] ([PurchaseOrderId]),
    CONSTRAINT [FK_ReceiptPlans_ReceiptPlanLines] FOREIGN KEY ([ReceiptPlanId]) REFERENCES [dbo].[ReceiptPlans] ([ReceiptPlanId])
);

