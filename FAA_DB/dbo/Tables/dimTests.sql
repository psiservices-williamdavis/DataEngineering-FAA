CREATE TABLE [dbo].[dimTests] (
    [dimTestsId]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [TestPortionId]   NVARCHAR (24)   NULL,
    [TestName]        NVARCHAR (245)  NULL,
    [DateInserted]    DATETIME        NULL,
    [DateUpdated]     DATETIME        NULL,
    [TestClass]       INT             NULL,
    [TestDescription] NVARCHAR (2000) NULL,
    [dimClientID]     BIGINT          NULL,
    CONSTRAINT [PKTests] PRIMARY KEY CLUSTERED ([dimTestsId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IXdimTests_TestPortionId]
    ON [dbo].[dimTests]([TestPortionId] ASC, [TestDescription] ASC, [dimClientID] ASC);

