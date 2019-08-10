CREATE TABLE [WmsSimulator].[XmlIn] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [EntryDate] DATETIME       DEFAULT (getdate()) NOT NULL,
    [Content]   VARCHAR (255)  NULL,
    [Body]      NVARCHAR (MAX) NULL
);

