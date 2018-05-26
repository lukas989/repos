CREATE TABLE [dbo].[Regions]
(
	[RegionId] [INT] IDENTITY(1,1) NOT NULL,
	[Name] [VARCHAR] (32) NOT NULL, 
	[Description] [VARCHAR] (255) NULL,
	CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED ([RegionId])
)