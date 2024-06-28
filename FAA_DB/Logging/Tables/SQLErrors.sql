CREATE TABLE [Logging].[SQLErrors] (
    [ErrorId]        INT             IDENTITY (1, 1) NOT NULL,
    [ErrorLIne]      INT             NULL,
    [ErrorMessage]   NVARCHAR (4000) NULL,
    [ErrorNumber]    INT             NULL,
    [ErrorProcedure] NVARCHAR (128)  NULL,
    [ErrorSeverity]  INT             NULL,
    [ErrorState]     INT             NULL,
    [ErrorDateTime]  DATETIME        NULL,
    CONSTRAINT [PKErrorId] PRIMARY KEY CLUSTERED ([ErrorId] ASC)
);

