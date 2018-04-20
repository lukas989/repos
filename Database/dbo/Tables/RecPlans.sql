CREATE TABLE [dbo].[RecPlans]
(
[RecPlanID] [bigint] IDENTITY(1,1) PRIMARY KEY,
[RecPlanStatusID] [int] NOT NULL, 
[SupplierId] [int] NOT NULL,
[ExpectedDate] [datetime] NULL,
[StockId] [int],
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_PRecPlans_EntryAuthor] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF_PRecPlans_EntryDate] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_PRecPlans_LastAuthor] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF_PRecPlans_LastUpdate] DEFAULT (getdate()),
)
GO
ALTER TABLE [dbo].[RecPlans] ADD CONSTRAINT FK_RecPlans_RecPlanStatusId FOREIGN KEY ([RecPlanStatusID])  REFERENCES [dbo].[RecPlanStatus] ([RecPlanStatusID])