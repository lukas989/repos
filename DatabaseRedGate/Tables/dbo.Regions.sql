CREATE TABLE [dbo].[Regions]
(
[RegionId] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (32) COLLATE Polish_CI_AS NOT NULL,
[Description] [varchar] (255) COLLATE Polish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Regions] ADD CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED  ([RegionId]) ON [PRIMARY]
GO
