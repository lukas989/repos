CREATE TABLE [dbo].[Stocks]
(
	[StockId] [INT] IDENTITY(1,1) NOT NULL,
	[RegionId] [INT] NOT NULL,
	[Name] [VARCHAR] (32) NOT NULL, 
	[Description] [VARCHAR] (255) NULL,
	CONSTRAINT [PK_Stocks] PRIMARY KEY CLUSTERED ([StockId]),
	CONSTRAINT [FK_Regions_Stocks] FOREIGN KEY ([RegionId])  REFERENCES Regions([RegionId])
)