CREATE TABLE [dbo].[PurchaseOrderStatus]
(
	[PurchaseOrderStatusId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (32) NOT NULL, 
	[Description] varchar (255) NULL,
	CONSTRAINT [PK_PurchaseOrderStatus] PRIMARY KEY CLUSTERED ([PurchaseOrderStatusId]),
	--CONSTRAINT FK_PurchaseOrder_PurchaseOrderStatus FOREIGN KEY ([PurchaseOrderStatusId])  REFERENCES PurchaseOrders([PurchaseOrderStatusId])
)