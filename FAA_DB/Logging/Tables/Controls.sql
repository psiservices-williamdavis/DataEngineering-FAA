CREATE TABLE [Logging].[Controls] (
    [ControlId]     INT            IDENTITY (1, 1) NOT NULL,
    [ControlName]   VARCHAR (50)   NOT NULL,
    [PackageID]     INT            NOT NULL,
    [RunID]         INT            NOT NULL,
    [RunDate]       DATE           NOT NULL,
    [StartDateTime] DATETIME       NOT NULL,
    [EndDateTime]   DATETIME       NULL,
    [RowsRetrieved] BIGINT         NULL,
    [RowsInserted]  BIGINT         NULL,
    [RowsUpdated]   BIGINT         NULL,
    [Duration]      INT            NULL,
    [ErrorMessage]  VARCHAR (1500) NULL,
    [ErrorNumber]   VARCHAR (20)   NULL,
    CONSTRAINT [PKControlId] PRIMARY KEY CLUSTERED ([ControlId] ASC)
);

