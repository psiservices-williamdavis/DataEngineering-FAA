CREATE TABLE [Logging].[ScheduleRuns] (
    [RunId]             INT            IDENTITY (1, 1) NOT NULL,
    [ParentPackageName] VARCHAR (50)   NOT NULL,
    [RunDate]           DATE           NOT NULL,
    [StartDateTime]     DATETIME       NOT NULL,
    [EndDateTime]       DATETIME       NULL,
    [ErrorMessage]      VARCHAR (1500) NULL,
    [Duration]          INT            NULL,
    CONSTRAINT [PKRunId] PRIMARY KEY CLUSTERED ([RunId] ASC)
);

