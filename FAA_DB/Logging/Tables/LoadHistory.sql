CREATE TABLE [Logging].[LoadHistory] (
    [LoadHistoryId]  INT           IDENTITY (1, 1) NOT NULL,
    [TableName]      VARCHAR (50)  NOT NULL,
    [StartDate]      DATETIME      NULL,
    [EndDate]        DATETIME      NULL,
    [KeyData]        VARCHAR (255) NULL,
    [MaxDateValue]   VARCHAR (255) NULL,
    [SourceSystemId] INT           NULL,
    PRIMARY KEY CLUSTERED ([LoadHistoryId] ASC)
);

