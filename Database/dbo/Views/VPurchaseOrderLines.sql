CREATE view dbo.VPurchaseOrderLines
as
SELECT pol.PurchaseOrderId,
       pol.PurchaseOrderLineNo,
       pol.ProductId,
	   p.Name AS ProductName,
	   p.SupplierId,
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