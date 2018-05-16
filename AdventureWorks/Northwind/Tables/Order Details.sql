CREATE TABLE [Northwind].[Order Details] (
    [OrderID]   INT      NOT NULL,
    [ProductID] INT      NOT NULL,
    [UnitPrice] MONEY    CONSTRAINT [DF_Order_Details_UnitPrice] DEFAULT ((0)) NOT NULL,
    [Quantity]  SMALLINT CONSTRAINT [DF_Order_Details_Quantity] DEFAULT ((1)) NOT NULL,
    [Discount]  REAL     CONSTRAINT [DF_Order_Details_Discount] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED ([OrderID] ASC, [ProductID] ASC),
    CONSTRAINT [CK_Discount] CHECK ([Discount]>=(0) AND [Discount]<=(1)),
    CONSTRAINT [CK_Quantity] CHECK ([Quantity]>(0)),
    CONSTRAINT [CK_UnitPrice] CHECK ([UnitPrice]>=(0)),
    CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY ([OrderID]) REFERENCES [Northwind].[Orders] ([OrderID]),
    CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY ([ProductID]) REFERENCES [Northwind].[Products] ([ProductID])
);


GO
CREATE NONCLUSTERED INDEX [ProductsOrder_Details]
    ON [Northwind].[Order Details]([ProductID] ASC);


GO
CREATE NONCLUSTERED INDEX [ProductID]
    ON [Northwind].[Order Details]([ProductID] ASC);


GO
CREATE NONCLUSTERED INDEX [OrdersOrder_Details]
    ON [Northwind].[Order Details]([OrderID] ASC);


GO
CREATE NONCLUSTERED INDEX [OrderID]
    ON [Northwind].[Order Details]([OrderID] ASC);

