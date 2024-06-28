CREATE TABLE [dbo].[dimItems] (
    [dimItemId]          BIGINT           IDENTITY (1, 1) NOT NULL,
    [ItemIdGuid]         UNIQUEIDENTIFIER NULL,
    [ItemId]             NVARCHAR (50)    NULL,
    [ItemType]           NVARCHAR (50)    NULL,
    [ItemStatus]         NVARCHAR (16)    NULL,
    [ItemKeyNumeric]     INT              NULL,
    [ItemVersion]        INT              NULL,
    [ExtraPointType]     INT              NULL,
    [MaximumItemPoint]   REAL             NULL,
    [MaximumTimeAllowed] INT              NULL,
    [ItemContentArea]    NVARCHAR (50)    NULL,
    [ItemContentSubArea] NVARCHAR (50)    NULL,
    [dimClientId]        BIGINT           NULL,
    [DateInserted]       DATETIME         NULL,
    [DateUpdated]        DATETIME         NULL,
    CONSTRAINT [PKItems] PRIMARY KEY CLUSTERED ([dimItemId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IXdimItems_ItemIdGuid]
    ON [dbo].[dimItems]([ItemIdGuid] ASC, [dimClientId] ASC);

