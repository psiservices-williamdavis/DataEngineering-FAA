CREATE TABLE [dbo].[dimClients] (
    [dimClientID]  BIGINT         IDENTITY (1, 1) NOT NULL,
    [ClientName]   NVARCHAR (132) NULL,
    [ClientCode]   NVARCHAR (50)  NULL,
    [DateInserted] DATETIME       NULL,
    [DateUpdated]  DATETIME       NULL,
    CONSTRAINT [PKClients] PRIMARY KEY CLUSTERED ([dimClientID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IXdimClients_ClientCode]
    ON [dbo].[dimClients]([ClientCode] ASC);

