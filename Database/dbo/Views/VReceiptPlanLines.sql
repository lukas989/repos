CREATE VIEW dbo.VReceiptPlanLines
AS 
SELECT rpl.ReceiptPlanId,
       rpl.ReceiptPlanLineNo,
	   p.Name AS Product,
       rpl.ExpectedQty,
       rpl.RecivedQty,
       rpl.PurchaseOrderId,
       rpl.PurchaseOrderLineNo,
       pol.OrderedQty,
       pol.RecivedQty AS OrderRecivedQty,
       rpl.EntryAuthor,
       rpl.EntryDate,
       rpl.LastAuthor,
       rpl.LastUpdate
FROM dbo.ReceiptPlanLines rpl
	   LEFT JOIN dbo.PurchaseOrderLines pol ON pol.PurchaseOrderId = rpl.PurchaseOrderId AND pol.PurchaseOrderLineNo = rpl.PurchaseOrderLineNo
	   LEFT JOIN dbo.Products p ON p.ProductId = pol.ProductId