CREATE TABLE [dbo].[CustomerAddressTypes]
(
[CustomerAddressTypeId] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (32) COLLATE Polish_CI_AS NOT NULL,
[Description] [varchar] (255) COLLATE Polish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerAddressTypes] ADD CONSTRAINT [PK_CustomerAddressTypes] PRIMARY KEY CLUSTERED  ([CustomerAddressTypeId]) ON [PRIMARY]
GO
