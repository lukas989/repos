CREATE TABLE [dbo].[Stocks]
(
	[StockId] [INT] IDENTITY(1,1) NOT NULL,
	[RegionId] [INT] NOT NULL,
	[Name] [VARCHAR] (32) NOT NULL, 
	[Description] [VARCHAR] (255) NULL,
	CONSTRAINT [PK_Stocks] PRIMARY KEY CLUSTERED ([StockId])
)
GO
ALTER TABLE [dbo].[Stocks] ADD CONSTRAINT FK_Stocks_Regions FOREIGN KEY ([RegionID]) REFERENCES [dbo].[Regions] ([RegionID])