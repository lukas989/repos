create view dbo.VPurchaseOrders
as
SELECT top 1000 po.PurchaseOrderId ,
                po.PurchaseOrderStatusId ,
				pos.Name PurchaseOrderStatus,
                po.SupplierId ,
				s.Name Supplier,
				(SELECT count(*) FROM dbo.PurchaseOrderLines pol where pol.PurchaseOrderId = po.PurchaseOrderId) as Line,
	            po.ExpectedDate ,
                po.CurrencyId ,
                po.CurrencyRate ,
                po.EntryAuthor ,
                po.EntryDate ,
                po.LastAuthor ,
                po.LastUpdate
FROM PurchaseOrders po
left join dbo.PurchaseOrderStatus pos on pos.PurchaseOrderStatusId = po.PurchaseOrderStatusId
left JOIN dbo.Suppliers s on s.SupplierId = po.SupplierId
