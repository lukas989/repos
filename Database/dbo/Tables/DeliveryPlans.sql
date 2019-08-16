CREATE TABLE [dbo].[DeliveryPlans] (
    [DeliveryPlanId]       INT          IDENTITY (1, 1) NOT NULL,
    [DeliveryPlanStatusId] INT          NOT NULL,
    [CustomerId]           INT          NOT NULL,
    [ExpectedDate]         DATETIME     NULL,
    [EntryAuthor]          VARCHAR (32) DEFAULT (suser_sname()) NOT NULL,
    [EntryDate]            DATETIME     DEFAULT (getdate()) NOT NULL,
    [LastAuthor]           VARCHAR (32) DEFAULT (suser_sname()) NOT NULL,
    [LastUpdate]           DATETIME     DEFAULT (getdate()) NOT NULL,
    [WmsUpdate]            DATETIME     NULL,
    CONSTRAINT [PK_DeliveryPlans] PRIMARY KEY CLUSTERED ([DeliveryPlanId] ASC),
    CONSTRAINT [FK_Customer_DeliveryPlans] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([CustomerId]),
    CONSTRAINT [FK_DeliveryPlanStatus_DeliveryPlans] FOREIGN KEY ([DeliveryPlanStatusId]) REFERENCES [dbo].[DeliveryPlanStatus] ([DeliveryPlanStatusId])
);

