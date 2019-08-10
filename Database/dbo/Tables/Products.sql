CREATE TABLE [dbo].[Products] (
    [ProductId]   INT             IDENTITY (1, 1) NOT NULL,
    [SupplierId]  INT             NOT NULL,
    [Name]        VARCHAR (50)    NOT NULL,
    [Description] VARCHAR (255)   NULL,
    [Weight]      DECIMAL (18, 2) NULL,
    [Height]      DECIMAL (10, 2) NULL,
    [Width]       DECIMAL (10, 2) NULL,
    [Depth]       DECIMAL (10, 2) NULL,
    [EntryAuthor] VARCHAR (32)    DEFAULT (suser_sname()) NOT NULL,
    [EntryDate]   DATETIME        DEFAULT (getdate()) NOT NULL,
    [LastAuthor]  VARCHAR (32)    DEFAULT (suser_sname()) NOT NULL,
    [LastUpdate]  DATETIME        DEFAULT (getdate()) NOT NULL,
    [WmsUpdate]   DATETIME        NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductId] ASC),
    CONSTRAINT [FK_Supplier_Products] FOREIGN KEY ([SupplierId]) REFERENCES [dbo].[Suppliers] ([SupplierId])
);

