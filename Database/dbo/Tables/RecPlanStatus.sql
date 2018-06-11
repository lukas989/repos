CREATE TABLE [dbo].[RecPlanStatus]
(
	[RecPlanStatusId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (32) NOT NULL, 
	[Description] varchar (255) NULL,
	CONSTRAINT [PK_RecPlanStatus] PRIMARY KEY CLUSTERED ([RecPlanStatusId])
)