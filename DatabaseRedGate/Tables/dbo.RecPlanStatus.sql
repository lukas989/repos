CREATE TABLE [dbo].[RecPlanStatus]
(
[RecPlanStatusId] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (32) COLLATE Polish_CI_AS NOT NULL,
[Description] [varchar] (255) COLLATE Polish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecPlanStatus] ADD CONSTRAINT [PK_RecPlanStatus] PRIMARY KEY CLUSTERED  ([RecPlanStatusId]) ON [PRIMARY]
GO
