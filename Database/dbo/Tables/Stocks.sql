CREATE TABLE [dbo].[Stocks]
(
	[StockId] INT IDENTITY(1,1) NOT NULL,
	[RegionId] INT NOT NULL,
	[Name] varchar (32) NOT NULL, 
	[Description] varchar (255) NULL,
	CONSTRAINT [PK_Stocks] PRIMARY KEY CLUSTERED ([StockId])
)