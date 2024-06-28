CREATE VIEW
	[dbo].[vwDimensionsItemLevelResults]
AS
SELECT
	 [ScheduleId]  
	,[StudentScoreGuid]
	,[FormName] AS ExamFormName
	,[TestPortionId]
	,[TestName]
	,GlobalTestCenterID AS TestCenterId
	,tc.TestCenterDisplayName AS TestCenterName
	,[TestCenterSeat_ComputerId] AS TestCenterSeat_ComputerId
	,CAST([TestDate] AS DATETIME) AS TestDate_LC
	,[CandidateId]
	,[CandidateFirstName]
	,[CandidateLastName]
	,[TotalTestingTimeSeconds] / 1000 TotalTestingTime_Seconds
	,[Points] AS SCORE_POINTS
	,CASE [Grade] WHEN 'P' THEN 'PASS' WHEN 'F' THEN 'FAIL' ELSE [Grade] END AS PASS_FAIL
	,[ItemId]  AS [ItemId]
	,COALESCE([ItemResponseNumeric] + 1, '0') AS ItemResponse
	,COALESCE([ItemKeyNumeric] + 1, '0') AS ItemKey
	,[ItemScore]
	,[ItemElapsedTimeSeconds] / 1000  AS [ItemElapsedTime_Seconds]
	,CAST([ItemDeliveryOrder] AS INT) AS DeliveryOrder
	,CASE [ExtraPointType] WHEN 0 THEN 'Regular' WHEN '2' THEN 'PreTest' ELSE 'UNKNOWN' END AS ItemStatus
	,[ItemType]
	,[ItemContentArea]
	,[TestDate_AC]
	,[CandidateId] AS ActorID
	,CASE WHEN [ItemElapsedTimeSeconds] < 0 THEN 1 ELSE 0 END AS HasNegativeItemTime
	,CASE ItemVersion WHEN '0' THEN 'E0' WHEN '1' THEN 'E1' WHEN 2 THEN 'E2' WHEN '4096' THEN 'E0' WHEN '4097' THEN 'E1' WHEN '4098' THEN 'E2' WHEN '4099' THEN 'E3' WHEN '4100' THEN 'E4' ELSE 'Ex' END AS ItemVersion
	,[ExamLanguage]
	,SchoolCode
	,[SchoolName]
	,ApplicantZipCode
	,DeliveryMode
	,Segment
	,Reapplicant
FROM 
	[dbo].[factResults] fr WITH (NOLOCK)
INNER JOIN
	[dbo].[dimClients] c WITH (NOLOCK) ON fr.dimClientId = c.dimClientID
INNER JOIN
	[dbo].[dimTests] t WITH (NOLOCK) ON fr.dimTestsId = t.dimTestsId
INNER JOIN
	[dbo].[dimForms] f WITH (NOLOCK) ON fr.dimFormsId = f.dimFormsId
INNER JOIN
	[dbo].[dimSchools] s WITH (NOLOCK) ON fr.dimSchoolsId = s.dimSchoolsId
INNER JOIN
	[dbo].[dimTestCenters] tc WITH (NOLOCK) ON fr.dimTestCenterId = tc.AtlasTestCenterID
INNER JOIN
	[dbo].[factItemResults] ir WITH (NOLOCK) ON fr.factResultsId = ir.factResultsId
INNER JOIN
	[dbo].[dimItems] i WITH (NOLOCK) ON ir.dimItemId = i.dimItemId
WHERE
	[TestClass] = 1
AND 
	[CandidateId] NOT LIKE 'T%'
AND
	[ItemType] <> 'Instruction'
AND
	RowNum = 1
GO