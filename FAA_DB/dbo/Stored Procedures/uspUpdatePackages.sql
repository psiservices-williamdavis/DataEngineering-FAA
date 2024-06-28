
/*****************************************************************
CREATED BY: William Davis
CREATED ON: 2/11/2022
USED BY: Next To Last Tasks of All PSI_DW_SSIS Packages
DESCRIPTION:
	Updates EndDateTime and calculates duration in [Logging].[Packages] once the package completes
EDITS:

*******************************************************************/

CREATE   PROCEDURE
	[dbo].[uspUpdatePackages]

--Set Global Variables
(
	 @PackageId INT  --Stores Inserted Identity Key
)
AS

--Set Session Options

SET XACT_ABORT ON --Ensure all failed transactions are rolled back

SET NOCOUNT ON -- Suppress Record Count Messages

--Update Packages

BEGIN TRY

	UPDATE
		[Logging].[Packages]
	SET
		 [RunEndTime] = GETDATE()
		,[RunDuration] = DATEDIFF(SECOND,[RunStartTime],GETDATE())
	WHERE
		[PackageId] = @PackageId

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