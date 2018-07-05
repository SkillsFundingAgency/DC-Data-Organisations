﻿CREATE PROCEDURE [Staging].[usp_Process_MasterOrganisation]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY

		MERGE INTO [dbo].[Org_Details] AS Target
		USING (
				SELECT DISTINCT [UKPRN]
				FROM
				(
					SELECT [UKPRN]
					  FROM [dbo].[Org_Details]
				--UNION
				--	SELECT [UKPRN]
				--	  FROM [dbo].[Org_Funding]
				) as AllRecords
			  )
			  AS Source 
		    ON Target.[UKPRN] = Source.[UKPRN]
		--WHEN MATCHED 
		--		AND EXISTS 
		--			(	SELECT 
		--					 Target.[Name]
		--			EXCEPT 
		--				SELECT 
		--					 Source.[Name]
		--			)
		--  THEN
		--	UPDATE SET   
		--		[UKPRN]=Source.[UKPRN]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (   [UKPRN]				  
					)
			VALUES ( 
					Source.[UKPRN]
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