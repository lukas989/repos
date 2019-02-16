CREATE TABLE [dbo].[RecPlans]
(
[RecPlanId] [int] NOT NULL IDENTITY(1, 1),
[RecPlanStatusId] [int] NOT NULL,
[SupplierId] [int] NOT NULL,
[ExpectedDate] [datetime] NULL,
[StockId] [int] NOT NULL,
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__RecPlans__EntryA__72C60C4A] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF__RecPlans__EntryD__73BA3083] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__RecPlans__LastAu__74AE54BC] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF__RecPlans__LastUp__75A278F5] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecPlans] ADD CONSTRAINT [PK_RecPlans] PRIMARY KEY CLUSTERED  ([RecPlanId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecPlans] ADD CONSTRAINT [FK_Stock_RecPlans] FOREIGN KEY ([StockId]) REFERENCES [dbo].[Stocks] ([StockId])
GO
ALTER TABLE [dbo].[RecPlans] ADD CONSTRAINT [FK_Supplier_RecPlans] FOREIGN KEY ([SupplierId]) REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
