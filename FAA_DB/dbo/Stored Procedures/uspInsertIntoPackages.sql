
/*****************************************************************
CREATED BY: William Davis
CREATED ON: 2/11/2022
USED BY: Second Tasks of All PSI_DW_SSIS Packages
DESCRIPTION:
	Inserts a new record into [Logging].[Packages] and Returns the tables identity key
EDITS:

*******************************************************************/

CREATE   PROCEDURE
	[dbo].[uspInsertIntoPackages]

--Set Global Variables
(
	 @PackageId INT OUTPUT --Stores Inserted Identity Key
	,@PackageName VARCHAR(255) --Collects the Package Running the Produres Name
	,@RunID VARCHAR(255) --Collects the Package Running the Produres Name
)
AS

--Set Session Options

SET XACT_ABORT ON --Ensure all failed transactions are rolled back

SET NOCOUNT ON -- Suppress Record Count Messages

--Insert new record into ScheduleRuns

BEGIN TRY

	INSERT INTO 
		[Logging].[Packages]
	(
		  [PackageName]
		 ,[RunDate]
		 ,[RunStartTime]
		 ,[RunID]
	)

	VALUES
	(
		@PackageName, CONVERT(VARCHAR(12),GETDATE(),112), GETDATE(),@RunID
	)


--Retruns the newly inserted identity key to be used throughout the package during the current run

	SET @PackageId = SCOPE_IDENTITY()

	RETURN @PackageId

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