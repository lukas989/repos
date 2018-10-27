CREATE TABLE [dbo].[Stocks]
(
[StockId] [int] NOT NULL IDENTITY(1, 1),
[RegionId] [int] NOT NULL,
[Name] [varchar] (32) COLLATE Polish_CI_AS NOT NULL,
[Description] [varchar] (255) COLLATE Polish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Stocks] ADD CONSTRAINT [PK_Stocks] PRIMARY KEY CLUSTERED  ([StockId]) ON [PRIMARY]
GO
