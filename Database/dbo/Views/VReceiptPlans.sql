CREATE VIEW dbo.VReceiptPlans
AS 
SELECT rp.ReceiptPlanId,
       rps.Name ReceiptPlanStatus,
       s.Name Supplier,
	   (SELECT COUNT(DISTINCT rpl.PurchaseOrderId) FROM dbo.ReceiptPlanLines rpl WHERE rpl.ReceiptPlanId =rp.ReceiptPlanId) Orders,
	   (SELECT COUNT(*) FROM dbo.ReceiptPlanLines rpl WHERE rpl.ReceiptPlanId =rp.ReceiptPlanId) Lines,
       rp.ExpectedDate,
       rp.EntryAuthor,
       rp.EntryDate,
       rp.LastAuthor,
       rp.LastUpdate
	   FROM dbo.ReceiptPlans rp
LEFT JOIN dbo.ReceiptPlanStatus rps ON rps.ReceiptPlanStatusId = rp.ReceiptPlanStatusId
LEFT JOIN dbo.Suppliers s ON s.SupplierId = rp.SupplierId