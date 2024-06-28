CREATE TABLE [Logging].[Packages] (
    [PackageId]    INT          IDENTITY (1, 1) NOT NULL,
    [PackageName]  VARCHAR (50) NOT NULL,
    [Rundate]      DATETIME     NOT NULL,
    [RunStartTime] DATETIME     NOT NULL,
    [RunEndTime]   DATETIME     NULL,
    [RunID]        INT          NOT NULL,
    [RunDuration]  INT          NULL,
    CONSTRAINT [PKPackageId] PRIMARY KEY CLUSTERED ([PackageId] ASC)
);

