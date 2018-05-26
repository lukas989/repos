CREATE TABLE [dbo].[CustomerAddress]
(
	[CustomerAddressId] [INT] IDENTITY(1,1) NOT NULL,
	[CustomerId] [INT] NOT NULL,
	[Street]	VARCHAR(255) NOT NULL,
	[City]		VARCHAR(255) NOT NULL,
	[Zipcode]	VARCHAR(15)  NOT NULL,
	[Country]	VARCHAR(2)  NOT NULL,
	[Description]	VARCHAR(255)  NULL,
	CONSTRAINT [PK_CustomerAddress] PRIMARY KEY CLUSTERED ([CustomerAddressId]),
	CONSTRAINT FK_Customers_CustomerAddress FOREIGN KEY ([CustomerId])  REFERENCES Customers([CustomerId])
	
)

--CONSTRAINT FK_RecPlanLines_SalesOrderLines FOREIGN KEY ([SalesOrderId],[SalesOrderLineNo])  REFERENCES RecPlanLines([SalesOrderId],[SalesOrderLineNo])