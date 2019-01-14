CREATE PROCEDURE [Staging].[usp_Process_CampusIdentifier]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY

		MERGE INTO [dbo].[CampusIdentifier] AS Target
		USING (
				SELECT DISTINCT 
					   [CampusIdentifier]
					  ,[MasterUKPRN]
					  ,[OriginalUKPRN]
					  ,[EffectiveFrom]
					  ,[EffectiveTo]
				  FROM [Staging].[CampusIdentifier]
			  )
			  AS Source 
		     ON Target.[MasterUKPRN] = Source.[MasterUKPRN]
			AND Target.[MasterUKPRN] = Source.[MasterUKPRN]
			AND Target.[EffectiveFrom] = Source.[EffectiveFrom]

			WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							Source.[OriginalUKPRN],
							Source.[EffectiveTo]
					EXCEPT 
						SELECT 
							Target.[OriginalUKPRN],
							Target.[EffectiveTo]
					)
		  THEN
			UPDATE SET   
				[OriginalUKPRN]=Source.[OriginalUKPRN],
				[EffectiveTo]=Source.[EffectiveTo]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT ( 
					[CampusIdentifier],
					[MasterUKPRN],
					[OriginalUKPRN],
					[EffectiveFrom],
					[EffectiveTo]
				)
			VALUES ( 
					Source.[CampusIdentifier],
					Source.[MasterUKPRN],
					Source.[OriginalUKPRN],
					Source.[EffectiveFrom],
					Source.[EffectiveTo]
				  )
		WHEN NOT MATCHED BY SOURCE THEN DELETE
		;

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
