SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create view [dbo].[ProductsView]
as
select
	pe.ProducerId ,
	pe.Name as Producer, 
	s.SupplierId,
	s.Name as Supplier, 
	p.ProductId, 
	p.Name as Product,
	p.Description ,
	p.EntryAuthor ,
	p.EntryDate ,
	p.LastAuthor ,
	p.LastUpdate 
from dbo.Products p
left JOIN dbo.Producers pe on pe.ProducerId = p.ProducerId
left JOIN dbo.Suppliers s on s.SupplierId = p.SupplierId
GO
