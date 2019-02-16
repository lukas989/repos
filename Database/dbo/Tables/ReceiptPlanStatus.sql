CREATE TABLE [dbo].[ReceiptPlanStatus]
(
	[ReceiptPlanStatusId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (32) NOT NULL, 
	[Description] varchar (255) NULL,
	CONSTRAINT [PK_ReceiptPlanStatus] PRIMARY KEY CLUSTERED ([ReceiptPlanStatusId])
)