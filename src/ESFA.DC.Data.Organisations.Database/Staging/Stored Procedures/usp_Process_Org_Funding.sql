CREATE PROCEDURE [Staging].[usp_Process_Org_Funding]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY

		MERGE INTO [dbo].[Org_Funding] AS Target
		USING (
				SELECT  DISTINCT 
						[UKPRN],
						[FundModelName],
						[FundingFactor],
						[FundingFactorType],
						[FundingFactorValue],
						[EffectiveFrom],
						[EffectiveTo],
						[CODACode],
						[Comment],
						[Created_On],
						[Created_By],
						[Modified_On],
						[Modified_By]
				  FROM [Staging].[Org_Funding]
			  )
			  AS Source 
		     ON Target.[UKPRN] = Source.[UKPRN]
			AND Target.[FundingFactorType] = Source.[FundingFactorType]
			AND Target.[FundingFactor] = Source.[FundingFactor]
			AND Target.[EffectiveFrom] = Source.[EffectiveFrom]

			WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							Source.[FundModelName],
							Source.[FundingFactorValue],
							Source.[EffectiveTo],
							Source.[CODACode],
							Source.[Comment]
					EXCEPT 
						SELECT 
							Target.[FundModelName],
							Target.[FundingFactorValue],
							Target.[EffectiveTo],
							Target.[CODACode],
							Target.[Comment]
					)
		  THEN
			UPDATE SET   
				[FundModelName]=Source.[FundModelName],
				[FundingFactorValue]=Source.[FundingFactorValue],
				[EffectiveTo]=Source.[EffectiveTo],
				[CODACode]=Source.[CODACode],
				[Comment]=Source.[Comment],
				[Modified_On]=Source.[Modified_On],
				[Modified_By]=Source.[Modified_By]					
		WHEN NOT MATCHED BY TARGET THEN
		INSERT ( 
					[UKPRN],
					[FundModelName],
					[FundingFactor],
					[FundingFactorType],
					[FundingFactorValue],
					[EffectiveFrom],
					[EffectiveTo],
					[CODACode],
					[Comment],
					[Created_On],
					[Created_By],
					[Modified_On],
					[Modified_By]
				)
			VALUES ( 
					Source.[UKPRN],
					Source.[FundModelName],
					Source.[FundingFactor],
					Source.[FundingFactorType],
					Source.[FundingFactorValue],
					Source.[EffectiveFrom],
					Source.[EffectiveTo],
					Source.[CODACode],
					Source.[Comment],
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
