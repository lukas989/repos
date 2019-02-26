CREATE TABLE [dbo].[ProductBarcodes]
(
	[ProductId] INT NOT NULL,
	[BarCode] [varchar] (50) NOT NULL,
	[BarCodeType] [varchar] (6) NOT NULL,
	[EntryAuthor] varchar (32) NOT NULL DEFAULT (SUSER_SNAME()),
	[EntryDate] datetime NOT NULL DEFAULT (GETDATE()),
	[LastAuthor] varchar (32) NOT NULL DEFAULT (suser_sname()),
	[LastUpdate] datetime NOT NULL  DEFAULT (getdate()),
	CONSTRAINT [PK_ProductBarcodes] PRIMARY KEY CLUSTERED ([ProductId], [BarCode], [BarCodeType]),
	CONSTRAINT FK_Products_ProductBarcodes FOREIGN KEY ([ProductId])  REFERENCES Products([ProductId]),
)