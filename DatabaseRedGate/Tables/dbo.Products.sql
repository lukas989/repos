CREATE TABLE [dbo].[Products]
(
[ProductId] [int] NOT NULL IDENTITY(1, 1),
[ProducerId] [int] NOT NULL,
[SupplierId] [int] NOT NULL,
[Name] [varchar] (50) COLLATE Polish_CI_AS NOT NULL,
[Description] [varchar] (255) COLLATE Polish_CI_AS NOT NULL,
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__Products__EntryA__60A75C0F] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF__Products__EntryD__619B8048] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__Products__LastAu__628FA481] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF__Products__LastUp__6383C8BA] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED  ([ProductId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [FK_Producer_Products] FOREIGN KEY ([ProducerId]) REFERENCES [dbo].[Producers] ([ProducerId])
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [FK_Supplier_Products] FOREIGN KEY ([SupplierId]) REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
