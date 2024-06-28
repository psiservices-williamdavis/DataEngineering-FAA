CREATE TABLE [dbo].[StagingDimensionsResults] (
    [AccountName]               NVARCHAR (132)   NULL,
    [ApplicantId]               NVARCHAR (50)    NOT NULL,
    [CandidateId]               NVARCHAR (50)    NOT NULL,
    [ScheduleId]                VARCHAR (50)     NOT NULL,
    [TestPortionId]             NVARCHAR (24)    NOT NULL,
    [TestName]                  NVARCHAR (245)   NULL,
    [FormID]                    INT              NOT NULL,
    [SchoolCode]                NVARCHAR (50)    NULL,
    [TestDate]                  DATE             NULL,
    [Status]                    INT              NULL,
    [Points]                    REAL             NULL,
    [Grade]                     NVARCHAR (2)     NULL,
    [ScaledScore]               REAL             NULL,
    [TotalTestingTimeSeconds]   INT              NULL,
    [Reapplicant]               NVARCHAR (1)     NULL,
    [ItemIdGuid]                UNIQUEIDENTIFIER NOT NULL,
    [ItemId]                    NVARCHAR (50)    NOT NULL,
    [ItemType]                  NVARCHAR (50)    NULL,
    [ItemStatus]                NVARCHAR (16)    NULL,
    [ItemKeyNumeric]            INT              NOT NULL,
    [ItemResponseNumeric]       INT              NULL,
    [ItemResponse]              NVARCHAR (255)   NULL,
    [ItemScore]                 REAL             NULL,
    [ItemElapsedTimeSeconds]    INT              NULL,
    [MaximumItemPoint]          REAL             NULL,
    [MaximumTimeAllowed]        INT              NULL,
    [ItemDeliveryOrder]         VARCHAR (10)     NULL,
    [FormName]                  NVARCHAR (50)    NULL,
    [Test_Center]               NVARCHAR (240)   NULL,
    [ExamLanguage]              NVARCHAR (50)    NULL,
    [CandidateFirstName]        NVARCHAR (25)    NULL,
    [CandidateLastName]         NVARCHAR (30)    NULL,
    [TestDate_AC]               DATETIME         NULL,
    [ItemContentArea]           NVARCHAR (50)    NULL,
    [ItemContentSubArea]        NVARCHAR (50)    NULL,
    [ExtraPointType]            INT              NULL,
    [TestClass]                 INT              NULL,
    [RowNum]                    INT              NOT NULL,
    [ScheduleIdInt]             INT              NULL,
    [TestCenterSeat_ComputerId] NVARCHAR (245)   NULL,
    [DeliveryMode]              NVARCHAR (8)     NULL,
    [ApplicantZipCode]          NVARCHAR (12)    NULL,
    [Segment]                   INT              NULL,
    [SimProblem]                NVARCHAR (50)    NULL,
    [FormNameAlt]               NVARCHAR (64)    NULL,
    [FormNameAlt2]              NVARCHAR (50)    NULL,
    [SchoolName]                NVARCHAR (250)   NULL,
    [ItemVersion]               INT              NULL,
    [Recertification]           NVARCHAR (1)     NULL,
    [TestDescription]           NVARCHAR (2000)  NULL,
    [StudentScoreGuid]          VARCHAR (50)     NULL,
    [ClientCode]                NVARCHAR (50)    NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_StagingDimensionsResults_ClientCode]
    ON [dbo].[StagingDimensionsResults]([ClientCode] ASC, [AccountName] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_StagingDimensionsResults_ScheduleId]
    ON [dbo].[StagingDimensionsResults]([ScheduleId] ASC, [TestDate] ASC, [RowNum] ASC)
    INCLUDE([ItemIdGuid], [ItemKeyNumeric], [ItemResponseNumeric], [ItemResponse], [ItemScore], [ItemElapsedTimeSeconds], [ItemDeliveryOrder], [Segment], [SimProblem], [StudentScoreGuid]);

