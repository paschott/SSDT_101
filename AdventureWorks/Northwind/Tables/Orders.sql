CREATE TABLE [Northwind].[Orders] (
    [OrderID]        INT           IDENTITY (1, 1) NOT NULL,
    [CustomerID]     NCHAR (5)     NULL,
    [EmployeeID]     INT           NULL,
    [OrderDate]      DATETIME      NULL,
    [RequiredDate]   DATETIME      NULL,
    [ShippedDate]    DATETIME      NULL,
    [ShipVia]        INT           NULL,
    [Freight]        MONEY         CONSTRAINT [DF_Orders_Freight] DEFAULT ((0)) NULL,
    [ShipName]       NVARCHAR (40) NULL,
    [ShipAddress]    NVARCHAR (60) NULL,
    [ShipCity]       NVARCHAR (15) NULL,
    [ShipRegion]     NVARCHAR (15) NULL,
    [ShipPostalCode] NVARCHAR (10) NULL,
    [ShipCountry]    NVARCHAR (15) NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([OrderID] ASC),
    CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [Northwind].[Customers] ([CustomerID]),
    CONSTRAINT [FK_Orders_Employees] FOREIGN KEY ([EmployeeID]) REFERENCES [Northwind].[Employees] ([EmployeeID]),
    CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY ([ShipVia]) REFERENCES [Northwind].[Shippers] ([ShipperID])
);


GO
CREATE NONCLUSTERED INDEX [EmployeesOrders]
    ON [Northwind].[Orders]([EmployeeID] ASC);


GO
CREATE NONCLUSTERED INDEX [EmployeeID]
    ON [Northwind].[Orders]([EmployeeID] ASC);


GO
CREATE NONCLUSTERED INDEX [CustomersOrders]
    ON [Northwind].[Orders]([CustomerID] ASC);


GO
CREATE NONCLUSTERED INDEX [CustomerID]
    ON [Northwind].[Orders]([CustomerID] ASC);


GO
CREATE NONCLUSTERED INDEX [ShipPostalCode]
    ON [Northwind].[Orders]([ShipPostalCode] ASC);


GO
CREATE NONCLUSTERED INDEX [ShippersOrders]
    ON [Northwind].[Orders]([ShipVia] ASC);


GO
CREATE NONCLUSTERED INDEX [ShippedDate]
    ON [Northwind].[Orders]([ShippedDate] ASC);


GO
CREATE NONCLUSTERED INDEX [OrderDate]
    ON [Northwind].[Orders]([OrderDate] ASC);

