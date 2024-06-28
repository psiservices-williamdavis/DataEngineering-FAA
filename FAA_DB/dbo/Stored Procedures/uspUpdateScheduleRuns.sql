

/*****************************************************************
CREATED BY: William Davis
CREATED ON: 2/11/2022
USED BY: Last Tasks of All PSI_DW_SSIS Packages
DESCRIPTION:
	Updates EndDateTime and calculates duration in [Logging].[ScheduleRuns] once the package completes
EDITS:

*******************************************************************/

CREATE   PROCEDURE
	[dbo].[uspUpdateScheduleRuns]

--Set Global Variables
(
	 @RunID INT  --Stores Inserted Identity Key In ScheduledRun Table
	
)
AS

--Set Session Options

SET XACT_ABORT ON --Ensure all failed transactions are rolled back

SET NOCOUNT ON -- Suppress Record Count Messages

--Update ScheduleRuns

BEGIN TRY

--Update ScheduleRuns

	UPDATE
		[Logging].[ScheduleRuns]
	SET
		 [EndDateTime] = GETDATE()
		,[Duration] = DATEDIFF(SECOND,[StartDateTime],GETDATE())
	WHERE
		[RunId] = @RunID;

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