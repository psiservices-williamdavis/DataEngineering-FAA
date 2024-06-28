CREATE TABLE [dbo].[dimForms] (
    [dimFormsId]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [FormID]       INT           NULL,
    [FormName]     NVARCHAR (50) NULL,
    [FormNameAlt]  NVARCHAR (64) NULL,
    [FormNameAlt2] NVARCHAR (50) NULL,
    [DateInserted] DATETIME      NULL,
    [DateUpdated]  DATETIME      NULL,
    [dimClientId]  BIGINT        NULL,
    CONSTRAINT [PKForms] PRIMARY KEY CLUSTERED ([dimFormsId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IXDimForms_FormId]
    ON [dbo].[dimForms]([FormID] ASC, [dimClientId] ASC);

