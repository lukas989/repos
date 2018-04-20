CREATE TABLE [dbo].[RecPlanStatus]
(
	[RecPlanStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar] (32) NOT NULL, 
	[Description] [varchar] (255) NULL
)