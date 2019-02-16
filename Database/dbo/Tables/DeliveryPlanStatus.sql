CREATE TABLE [dbo].[DeliveryPlanStatus]
(
	[DeliveryPlanStatusId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (32) NOT NULL, 
	[Description] varchar (255) NULL,
	CONSTRAINT [PK_DeliveryPlanStatus] PRIMARY KEY CLUSTERED ([DeliveryPlanStatusId])
)