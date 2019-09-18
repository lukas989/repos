CREATE TABLE [dbo].[OrderLineConfirmWms] (
    [Id]              INT          IDENTITY (1, 1) NOT NULL,
    [ReferenceNumber] VARCHAR (10) NULL,
    [OrderCode]       VARCHAR (10) NULL,
    [LogisticSite]    VARCHAR (10) NULL,
    [OrderLineNo]     VARCHAR (10) NULL,
    [PartNumber]      VARCHAR (10) NULL,
    [OrderedQuantity] VARCHAR (10) NULL,
    [CheckedQuantity] VARCHAR (10) NULL,
    [WmsDate]         DATETIME     DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_OrderLineConfirmWms] PRIMARY KEY CLUSTERED ([Id] ASC)
);

