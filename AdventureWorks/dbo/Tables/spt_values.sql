CREATE TABLE [dbo].[spt_values] (
    [name]   NVARCHAR (35) NOT NULL,
    [number] INT           NOT NULL,
    [type]   NCHAR (3)     NOT NULL,
    [low]    INT           NULL,
    [high]   INT           NULL,
    [status] INT           NULL,
    CONSTRAINT [pk] PRIMARY KEY CLUSTERED ([name] ASC, [number] ASC, [type] ASC)
);

