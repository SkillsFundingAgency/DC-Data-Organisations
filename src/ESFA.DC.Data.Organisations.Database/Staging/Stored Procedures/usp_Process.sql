CREATE PROCEDURE [Staging].[usp_Process]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
				
			EXEC [Staging].[usp_Process_MasterOrganisation];

			EXEC [Staging].[usp_Process_Org_Details];
			EXEC [Staging].[usp_Process_Org_Funding];
			EXEC [Staging].[usp_Process_Org_HMPP_Postcode];
			EXEC [Staging].[usp_Process_Org_HMPP_UOP];
			EXEC [Staging].[usp_Process_Org_UKPRN_UPIN];
			EXEC [Staging].[usp_Process_Org_PartnerUKPRN];

			EXEC [Staging].[usp_Process_Version];
			EXEC [Staging].[usp_Process_DataGeneration];
			
		RETURN 0;

	END TRY
-- 
-------------------------------------------------------------------------------------- 
-- Handle any problems
-------------------------------------------------------------------------------------- 
-- 
	BEGIN CATCH

		DECLARE   @ErrorMessage		NVARCHAR(4000)
				, @ErrorSeverity	INT 
				, @ErrorState		INT
				, @ErrorNumber		INT
						
		SELECT	  @ErrorNumber		= ERROR_NUMBER()
				, @ErrorMessage		= 'Error in :' + ISNULL(OBJECT_NAME(@@PROCID),'') + ' - Error was :' + ERROR_MESSAGE()
				, @ErrorSeverity	= ERROR_SEVERITY()
				, @ErrorState		= ERROR_STATE();
	
		RAISERROR (
					  @ErrorMessage		-- Message text.
					, @ErrorSeverity	-- Severity.
					, @ErrorState		-- State.
				  );
			  
		RETURN @ErrorNumber;

	END CATCH
-- 
-------------------------------------------------------------------------------------- 
-- All done
-------------------------------------------------------------------------------------- 
-- 
END