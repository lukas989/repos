CREATE TABLE [dbo].[Products]
(
	[ProductID] [bigint] IDENTITY(1,1) PRIMARY KEY,
	[Name] [varchar] (50) NOT NULL,
	[Description] [varchar] (255) NOT NULL,
	[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_PProducts_EntryAuthor] DEFAULT (suser_sname()),
	[EntryDate] [datetime] NOT NULL CONSTRAINT [DF_PProducts_EntryDate] DEFAULT (getdate()),
	[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF_PProducts_LastAuthor] DEFAULT (suser_sname()),
	[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF_PProducts_LastUpdate] DEFAULT (getdate())
)