CREATE TABLE [dbo].[bigTransactionHistory] (
    [TransactionID]   BIGINT   IDENTITY (1, 1) NOT NULL,
    [ProductID]       INT      NULL,
    [TransactionDate] DATETIME NULL,
    [Quantity]        INT      NULL,
    [ActualCost]      MONEY    NULL,
    PRIMARY KEY CLUSTERED ([TransactionID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ProductId_TransactionDate]
    ON [dbo].[bigTransactionHistory]([ProductID] ASC, [TransactionDate] ASC)
    INCLUDE([Quantity], [ActualCost]);

