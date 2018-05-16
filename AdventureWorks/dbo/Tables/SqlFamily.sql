CREATE TABLE [dbo].[SqlFamily] (
    [Id]            INT            IDENTITY (-2147483648, 1) NOT NULL,
    [Name]          NVARCHAR (50)  NOT NULL,
    [Message]       NVARCHAR (250) NULL,
    [TwitterHandle] NVARCHAR (25)  NULL,
    [BlogURI]       NVARCHAR (80)  NULL,
    [DT]            SMALLDATETIME  DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_dboSqlFamily] PRIMARY KEY CLUSTERED ([Id] ASC)
);

