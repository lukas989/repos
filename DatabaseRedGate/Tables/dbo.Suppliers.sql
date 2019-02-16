CREATE TABLE [dbo].[Suppliers]
(
[SupplierId] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (50) COLLATE Polish_CI_AS NOT NULL,
[Description] [varchar] (255) COLLATE Polish_CI_AS NOT NULL,
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__Suppliers__Entry__01142BA1] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF__Suppliers__Entry__02084FDA] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__Suppliers__LastA__02FC7413] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF__Suppliers__LastU__03F0984C] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Suppliers] ADD CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED  ([SupplierId]) ON [PRIMARY]
GO
