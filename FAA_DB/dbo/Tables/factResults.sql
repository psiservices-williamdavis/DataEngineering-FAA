CREATE TABLE [dbo].[factResults] (
    [factResultsId]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [ApplicantId]               NVARCHAR (50)  NULL,
    [CandidateId]               NVARCHAR (50)  NULL,
    [CandidateFirstName]        NVARCHAR (25)  NULL,
    [CandidateLastName]         NVARCHAR (30)  NULL,
    [ApplicantZipCode]          NVARCHAR (12)  NULL,
    [ScheduleId]                VARCHAR (50)   NULL,
    [ScheduleIdInt]             INT            NULL,
    [StudentScoreGuid]          VARCHAR (50)   NULL,
    [ExamLanguage]              NVARCHAR (50)  NULL,
    [TestDate]                  DATE           NULL,
    [TestDate_AC]               DATETIME       NULL,
    [Status]                    INT            NULL,
    [Points]                    REAL           NULL,
    [Grade]                     NVARCHAR (2)   NULL,
    [ScaledScore]               REAL           NULL,
    [TotalTestingTimeSeconds]   INT            NULL,
    [Reapplicant]               NVARCHAR (1)   NULL,
    [Recertification]           NVARCHAR (1)   NULL,
    [TestCenterSeat_ComputerId] NVARCHAR (245) NULL,
    [DeliveryMode]              NVARCHAR (8)   NULL,
    [RowNum]                    INT            NULL,
    [dimClientId]               BIGINT         NULL,
    [dimTestCenterId]           INT            NULL,
    [dimSchoolsId]              BIGINT         NULL,
    [dimTestsId]                BIGINT         NULL,
    [dimFormsId]                BIGINT         NULL,
    [DateInserted]              DATETIME       NULL,
    [DateUpdated]               DATETIME       NULL,
    CONSTRAINT [PKfactResults] PRIMARY KEY CLUSTERED ([factResultsId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_factResults_RowNum]
    ON [dbo].[factResults]([RowNum] ASC)
    INCLUDE([CandidateId], [CandidateFirstName], [CandidateLastName], [ApplicantZipCode], [ScheduleId], [StudentScoreGuid], [ExamLanguage], [TestDate], [TestDate_AC], [Points], [Grade], [TotalTestingTimeSeconds], [Reapplicant], [TestCenterSeat_ComputerId], [DeliveryMode], [dimClientId], [dimTestCenterId], [dimSchoolsId], [dimTestsId], [dimFormsId]);


GO
CREATE NONCLUSTERED INDEX [IXfactResults_Keys]
    ON [dbo].[factResults]([ScheduleId] ASC, [StudentScoreGuid] ASC, [TestDate_AC] ASC, [RowNum] ASC);

