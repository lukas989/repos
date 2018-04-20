CREATE TABLE [dbo].[RecPlans]
(
[RecPlanID] [bigint] IDENTITY(1,1) NOT NULL,
[RecPlanStatusId] [int] NOT NULL, 
[SupplierId] [int] NOT NULL,
[ExpectedDate] [datetime] NULL,
[StockCode] [char] (2) NOT NULL,
[RegionId] [char] (2) NOT NULL,
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_PRecPlans_EntryAuthor] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF_PRecPlans_EntryDate] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_PRecPlans_LastAuthor] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF_POrders_LastUpdate] DEFAULT (getdate()),
CONSTRAINT [PK_RecPlans] PRIMARY KEY CLUSTERED ([RecPlanId])
)