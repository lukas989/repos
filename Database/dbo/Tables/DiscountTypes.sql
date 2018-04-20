CREATE TABLE [dbo].[DiscountTypes]
(
	[DiscountTypesID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar] (32) NOT NULL, 
	[Description] [varchar] (255) NULL
)