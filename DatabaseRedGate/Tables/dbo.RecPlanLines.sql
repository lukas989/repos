CREATE TABLE [dbo].[RecPlanLines]
(
[RecPlanId] [int] NOT NULL,
[RecPlanLineNo] [int] NOT NULL,
[PurchaseOrderId] [int] NOT NULL,
[PurchaseOrderLineNo] [int] NOT NULL,
[ExpectedQty] [int] NOT NULL,
[RecivedQty] [int] NULL,
[DeliveryDate] [datetime] NULL,
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__RecPlanLi__Entry__6EF57B66] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF__RecPlanLi__Entry__6FE99F9F] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__RecPlanLi__LastA__70DDC3D8] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF__RecPlanLi__LastU__71D1E811] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecPlanLines] ADD CONSTRAINT [PK_RecPlanLines] PRIMARY KEY CLUSTERED  ([RecPlanId], [RecPlanLineNo]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecPlanLines] ADD CONSTRAINT [FK_PurchaseOrder_RecPlanLines] FOREIGN KEY ([PurchaseOrderId]) REFERENCES [dbo].[PurchaseOrders] ([PurchaseOrderId])
GO
ALTER TABLE [dbo].[RecPlanLines] ADD CONSTRAINT [FK_RecPlans_RecPlanLines] FOREIGN KEY ([RecPlanId]) REFERENCES [dbo].[RecPlans] ([RecPlanId])
GO
