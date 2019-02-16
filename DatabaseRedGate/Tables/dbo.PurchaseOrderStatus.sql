CREATE TABLE [dbo].[PurchaseOrderStatus]
(
[PurchaseOrderStatusId] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (32) COLLATE Polish_CI_AS NOT NULL,
[Description] [varchar] (255) COLLATE Polish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PurchaseOrderStatus] ADD CONSTRAINT [PK_PurchaseOrderStatus] PRIMARY KEY CLUSTERED  ([PurchaseOrderStatusId]) ON [PRIMARY]
GO
