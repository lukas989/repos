CREATE TABLE [dbo].[ReceiptPlanLines]
(
[ReceiptPlanId] INT NOT NULL,
[ReceiptPlanLineNo] INT NOT NULL,
[PurchaseOrderId] INT NOT NULL,
[PurchaseOrderLineNo] INT NOT NULL,
[ExpectedQty] INT NOT NULL,
[RecivedQty] INT NULL,
[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[EntryDate] datetime NOT NULL  DEFAULT (GETDATE()),
[LastAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[LastUpdate] datetime NOT NULL  DEFAULT (GETDATE()),
CONSTRAINT [PK_ReceiptPlanLines] PRIMARY KEY CLUSTERED ([ReceiptPlanId],[ReceiptPlanLineNo]),
CONSTRAINT FK_ReceiptPlans_ReceiptPlanLines FOREIGN KEY ([ReceiptPlanId])  REFERENCES ReceiptPlans([ReceiptPlanId]),
CONSTRAINT FK_PurchaseOrder_ReceiptPlanLines FOREIGN KEY ([PurchaseOrderId])  REFERENCES PurchaseOrders([PurchaseOrderId])
)