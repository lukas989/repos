CREATE TABLE [dbo].[DiscountTypes]
(
	[DiscountTypeId] [int] IDENTITY(1,1) PRIMARY KEY,
	[Name] [varchar] (32) NOT NULL, 
	[Description] [varchar] (255) NULL
)