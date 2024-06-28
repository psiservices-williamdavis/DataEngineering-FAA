
/*****************************************************************
CREATED BY: William Davis
CREATED ON: 2/11/2022
USED BY: Package Level OnPreExecute Event Handler of All PSI_DW_SSIS Packages
DESCRIPTION:
	Inserts a new record into [Logging].[Controls] and Returns the tables identity key
EDITS:

*******************************************************************/

CREATE   PROCEDURE
	[dbo].[uspInsertIntoControls]

--Set Global Variables
(
	 @ControlId INT OUTPUT --Stores Inserted Identity Key
	,@PackageID INT --Collects the Package ID From the Packages Table
	,@RunID INT --Collects the Run ID from the ScheduleRuns Table
	,@ControlName VARCHAR(255) --Collects the Control Name
	
)
AS

--Set Session Options

SET XACT_ABORT ON --Ensure all failed transactions are rolled back

SET NOCOUNT ON -- Suppress Record Count Messages

--Insert new record into ScheduleRuns

BEGIN TRY

	INSERT INTO 
		[Logging].[Controls]
	(
		  [ControlName]
		 ,[PackageID]
		 ,[RunID]
		 ,[RunDate]
		 ,[StartDateTime]
		
	)

	VALUES
	(
		@ControlName, @PackageID, @RunID, CONVERT(VARCHAR(12),GETDATE(),112), GETDATE()
	)


--Retruns the newly inserted identity key to be used throughout the package during the current run

	SET @ControlId = SCOPE_IDENTITY()

	RETURN @ControlId

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