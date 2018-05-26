CREATE TABLE [dbo].[RecPlans]
(
[RecPlanId] [int] IDENTITY(1,1) NOT NULL,
[RecPlanStatusId] [INT] NOT NULL, 
[SupplierId] [INT] NOT NULL,
[ExpectedDate] [DATETIME] NULL,
[StockId] [INT] not null,
[EntryAuthor] [VARCHAR] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[EntryDate] [DATETIME] NOT NULL  DEFAULT (GETDATE()),
[LastAuthor] [VARCHAR] (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[LastUpdate] [DATETIME] NOT NULL  DEFAULT (GETDATE()),
CONSTRAINT [PK_RecPlans] PRIMARY KEY CLUSTERED ([RecPlanId]),
CONSTRAINT FK_Supplier_RecPlans FOREIGN KEY ([SupplierId])  REFERENCES Suppliers([SupplierId]),
CONSTRAINT FK_Stock_RecPlans FOREIGN KEY ([StockId])  REFERENCES Stocks([StockId])
)
GO
ALTER TABLE [dbo].[RecPlans] ADD CONSTRAINT FK_RecPlans_RecPlanStatusId FOREIGN KEY ([RecPlanStatusID])  REFERENCES [dbo].[RecPlanStatus] ([RecPlanStatusID])