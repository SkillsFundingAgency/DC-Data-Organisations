CREATE PROCEDURE [Staging].[usp_Process_Org_HMPP_UOP]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY

		MERGE INTO [dbo].[Org_HMPP_UOP] AS Target
		USING (
				SELECT  [UKPRN],
						[UOPCode],
						[EffectiveFrom],
						[EffectiveTo],
						[Created_On],
						[Created_By],
						[Modified_On],
						[Modified_By]
				  FROM [Staging].[Org_HMPP_UOP]
			  )
			  AS Source 
		    ON Target.[UKPRN] = Source.[UKPRN]
			WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							Source.[UOPCode],
							Source.[EffectiveFrom],
							Source.[EffectiveTo]
					EXCEPT 
						SELECT 
							Target.[UOPCode],
							Target.[EffectiveFrom],
							Target.[EffectiveTo]
					)
		  THEN
			UPDATE SET   
				[UOPCode]=Source.[UOPCode],
				[EffectiveFrom]=Source.[EffectiveFrom],
				[EffectiveTo]=Source.[EffectiveTo],
				[Modified_On]=Source.[Modified_On],
				[Modified_By]=Source.[Modified_By]					
		WHEN NOT MATCHED BY TARGET THEN
		INSERT ( 
					[UKPRN],
					[UOPCode],
					[EffectiveFrom],
					[EffectiveTo],
					[Created_On],
					[Created_By],
					[Modified_On],
					[Modified_By]
				)
			VALUES ( 
					Source.[UKPRN],
					Source.[UOPCode],
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
