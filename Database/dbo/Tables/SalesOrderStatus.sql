CREATE TABLE [dbo].[SalesOrderStatus]
(
	[SalesOrderStatusId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (32) NOT NULL, 
	[Description] VARCHAR (255) NULL,
	CONSTRAINT [PK_SalesOrderStatus] PRIMARY KEY CLUSTERED ([SalesOrderStatusId]),
)