CREATE VIEW [dbo].[VSuppliers]
	AS SELECT 
	'S' + CAST(s.SupplierId AS VARCHAR(10)) AS VSupplierId,
			  s.SupplierId,
              s.Name,
              s.Description,
              s.EntryAuthor,
              s.EntryDate,
              s.LastAuthor,
              s.LastUpdate
	from Suppliers s