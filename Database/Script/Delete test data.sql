DELETE FROM dbo.ReceiptPlanLineConfirmWms
WHERE PartNumber IN (SELECT ProductId FROM dbo.Products WHERE Name LIKE '%test%')

DELETE  FROM dbo.ReceiptPlanLines WHERE ReceiptPlanId IN(
SELECT ReceiptPlanId FROM dbo.ReceiptPlans
WHERE SupplierId IN  (SELECT SupplierId FROM dbo.Suppliers WHERE Name LIKE '%test%')
)

DELETE  FROM dbo.ReceiptPlans
WHERE SupplierId IN  (SELECT SupplierId FROM dbo.Suppliers WHERE Name LIKE '%test%')


DELETE  FROM dbo.PurchaseOrderLines  WHERE PurchaseOrderId IN(
SELECT PurchaseOrderId FROM dbo.PurchaseOrders
WHERE SupplierId IN  (SELECT SupplierId FROM dbo.Suppliers WHERE Name LIKE '%test%')
)


DELETE  FROM dbo.PurchaseOrders 
WHERE SupplierId IN  (SELECT SupplierId FROM dbo.Suppliers WHERE Name LIKE '%test%')


DELETE FROM dbo.Products 
WHERE SupplierId IN  (SELECT SupplierId FROM dbo.Suppliers WHERE Name LIKE '%test%')

DELETE FROM dbo.Suppliers WHERE Name LIKE '%test%'


