CREATE VIEW [dbo].[VProducts]
	AS SELECT 'P' + CAST(p.ProductId AS VARCHAR(10)) AS VProductId,
			  p.ProductId ,
              p.Name as Product,
			  'S' + CAST(p.SupplierId AS VARCHAR(10)) AS VSupplierId,
              p.SupplierId ,
			  s.Name as Supplier,
              p.Description ,
              p.Weight ,
              p.Height ,
              p.Width ,
              p.Depth ,
              p.EntryAuthor ,
              p.EntryDate ,
              p.LastAuthor ,
              p.LastUpdate,
			  p.WmsUpdate
	from Products p
	LEFT JOIN Suppliers s on p.SupplierId = s.SupplierId

