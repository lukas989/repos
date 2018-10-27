CREATE TABLE [dbo].[CustomerAddress]
(
[CustomerAddressId] [int] NOT NULL IDENTITY(1, 1),
[CustomerId] [int] NOT NULL,
[CustomerAddressTypeId] [int] NOT NULL,
[Street] [varchar] (255) COLLATE Polish_CI_AS NOT NULL,
[City] [varchar] (255) COLLATE Polish_CI_AS NOT NULL,
[Zipcode] [varchar] (15) COLLATE Polish_CI_AS NOT NULL,
[Country] [varchar] (2) COLLATE Polish_CI_AS NOT NULL,
[Description] [varchar] (255) COLLATE Polish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerAddress] ADD CONSTRAINT [PK_CustomerAddress] PRIMARY KEY CLUSTERED  ([CustomerAddressId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerAddress] ADD CONSTRAINT [FK_Customers_CustomerAddress] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([CustomerId])
GO
