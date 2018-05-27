CREATE TABLE [dbo].[PurchaseOrderStatus]
(
	[PurchaseOrderStatusId] [INT] IDENTITY(1,1) NOT NULL,
	[Name] [VARCHAR] (32) NOT NULL, 
	[Description] [VARCHAR] (255) NULL,
	CONSTRAINT [PK_PurchaseOrderStatus] PRIMARY KEY CLUSTERED ([PurchaseOrderStatusId])
)