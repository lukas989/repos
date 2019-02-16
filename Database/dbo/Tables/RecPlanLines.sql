CREATE TABLE [dbo].[RecPlanLines]
(
[RecPlanId] INT NOT NULL,
[RecPlanLineNo] INT NOT NULL,
[PurchaseOrderId] INT NOT NULL,
[PurchaseOrderLineNo] INT NOT NULL,
[ExpectedQty] INT NOT NULL,
[RecivedQty] INT NULL,
[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[EntryDate] datetime NOT NULL  DEFAULT (GETDATE()),
[LastAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[LastUpdate] datetime NOT NULL  DEFAULT (GETDATE()),
CONSTRAINT [PK_RecPlanLines] PRIMARY KEY CLUSTERED ([RecPlanId],[RecPlanLineNo]),
CONSTRAINT FK_RecPlans_RecPlanLines FOREIGN KEY ([RecPlanId])  REFERENCES RecPlans([RecPlanId]),
CONSTRAINT FK_PurchaseOrder_RecPlanLines FOREIGN KEY ([PurchaseOrderId])  REFERENCES PurchaseOrders([PurchaseOrderId])
)