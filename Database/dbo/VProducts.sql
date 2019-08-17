CREATE VIEW [dbo].[VProducts]
	AS SELECT p.ProductId ,
              p.Name as Product,
              p.SupplierId ,
			  s.Name as Supplier,
              p.Description ,
			  (SELECT TOP 1 1 FROM ProductBarcodes WHERE ProductBarcodes.ProductId = p.ProductId) as IsBarcodeSet,
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

