CREATE TABLE [dbo].[Products]
(
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar] (50) NOT NULL,
	[Description] [varchar] (255) NOT NULL,
	[EntryAuthor] [varchar] (32) NOT NULL DEFAULT (SUSER_SNAME()),
	[EntryDate] [DATETIME] NOT NULL DEFAULT (GETDATE()),
	[LastAuthor] [VARCHAR] (32) NOT NULL DEFAULT (suser_sname()),
	[LastUpdate] [datetime] NOT NULL  DEFAULT (getdate()),
	CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductId])
)