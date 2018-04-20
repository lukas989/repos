CREATE TABLE [dbo].[Stocks]
(
	[StockID] [int] IDENTITY(1,1) PRIMARY KEY,
	[RegionID] [int] NOT NULL,
	[Name] [varchar] (32) NOT NULL, 
	[Description] [varchar] (255) NULL
)
GO
ALTER TABLE [dbo].[Stocks] ADD CONSTRAINT FK_Stocks_Regions FOREIGN KEY ([RegionID]) REFERENCES [dbo].[Regions] ([RegionID])