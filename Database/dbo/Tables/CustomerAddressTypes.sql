--CONSTRAINT FK_ReceiptPlanLines_PurchaseOrderLines FOREIGN KEY ([PurchaseOrderId],[PurchaseOrderLineNo])  REFERENCES ReceiptPlanLines([PurchaseOrderId],[PurchaseOrderLineNo])

--CONSTRAINT FK_ReceiptPlanLines_PurchaseOrderLines FOREIGN KEY ([PurchaseOrderId],[PurchaseOrderLineNo])  REFERENCES ReceiptPlanLines([PurchaseOrderId],[PurchaseOrderLineNo])

--CONSTRAINT FK_ReceiptPlanLines_PurchaseOrderLines FOREIGN KEY ([PurchaseOrderId],[PurchaseOrderLineNo])  REFERENCES ReceiptPlanLines([PurchaseOrderId],[PurchaseOrderLineNo])

--CONSTRAINT FK_ReceiptPlanLines_PurchaseOrderLines FOREIGN KEY ([PurchaseOrderId],[PurchaseOrderLineNo])  REFERENCES ReceiptPlanLines([PurchaseOrderId],[PurchaseOrderLineNo])

--CONSTRAINT FK_ReceiptPlanLines_PurchaseOrderLines FOREIGN KEY ([PurchaseOrderId],[PurchaseOrderLineNo])  REFERENCES ReceiptPlanLines([PurchaseOrderId],[PurchaseOrderLineNo])

CREATE TABLE [dbo].[CustomerAddressTypes]
(
	[CustomerAddressTypeId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (32) NOT NULL, 
	[Description] varchar (255) NULL,
	CONSTRAINT [PK_CustomerAddressTypes] PRIMARY KEY CLUSTERED ([CustomerAddressTypeId]),
	--CONSTRAINT FK_PurchaseOrder_PurchaseOrderStatus FOREIGN KEY ([PurchaseOrderStatusId])  REFERENCES PurchaseOrders([PurchaseOrderStatusId])
)