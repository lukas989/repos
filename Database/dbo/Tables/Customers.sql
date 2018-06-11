CREATE TABLE [dbo].[Customers]
(
	[CustomerId] INT IDENTITY(1,1) NOT NULL,
	[Name] varchar (200) NULL,
	[FirstName] varchar (200) NULL,
	[LastName] varchar (200) NULL,
	[Description] varchar (1500) NULL,
	[TaxNumber] varchar (20) NULL,
	[Email] varchar (100) NOT NULL,
	[NationalCourtRegister] varchar (20) NULL,
	[IsBlocked] [BIT] NOT NULL DEFAULT 0, 
	[EntryAuthor] varchar (32) NOT NULL DEFAULT (SUSER_SNAME()),
	[EntryDate] datetime NOT NULL DEFAULT (GETDATE()),
	[LastAuthor] varchar (32) NOT NULL DEFAULT (SUSER_SNAME()),
	[LastUpdate] datetime NOT NULL DEFAULT (GETDATE()),
	CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerId])	
)