CREATE TABLE [dbo].[Producers]
(
[ProducerId] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (50) COLLATE Polish_CI_AS NOT NULL,
[Description] [varchar] (255) COLLATE Polish_CI_AS NOT NULL,
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__Producers__Entry__5CD6CB2B] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF__Producers__Entry__5DCAEF64] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__Producers__LastA__5EBF139D] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF__Producers__LastU__5FB337D6] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Producers] ADD CONSTRAINT [PK_Producers] PRIMARY KEY CLUSTERED  ([ProducerId]) ON [PRIMARY]
GO
