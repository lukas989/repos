CREATE TABLE [dbo].[RecPlanStatus]
(
	[RecPlanStatusId] [INT] IDENTITY(1,1) NOT NULL,
	[Name] [VARCHAR] (32) NOT NULL, 
	[Description] [VARCHAR] (255) NULL,
	CONSTRAINT [PK_RecPlanStatus] PRIMARY KEY CLUSTERED ([RecPlanStatusId])
)