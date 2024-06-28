
/*****************************************************************
CREATED BY: William Davis
CREATED ON: 2/11/2022
USED BY: Package Level OnPostExecute Event Handler of All PSI_DW_SSIS Packages
DESCRIPTION:
	Updates  record into [Logging].[Controls] and Returns the tables identity key
EDITS:

*******************************************************************/

CREATE   PROCEDURE
	[dbo].[uspUpdateControls]

--Set Global Variables
(
	 @ControlID INT  --Stores Inserted Identity Key
	,@RowsRetrieved INT --Stores Number of Rows pulled from the source system,
	,@RowsUpdated INT --Stores Number of Rows Updated from the source system,
)
AS

--Set Session Options

SET XACT_ABORT ON --Ensure all failed transactions are rolled back

SET NOCOUNT ON -- Suppress Record Count Messages

--Update Packages

BEGIN TRY

	UPDATE
		[Logging].[Controls]
	SET
		 [EndDateTime] = GETDATE()
		,[Duration] = DATEDIFF(SECOND,[StartDateTime],GETDATE())
		,[RowsRetrieved] = @RowsRetrieved
		,[RowsUpdated] = @RowsUpdated
	WHERE
		[ControlId] = @ControlID



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