CREATE TABLE [dbo].[DeliveryPlans]
(
[DeliveryPlanId] INT IDENTITY(1,1) NOT NULL,
[DeliveryPlanStatusId] INT NOT NULL, 
[CustomerId] INT NOT NULL,
[ExpectedDate] datetime NULL,
[EntryAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[EntryDate] datetime NOT NULL  DEFAULT (GETDATE()),
[LastAuthor] varchar (32)  NOT NULL  DEFAULT (SUSER_SNAME()),
[LastUpdate] datetime NOT NULL  DEFAULT (GETDATE()),
CONSTRAINT [PK_DeliveryPlans] PRIMARY KEY CLUSTERED ([DeliveryPlanId]),
CONSTRAINT FK_Customer_DeliveryPlans FOREIGN KEY ([CustomerId])  REFERENCES Customers([CustomerId]),
CONSTRAINT FK_DeliveryPlanStatus_DeliveryPlans FOREIGN KEY ([DeliveryPlanStatusId])  REFERENCES DeliveryPlanStatus([DeliveryPlanStatusId])
)