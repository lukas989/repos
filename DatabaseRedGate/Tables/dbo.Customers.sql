CREATE TABLE [dbo].[Customers]
(
[CustomerId] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (200) COLLATE Polish_CI_AS NULL,
[FirstName] [varchar] (200) COLLATE Polish_CI_AS NULL,
[LastName] [varchar] (200) COLLATE Polish_CI_AS NULL,
[Description] [varchar] (1500) COLLATE Polish_CI_AS NULL,
[TaxNumber] [varchar] (20) COLLATE Polish_CI_AS NULL,
[Email] [varchar] (100) COLLATE Polish_CI_AS NOT NULL,
[NationalCourtRegister] [varchar] (20) COLLATE Polish_CI_AS NULL,
[IsBlocked] [bit] NOT NULL CONSTRAINT [DF__Customers__IsBlo__5812160E] DEFAULT ((0)),
[EntryAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__Customers__Entry__59063A47] DEFAULT (suser_sname()),
[EntryDate] [datetime] NOT NULL CONSTRAINT [DF__Customers__Entry__59FA5E80] DEFAULT (getdate()),
[LastAuthor] [varchar] (32) COLLATE Polish_CI_AS NOT NULL CONSTRAINT [DF__Customers__LastA__5AEE82B9] DEFAULT (suser_sname()),
[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF__Customers__LastU__5BE2A6F2] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers] ADD CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED  ([CustomerId]) ON [PRIMARY]
GO
