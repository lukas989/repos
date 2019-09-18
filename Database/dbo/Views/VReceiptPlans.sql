CREATE VIEW dbo.VReceiptPlans
AS 
SELECT rp.ReceiptPlanId,
		'RP' + CAST(rp.ReceiptPlanId AS VARCHAR(10)) AS VReceiptPlanId,
       rps.Name ReceiptPlanStatus,
       s.Name Supplier,
	   'S' + CAST(s.SupplierId AS VARCHAR(10)) AS VSupplierId,
	   (SELECT COUNT(DISTINCT rpl.PurchaseOrderId) FROM dbo.ReceiptPlanLines rpl WHERE rpl.ReceiptPlanId =rp.ReceiptPlanId) Orders,
	   (SELECT COUNT(*) FROM dbo.ReceiptPlanLines rpl WHERE rpl.ReceiptPlanId =rp.ReceiptPlanId) Lines,
       rp.ExpectedDate,
       rp.EntryAuthor,
       rp.EntryDate,
       rp.LastAuthor,
       rp.LastUpdate,
       rp.WmsUpdate
	   FROM dbo.ReceiptPlans rp
LEFT JOIN dbo.ReceiptPlanStatus rps ON rps.ReceiptPlanStatusId = rp.ReceiptPlanStatusId
LEFT JOIN dbo.Suppliers s ON s.SupplierId = rp.SupplierId