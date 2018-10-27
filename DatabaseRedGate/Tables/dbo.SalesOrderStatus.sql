CREATE TABLE [dbo].[SalesOrderStatus]
(
[SalesOrderStatusId] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (32) COLLATE Polish_CI_AS NOT NULL,
[Description] [varchar] (255) COLLATE Polish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalesOrderStatus] ADD CONSTRAINT [PK_SalesOrderStatus] PRIMARY KEY CLUSTERED  ([SalesOrderStatusId]) ON [PRIMARY]
GO
