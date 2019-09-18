CREATE view dbo.VPurchaseOrderLines
as
SELECT 'PO' + CAST(pol.PurchaseOrderId  AS VARCHAR(10)) AS VPurchaseOrderId,
	   pol.PurchaseOrderId,
       pol.PurchaseOrderLineNo,
       pol.ProductId,
	   'P' + CAST(pol.ProductId AS VARCHAR(10)) AS VProductId,
	   p.Name AS ProductName,
	   p.SupplierId,
	   'S' + CAST(p.SupplierId AS VARCHAR(10)) AS VSupplierId,
       pol.OrderedQty,
       pol.RecivedQty,
       pol.PriceTypeId,
       pol.PurchaseOrderPrice,
       pol.ExpectedDate,
       pol.DiscountTypeId,
       pol.DiscountValue,
       pol.EntryAuthor,
       pol.EntryDate,
       pol.LastAuthor,
       pol.LastUpdate
FROM dbo.PurchaseOrderLines pol 
LEFT JOIN dbo.Products p ON p.ProductId = pol.ProductId