CREATE TABLE [dbo].[RecPlanLines]
(
[RecPlanID] int NOT NULL,
[RecPlanLineNo] int NOT NULL,
[SalesOrderID] int NOT NULL,
[SalesOrderLineNo] int NOT NULL,
[ExpectedQty] int NOT NULL,
[RecivedQty] int NULL,
[DeliveryDate] [datetime] NULL,
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_PRecPlans_EntryAuthor] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF_PRecPlans_EntryDate] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_PRecPlans_LastAuthor] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF_POrders_LastUpdate] DEFAULT (getdate()),
)
GO
ALTER TABLE [dbo].[RecPlanLines] ADD CONSTRAINT FK_RecPlans_RecPlanLines FOREIGN KEY ([RecPlanID]) REFERENCES [dbo].[RecPlans] ([RecPlanID])
GO
ALTER TABLE [dbo].[RecPlanLines] ADD CONSTRAINT FK_SalesOrderLines_RecPlanLines FOREIGN KEY ([SalesOrderID],[SalesOrderLineNo]) REFERENCES [dbo].[SalesOrderLines] ([SalesOrderID], [SalesOrderLineNo])
GO
ALTER TABLE [dbo].[RecPlanLines] ADD CONSTRAINT [PK_RecPlanLines] PRIMARY KEY CLUSTERED ([RecPlanID], [RecPlanLineNo])