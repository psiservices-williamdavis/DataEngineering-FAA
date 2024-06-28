CREATE TABLE [dbo].[dimSchools] (
    [dimSchoolsId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [SchoolCode]   NVARCHAR (50)  NULL,
    [SchoolName]   NVARCHAR (250) NULL,
    [dimClientId]  BIGINT         NULL,
    [DateInserted] DATETIME       NULL,
    [DateUpdated]  DATETIME       NULL,
    CONSTRAINT [PKdimSchools] PRIMARY KEY CLUSTERED ([dimSchoolsId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IXdimSchools_SchoolCode_dimClientId]
    ON [dbo].[dimSchools]([SchoolCode] ASC, [dimClientId] ASC);

