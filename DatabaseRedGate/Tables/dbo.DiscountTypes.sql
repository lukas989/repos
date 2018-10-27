CREATE TABLE [dbo].[DiscountTypes]
(
[DiscountTypeId] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (32) COLLATE Polish_CI_AS NOT NULL,
[Description] [varchar] (255) COLLATE Polish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DiscountTypes] ADD CONSTRAINT [PK_DiscountTypes] PRIMARY KEY CLUSTERED  ([DiscountTypeId]) ON [PRIMARY]
GO
