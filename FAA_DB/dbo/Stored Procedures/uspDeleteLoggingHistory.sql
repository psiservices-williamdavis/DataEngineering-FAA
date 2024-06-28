/*****************************************************************
CREATED BY: William Davis
CREATED ON: 10/31/2023
USED BY: SQL Agent Jobs
DESCRIPTION:
	Deletes Logging Records Older than 90 days
EDITS:

*******************************************************************/

CREATE   PROCEDURE
	[dbo].[uspDeleteLoggingHistory]
--Set Session Options
AS

SET XACT_ABORT ON --Ensure all failed transactions are rolled back

SET NOCOUNT ON -- Suppress Record Count Messages

--Insert new record into ScheduleRuns

BEGIN TRY

 DELETE FROM [Logging].[Controls] WHERE [RunDate] < GETDATE()-90;
 DELETE FROM [Logging].[Packages] WHERE [RunDate] < GETDATE()-90;
 DELETE FROM [Logging].[ScheduleRuns] WHERE [RunDate] < GETDATE()-90;

END TRY

BEGIN CATCH

   IF @@trancount > 0 ROLLBACK TRANSACTION

	INSERT INTO 
		[Logging].[SQLErrors] 
	(
		ErrorNumber,
		ErrorSeverity,
		ErrorState,
		ErrorProcedure,
		ErrorLine,
		ErrorMessage,
		ErrorDateTime
	)
	VALUES 
	(
		ERROR_NUMBER(),ERROR_SEVERITY(),ERROR_STATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE(),GETDATE()
	)

END CATCH