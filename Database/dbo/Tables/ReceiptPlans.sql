CREATE TABLE [dbo].[ReceiptPlans] (
    [ReceiptPlanId]       INT          IDENTITY (1, 1) NOT NULL,
    [ReceiptPlanStatusId] INT          NOT NULL,
    [SupplierId]          INT          NOT NULL,
    [ExpectedDate]        DATETIME     NULL,
    [EntryAuthor]         VARCHAR (32) DEFAULT (suser_sname()) NOT NULL,
    [EntryDate]           DATETIME     DEFAULT (getdate()) NOT NULL,
    [LastAuthor]          VARCHAR (32) DEFAULT (suser_sname()) NOT NULL,
    [LastUpdate]          DATETIME     DEFAULT (getdate()) NOT NULL,
    [WmsUpdate]           DATETIME     NULL,
    CONSTRAINT [PK_ReceiptPlans] PRIMARY KEY CLUSTERED ([ReceiptPlanId] ASC),
    CONSTRAINT [FK_ReceiptPlanStatus_ReceiptPlans] FOREIGN KEY ([ReceiptPlanStatusId]) REFERENCES [dbo].[ReceiptPlanStatus] ([ReceiptPlanStatusId]),
    CONSTRAINT [FK_Supplier_ReceiptPlans] FOREIGN KEY ([SupplierId]) REFERENCES [dbo].[Suppliers] ([SupplierId])
);

