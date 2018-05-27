--CONSTRAINT FK_RecPlanLines_PurchaseOrderLines FOREIGN KEY ([PurchaseOrderId],[PurchaseOrderLineNo])  REFERENCES RecPlanLines([PurchaseOrderId],[PurchaseOrderLineNo])

--CONSTRAINT FK_RecPlanLines_PurchaseOrderLines FOREIGN KEY ([PurchaseOrderId],[PurchaseOrderLineNo])  REFERENCES RecPlanLines([PurchaseOrderId],[PurchaseOrderLineNo])

CREATE TABLE [dbo].[CustomerAddressTypes]
(
	[CustomerAddressTypeId] [INT] IDENTITY(1,1) NOT NULL,
	[Name] [VARCHAR] (32) NOT NULL, 
	[Description] [VARCHAR] (255) NULL,
	CONSTRAINT [PK_CustomerAddressTypes] PRIMARY KEY CLUSTERED ([CustomerAddressTypeId]),
	--CONSTRAINT FK_PurchaseOrder_PurchaseOrderStatus FOREIGN KEY ([PurchaseOrderStatusId])  REFERENCES PurchaseOrders([PurchaseOrderStatusId])
)