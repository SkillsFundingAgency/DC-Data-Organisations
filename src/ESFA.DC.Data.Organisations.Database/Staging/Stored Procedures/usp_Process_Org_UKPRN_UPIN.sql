CREATE PROCEDURE [Staging].[usp_Process_Org_UKPRN_UPIN]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY

		MERGE INTO [dbo].[Org_UKPRN_UPIN] AS Target
		USING (
				SELECT  [UKPRN],
						[UPIN],
						[Status],
						[StatusEffectiveFrom],
						[StatusEffectiveTo],
						[EffectiveFrom],
						[EffectiveTo],
						[Created_On],
						[Created_By],
						[Modified_On],
						[Modified_By]
				  FROM [Staging].[Org_UKPRN_UPIN]
			  )
			  AS Source 
		     ON Target.[UKPRN] = Source.[UKPRN]
			AND Target.[UKPRN] = Source.[UPIN]
			WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							Source.[Status],
							Source.[StatusEffectiveFrom],
							Source.[StatusEffectiveTo],
							Source.[EffectiveFrom],
							Source.[EffectiveTo]
					EXCEPT 
						SELECT 
							Target.[Status],
							Target.[StatusEffectiveFrom],
							Target.[StatusEffectiveTo],
							Target.[EffectiveFrom],
							Target.[EffectiveTo]
					)
		  THEN
			UPDATE SET   
				[Status]=Source.[Status],
				[StatusEffectiveFrom]=Source.[StatusEffectiveFrom],
				[StatusEffectiveTo]=Source.[StatusEffectiveTo],
				[EffectiveFrom]=Source.[EffectiveFrom],
				[EffectiveTo]=Source.[EffectiveTo],
				[Modified_On]=Source.[Modified_On],
				[Modified_By]=Source.[Modified_By]					
		WHEN NOT MATCHED BY TARGET THEN
		INSERT ( 
					[UKPRN],
					[UPIN],
					[Status],
					[StatusEffectiveFrom],
					[StatusEffectiveTo],
					[EffectiveFrom],
					[EffectiveTo],
					[Created_On],
					[Created_By],
					[Modified_On],
					[Modified_By]
				)
			VALUES ( 
					Source.[UKPRN],
					Source.[UPIN],
					Source.[Status],
					Source.[StatusEffectiveFrom],
					Source.[StatusEffectiveTo],
					Source.[EffectiveFrom],
					Source.[EffectiveTo],
					Source.[Created_On],
					Source.[Created_By],
					Source.[Modified_On],
					Source.[Modified_By]				
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
