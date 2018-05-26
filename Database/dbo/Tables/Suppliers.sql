CREATE TABLE [dbo].[Suppliers]
(
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar] (50) NOT NULL,
	[Description] [varchar] (255) NOT NULL,
	[EntryAuthor] [varchar] (32) NOT NULL DEFAULT (suser_sname()),
	[EntryDate] [datetime] NOT NULL DEFAULT (getdate()),
	[LastAuthor] [varchar] (32) NOT NULL DEFAULT (suser_sname()),
	[LastUpdate] [datetime] NOT NULL  DEFAULT (getdate()),
	CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED ([SupplierId])
)