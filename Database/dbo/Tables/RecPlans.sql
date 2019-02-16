CREATE TABLE [dbo].[RecPlans]
(
[RecPlanId] INT IDENTITY(1,1) NOT NULL,
[RecPlanStatusId] INT NOT NULL, 
[SupplierId] INT NOT NULL,
[ExpectedDate] datetime NULL,
[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[EntryDate] datetime NOT NULL  DEFAULT (GETDATE()),
[LastAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[LastUpdate] datetime NOT NULL  DEFAULT (GETDATE()),
CONSTRAINT [PK_RecPlans] PRIMARY KEY CLUSTERED ([RecPlanId]),
CONSTRAINT FK_Supplier_RecPlans FOREIGN KEY ([SupplierId])  REFERENCES Suppliers([SupplierId])
)