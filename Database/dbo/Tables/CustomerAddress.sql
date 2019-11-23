

--CONSTRAINT FK_ReceiptPlanLines_PurchaseOrderLines FOREIGN KEY ([PurchaseOrderId],[PurchaseOrderLineNo])  REFERENCES ReceiptPlanLines([PurchaseOrderId],[PurchaseOrderLineNo])

--