CREATE TABLE [Northwind].[EmployeeTerritories] (
    [EmployeeID]  INT           NOT NULL,
    [TerritoryID] NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY CLUSTERED ([EmployeeID] ASC, [TerritoryID] ASC),
    CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY ([EmployeeID]) REFERENCES [Northwind].[Employees] ([EmployeeID]),
    CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY ([TerritoryID]) REFERENCES [Northwind].[Territories] ([TerritoryID])
);

