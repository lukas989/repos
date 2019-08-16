CREATE TABLE [dbo].[ReceiptPlanLineConfirmWms] (
    [Id]               INT          IDENTITY (1, 1) NOT NULL,
    [ReferenceNumber]  VARCHAR (10) NULL,
    [ErCode]           VARCHAR (10) NULL,
    [LogisticSite]     VARCHAR (10) NULL,
    [PartNumber]       VARCHAR (10) NULL,
    [ExpectedQuantity] VARCHAR (10) NULL,
    [ReceivedQuantity] VARCHAR (10) NULL,
    [WmsDate]          DATETIME     DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_ReceiptPlanLineConfirmWms] PRIMARY KEY CLUSTERED ([Id] ASC)
);



