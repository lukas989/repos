﻿CREATE TABLE [dbo].[ReceiptPlans]
(
[ReceiptPlanId] INT IDENTITY(1,1) NOT NULL,
[ReceiptPlanStatusId] INT NOT NULL, 
[SupplierId] INT NOT NULL,
[ExpectedDate] datetime NULL,
[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[EntryDate] datetime NOT NULL  DEFAULT (GETDATE()),
[LastAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[LastUpdate] datetime NOT NULL  DEFAULT (GETDATE()),
CONSTRAINT [PK_ReceiptPlans] PRIMARY KEY CLUSTERED ([ReceiptPlanId]),
CONSTRAINT FK_Supplier_ReceiptPlans FOREIGN KEY ([SupplierId])  REFERENCES Suppliers([SupplierId])
)