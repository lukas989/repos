CREATE TABLE [dbo].[DeliveryPlanLines]
(
[DeliveryPlanId] INT NOT NULL,
[DeliveryPlanLineNo] INT NOT NULL,
[SalesOrderId] INT NOT NULL,
[SalesOrderLineNo] INT NOT NULL,
[ExpectedQty] INT NOT NULL,
[RecivedQty] INT NULL,
[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[EntryDate] datetime NOT NULL  DEFAULT (GETDATE()),
[LastAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[LastUpdate] datetime NOT NULL  DEFAULT (GETDATE()),
CONSTRAINT [PK_DeliveryPlanLines] PRIMARY KEY CLUSTERED ([DeliveryPlanId],[DeliveryPlanLineNo]),
CONSTRAINT FK_DeliveryPlans_DeliveryPlanLines FOREIGN KEY ([DeliveryPlanId])  REFERENCES DeliveryPlans([DeliveryPlanId]),
CONSTRAINT FK_SalesOrder_DeliveryPlanLines FOREIGN KEY ([SalesOrderId])  REFERENCES SalesOrders([SalesOrderId])
)