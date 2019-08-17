CREATE VIEW VSalesOrderLines 
AS
SELECT sol.SalesOrderId,
       sol.SalesOrderLineNo,
       sol.ProductId,
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