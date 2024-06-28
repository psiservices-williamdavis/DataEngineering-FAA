



/*****************************************************************
CREATED BY: William Davis
CREATED ON: 2/11/2022
USED BY: Last Tasks of All PSI_DW_SSIS Packages
DESCRIPTION:
	Updates Error Message, EndDateTime and calculates duration in [Logging].[ScheduleRuns] if the package fails
EDITS:
	2/18/2022 - WBD - Added Error Handling Update for Logging.Controls
*******************************************************************/

CREATE   PROCEDURE
	[dbo].[uspUpdateScheduleRunsErrorMsg]

--Set Global Variables
(
	 @ErrorMessage VARCHAR(1500) --Stores SSIS Generated Error Msg
	,@RunID INT  --Stores Inserted Identity Key
	,@PackageID INT --Stores Inserted Identity Key In Package Table
	,@ControlId INT --Stores Inserted Identity Key In Control Table
	,@ErrorNumber VARCHAR(20) --Stores Error Number to be used In Control Table
)
AS

--Set Session Options

SET XACT_ABORT ON --Ensure all failed transactions are rolled back

SET NOCOUNT ON -- Suppress Record Count Messages

--Update ScheduleRuns

BEGIN TRY

	UPDATE
		[Logging].[ScheduleRuns]
	SET
		 [ErrorMessage] = @ErrorMessage
		,[EndDateTime] = GETDATE()
		,[Duration] = DATEDIFF(SECOND,[StartDateTime],GETDATE())
	WHERE
		[RunId] = @RunID

-- Update Packages

	UPDATE
		[Logging].[Packages]
	SET
		 [RunEndTime] = GETDATE()
		,[RunDuration] = DATEDIFF(SECOND,[RunStartTime],GETDATE())
	WHERE
		[PackageId] = @PackageID;

-- Update Controls

	UPDATE
		[Logging].[Controls]
	SET
		 [EndDateTime] = GETDATE()
		,[Duration] = DATEDIFF(SECOND,[StartDateTime],GETDATE())
		,[ErrorMessage] = @ErrorMessage
		,[ErrorNumber] = @ErrorNumber
	WHERE
		[ControlId] = @ControlId;

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