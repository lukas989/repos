CREATE TABLE [dbo].[Customers]
(
	[CustomerId] [INT] IDENTITY(1,1) NOT NULL,
	[Name] [VARCHAR] (200) NULL,
	[FirstName] [VARCHAR] (200) NULL,
	[LastName] [VARCHAR] (200) NULL,
	[Description] [VARCHAR] (1500) NULL,
	[TaxNumber] [VARCHAR] (20) NULL,
	[Email] [VARCHAR] (100) NOT NULL,
	[NationalCourtRegister] [VARCHAR] (20) NULL,
	[IsBlocked] [BIT] NOT NULL DEFAULT 0, 
	[EntryAuthor] [VARCHAR] (32) NOT NULL DEFAULT (SUSER_SNAME()),
	[EntryDate] [DATETIME] NOT NULL DEFAULT (GETDATE()),
	[LastAuthor] [VARCHAR] (32) NOT NULL DEFAULT (SUSER_SNAME()),
	[LastUpdate] [DATETIME] NOT NULL DEFAULT (GETDATE()),
	CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerId])	
)