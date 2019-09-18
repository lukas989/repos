CREATE VIEW dbo.VReceiptPlanLines
AS 
SELECT rpl.ReceiptPlanId,
       'RP' + CAST(rpl.ReceiptPlanId AS VARCHAR(10)) AS VReceiptPlanId,
		rpl.ReceiptPlanLineNo,
		'P' + CAST(p.ProductId AS VARCHAR(10)) AS VProductId,
	   p.Name AS Product,
	   p.ProductId AS ProductId,
       rpl.ExpectedQty,
       rpl.RecivedQty,
	   rpl.PurchaseOrderId,
       'PO' + CAST(rpl.PurchaseOrderId AS VARCHAR(10)) AS VPurchaseOrderId,
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