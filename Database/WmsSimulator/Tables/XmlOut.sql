CREATE TABLE [WmsSimulator].[XmlOut] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [EntryDate] DATETIME       DEFAULT (getdate()) NULL,
    [Content]   VARCHAR (255)  NULL,
    [Body]      NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_WmsSimulator_XmlOut] PRIMARY KEY CLUSTERED ([Id] ASC)
);



