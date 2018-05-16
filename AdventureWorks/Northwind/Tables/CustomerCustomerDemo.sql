CREATE TABLE [Northwind].[CustomerCustomerDemo] (
    [CustomerID]     NCHAR (5)  NOT NULL,
    [CustomerTypeID] NCHAR (10) NOT NULL,
    CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY CLUSTERED ([CustomerID] ASC, [CustomerTypeID] ASC),
    CONSTRAINT [FK_CustomerCustomerDemo] FOREIGN KEY ([CustomerTypeID]) REFERENCES [Northwind].[CustomerDemographics] ([CustomerTypeID]),
    CONSTRAINT [FK_CustomerCustomerDemo_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [Northwind].[Customers] ([CustomerID])
);

