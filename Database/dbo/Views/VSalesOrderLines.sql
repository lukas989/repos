CREATE VIEW VSalesOrderLines 
AS
SELECT sol.SalesOrderId,
	  'SO' + CAST(sol.SalesOrderId  AS VARCHAR(10)) AS VSalesOrderId,
       sol.SalesOrderLineNo,
       sol.ProductId,
	   'P' + CAST(p.ProductId AS VARCHAR(10)) AS VProductId,
	   p.Name AS ProductName,
       sol.OrderedQty,
       sol.RecivedQty,
       sol.PurchaseOrderPrice,
       sol.ExpectedDate,
       sol.DeliveryDate,
       sol.EntryAuthor,
       sol.EntryDate,
       sol.LastAuthor,
       sol.LastUpdate
	   FROM dbo.SalesOrderLines sol
LEFT JOIN dbo.Products p ON p.ProductId = sol.ProductId