CREATE TABLE [dbo].[factItemResults] (
    [factItemResultsId]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [ItemResponseNumeric]    INT            NULL,
    [ItemResponse]           NVARCHAR (255) NULL,
    [ItemScore]              REAL           NULL,
    [ItemElapsedTimeSeconds] INT            NULL,
    [ItemDeliveryOrder]      INT            NULL,
    [dimItemId]              BIGINT         NULL,
    [factResultsId]          BIGINT         NULL,
    [DateInserted]           DATETIME       NULL,
    [DateUpdated]            DATETIME       NULL,
    [SimProblem]             NVARCHAR (50)  NULL,
    [Segment]                INT            NULL,
    CONSTRAINT [PKfactItemResults] PRIMARY KEY NONCLUSTERED ([factItemResultsId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_factItemResults_factResultsId]
    ON [dbo].[factItemResults]([factResultsId] ASC)
    INCLUDE([ItemResponseNumeric], [ItemScore], [ItemElapsedTimeSeconds], [ItemDeliveryOrder], [Segment]);


GO
CREATE CLUSTERED INDEX [CXfactItemResults_Keys]
    ON [dbo].[factItemResults]([dimItemId] ASC, [factResultsId] ASC);

