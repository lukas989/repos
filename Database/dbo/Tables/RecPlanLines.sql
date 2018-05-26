CREATE TABLE [dbo].[RecPlanLines]
(
[RecPlanId] INT NOT NULL,
[RecPlanLineNo] INT NOT NULL,
[SalesOrderId] INT NOT NULL,
[SalesOrderLineNo] INT NOT NULL,
[ExpectedQty] INT NOT NULL,
[RecivedQty] INT NULL,
[DeliveryDate] [DATETIME] NULL,
[EntryAuthor] [VARCHAR] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[EntryDate] [DATETIME] NOT NULL  DEFAULT (GETDATE()),
[LastAuthor] [VARCHAR] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[LastUpdate] [DATETIME] NOT NULL  DEFAULT (GETDATE()),
CONSTRAINT [PK_RecPlanLines] PRIMARY KEY CLUSTERED ([RecPlanId],[RecPlanLineNo]),
CONSTRAINT FK_RecPlans_RecPlanLines FOREIGN KEY ([RecPlanId])  REFERENCES RecPlans([RecPlanId]),
CONSTRAINT FK_SalesOrder_RecPlanLines FOREIGN KEY ([SalesOrderId])  REFERENCES SalesOrders([SalesOrderId])
)
GO
ALTER TABLE [dbo].[RecPlanLines] ADD CONSTRAINT FK_RecPlans_RecPlanLines FOREIGN KEY ([RecPlanID]) REFERENCES [dbo].[RecPlans] ([RecPlanID])
GO
ALTER TABLE [dbo].[RecPlanLines] ADD CONSTRAINT FK_SalesOrderLines_RecPlanLines FOREIGN KEY ([SalesOrderID],[SalesOrderLineNo]) REFERENCES [dbo].[SalesOrderLines] ([SalesOrderID], [SalesOrderLineNo])
GO
ALTER TABLE [dbo].[RecPlanLines] ADD CONSTRAINT [PK_RecPlanLines] PRIMARY KEY CLUSTERED ([RecPlanID], [RecPlanLineNo])