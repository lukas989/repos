CREATE VIEW dbo.VSalesOrders
AS
SELECT top 1000 so.SalesOrderId,
                so.SalesOrderStatusId,
				sos.Name SalesOrderStatus,
                so.CustomerId,
                c.Name NameCustomer,
                c.FirstName FirstNameCustomer,
                c.LastName LastNameCustomer,
				(SELECT COUNT(*) FROM dbo.SalesOrderLines WHERE SalesOrderId = so.SalesOrderId) AS SalesOrderLines,
				(SELECT SUM(OrderedQty*PurchaseOrderPrice) FROM dbo.SalesOrderLines WHERE SalesOrderId = so.SalesOrderId) AS Price,
                so.ExpectedDate,
                so.CurrencyId,
                so.CurrencyRate,
                so.EntryAuthor,
                so.EntryDate,
                so.LastAuthor,
                so.LastUpdate,
                c.Description,
				so.WmsUpdate
				FROM dbo.SalesOrders so
LEFT JOIN dbo.Customers c ON c.CustomerId = so.CustomerId
LEFT JOIN  dbo.SalesOrderStatus sos ON sos.SalesOrderStatusId = so.SalesOrderStatusId