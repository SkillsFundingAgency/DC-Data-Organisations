CREATE PROCEDURE [Staging].[usp_Process_Org_Details]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY

		MERGE INTO [dbo].[Org_Details] AS Target
		USING (
				SELECT [UKPRN]
					  ,[Name]
					  ,[OrganisationCode]
					  ,[SubLocation]
					  ,[Location]
					  ,[Street]
					  ,[Town]
					  ,[Locality]
					  ,[Postcode]
					  ,[ExternalData]
					  ,[PhaseEduc]
					  ,[GovOffReg]
					  ,[LegalOrgType]
					  ,[Status]
					  ,[StatusExtended]
					  ,[ThirdSector]
					  ,[AccERGFold]
					  ,[ContAppsTrainAgncy]
					  ,[DanceDramaAward]
					  ,[DirectFund]
					  ,[EmpOnlyTrain]
					  ,[IndepOrg]
					  ,[IssueAuth]
					  ,[LLDDIndepSpec]
					  ,[NatSkillsAcademy]
					  ,[PotThirdSector]
					  ,[NASEmpUnit]
					  ,[School6Form]
					  ,[TertiaryColl]
					  ,[OFSTEDEffect]
					  ,[OFSTED_AchStnd]
					  ,[DfEEstabNum]
					  ,[EduBLocAuthSchEst]
					  ,[EdubaseURN]
					  ,[LEACode]
					  ,[LocalAuthCode]
					  ,[LongTermResid]
					  ,[OfstedCareStds]
					  ,[OFSTEDNonEduBURN]
					  ,[SpecialResources]
					  ,[StatryHighAge]
					  ,[StatryLowAge]
					  ,[OFSTEDRep]
					  ,[OFSTEDInsp]
					  ,[UKLearnProv]
					  ,[AgencyTrainProv]
					  ,[FundBody]
					  ,[EducProv]
					  ,[LocalAuthority]
					  ,[RegCompany]
					  ,[RegCharity]
					  ,[Auditor]
					  ,[AwardOrgCode]
					  ,[SecSkillsCoun]
					  ,[SectorLeadBody]
					  ,[Regulator]
					  ,[HMPP]
					  ,[DanceAndDramaIndicator]
					  ,[DirectFundedEmpIndicator]
					  ,[Comment]
					  ,[Created_On]
					  ,[Created_By]
					  ,[Modified_On]
					  ,[Modified_By]
					  ,[HESAProvider]
				  FROM [Staging].[Org_Details]
			  )
			  AS Source 
		    ON Target.[UKPRN] = Source.[UKPRN]
			WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[Name]
							,Target.[OrganisationCode]
							,Target.[SubLocation]
							,Target.[Location]
							,Target.[Street]
							,Target.[Town]
							,Target.[Locality]
							,Target.[Postcode]
							,Target.[ExternalData]
							,Target.[PhaseEduc]
							,Target.[GovOffReg]
							,Target.[LegalOrgType]
							,Target.[Status]
							,Target.[StatusExtended]
							,Target.[ThirdSector]
							,Target.[AccERGFold]
							,Target.[ContAppsTrainAgncy]
							,Target.[DanceDramaAward]
							,Target.[DirectFund]
							,Target.[EmpOnlyTrain]
							,Target.[IndepOrg]
							,Target.[IssueAuth]
							,Target.[LLDDIndepSpec]
							,Target.[NatSkillsAcademy]
							,Target.[PotThirdSector]
							,Target.[NASEmpUnit]
							,Target.[School6Form]
							,Target.[TertiaryColl]
							,Target.[OFSTEDEffect]
							,Target.[OFSTED_AchStnd]
							,Target.[DfEEstabNum]
							,Target.[EduBLocAuthSchEst]
							,Target.[EdubaseURN]
							,Target.[LEACode]
							,Target.[LocalAuthCode]
							,Target.[LongTermResid]
							,Target.[OfstedCareStds]
							,Target.[OFSTEDNonEduBURN]
							,Target.[SpecialResources]
							,Target.[StatryHighAge]
							,Target.[StatryLowAge]
							,Target.[OFSTEDRep]
							,Target.[OFSTEDInsp]
							,Target.[UKLearnProv]
							,Target.[AgencyTrainProv]
							,Target.[FundBody]
							,Target.[EducProv]
							,Target.[LocalAuthority]
							,Target.[RegCompany]
							,Target.[RegCharity]
							,Target.[Auditor]
							,Target.[AwardOrgCode]
							,Target.[SecSkillsCoun]
							,Target.[SectorLeadBody]
							,Target.[Regulator]
							,Target.[HMPP]
							,Target.[DanceAndDramaIndicator]
							,Target.[DirectFundedEmpIndicator]
							,Target.[Comment]
							,Target.[Created_On]
							,Target.[Created_By]
							,Target.[Modified_On]
							,Target.[Modified_By]
							,Target.[HESAProvider]			
					EXCEPT 
						SELECT 
							 Source.[Name]
							,Source.[OrganisationCode]
							,Source.[SubLocation]
							,Source.[Location]
							,Source.[Street]
							,Source.[Town]
							,Source.[Locality]
							,Source.[Postcode]
							,Source.[ExternalData]
							,Source.[PhaseEduc]
							,Source.[GovOffReg]
							,Source.[LegalOrgType]
							,Source.[Status]
							,Source.[StatusExtended]
							,Source.[ThirdSector]
							,Source.[AccERGFold]
							,Source.[ContAppsTrainAgncy]
							,Source.[DanceDramaAward]
							,Source.[DirectFund]
							,Source.[EmpOnlyTrain]
							,Source.[IndepOrg]
							,Source.[IssueAuth]
							,Source.[LLDDIndepSpec]
							,Source.[NatSkillsAcademy]
							,Source.[PotThirdSector]
							,Source.[NASEmpUnit]
							,Source.[School6Form]
							,Source.[TertiaryColl]
							,Source.[OFSTEDEffect]
							,Source.[OFSTED_AchStnd]
							,Source.[DfEEstabNum]
							,Source.[EduBLocAuthSchEst]
							,Source.[EdubaseURN]
							,Source.[LEACode]
							,Source.[LocalAuthCode]
							,Source.[LongTermResid]
							,Source.[OfstedCareStds]
							,Source.[OFSTEDNonEduBURN]
							,Source.[SpecialResources]
							,Source.[StatryHighAge]
							,Source.[StatryLowAge]
							,Source.[OFSTEDRep]
							,Source.[OFSTEDInsp]
							,Source.[UKLearnProv]
							,Source.[AgencyTrainProv]
							,Source.[FundBody]
							,Source.[EducProv]
							,Source.[LocalAuthority]
							,Source.[RegCompany]
							,Source.[RegCharity]
							,Source.[Auditor]
							,Source.[AwardOrgCode]
							,Source.[SecSkillsCoun]
							,Source.[SectorLeadBody]
							,Source.[Regulator]
							,Source.[HMPP]
							,Source.[DanceAndDramaIndicator]
							,Source.[DirectFundedEmpIndicator]
							,Source.[Comment]
							,Source.[Created_On]
							,Source.[Created_By]
							,Source.[Modified_On]
							,Source.[Modified_By]
							,Source.[HESAProvider]
					)
		  THEN
			UPDATE SET   
				[UKPRN]=Source.[UKPRN],
				[Name]=Source.[Name],
				[OrganisationCode]=Source.[OrganisationCode],
				[SubLocation]=Source.[SubLocation],
				[Location]=Source.[Location],
				[Street]=Source.[Street],
				[Town]=Source.[Town],
				[Locality]=Source.[Locality],
				[Postcode]=Source.[Postcode],
				[ExternalData]=Source.[ExternalData],
				[PhaseEduc]=Source.[PhaseEduc],
				[GovOffReg]=Source.[GovOffReg],
				[LegalOrgType]=Source.[LegalOrgType],
				[Status]=Source.[Status],
				[StatusExtended]=Source.[StatusExtended],
				[ThirdSector]=Source.[ThirdSector],
				[AccERGFold]=Source.[AccERGFold],
				[ContAppsTrainAgncy]=Source.[ContAppsTrainAgncy],
				[DanceDramaAward]=Source.[DanceDramaAward],
				[DirectFund]=Source.[DirectFund],
				[EmpOnlyTrain]=Source.[EmpOnlyTrain],
				[IndepOrg]=Source.[IndepOrg],
				[IssueAuth]=Source.[IssueAuth],
				[LLDDIndepSpec]=Source.[LLDDIndepSpec],
				[NatSkillsAcademy]=Source.[NatSkillsAcademy],
				[PotThirdSector]=Source.[PotThirdSector],
				[NASEmpUnit]=Source.[NASEmpUnit],
				[School6Form]=Source.[School6Form],
				[TertiaryColl]=Source.[TertiaryColl],
				[OFSTEDEffect]=Source.[OFSTEDEffect],
				[OFSTED_AchStnd]=Source.[OFSTED_AchStnd],
				[DfEEstabNum]=Source.[DfEEstabNum],
				[EduBLocAuthSchEst]=Source.[EduBLocAuthSchEst],
				[EdubaseURN]=Source.[EdubaseURN],
				[LEACode]=Source.[LEACode],
				[LocalAuthCode]=Source.[LocalAuthCode],
				[LongTermResid]=Source.[LongTermResid],
				[OfstedCareStds]=Source.[OfstedCareStds],
				[OFSTEDNonEduBURN]=Source.[OFSTEDNonEduBURN],
				[SpecialResources]=Source.[SpecialResources],
				[StatryHighAge]=Source.[StatryHighAge],
				[StatryLowAge]=Source.[StatryLowAge],
				[OFSTEDRep]=Source.[OFSTEDRep],
				[OFSTEDInsp]=Source.[OFSTEDInsp],
				[UKLearnProv]=Source.[UKLearnProv],
				[AgencyTrainProv]=Source.[AgencyTrainProv],
				[FundBody]=Source.[FundBody],
				[EducProv]=Source.[EducProv],
				[LocalAuthority]=Source.[LocalAuthority],
				[RegCompany]=Source.[RegCompany],
				[RegCharity]=Source.[RegCharity],
				[Auditor]=Source.[Auditor],
				[AwardOrgCode]=Source.[AwardOrgCode],
				[SecSkillsCoun]=Source.[SecSkillsCoun],
				[SectorLeadBody]=Source.[SectorLeadBody],
				[Regulator]=Source.[Regulator],
				[HMPP]=Source.[HMPP],
				[DanceAndDramaIndicator]=Source.[DanceAndDramaIndicator],
				[DirectFundedEmpIndicator]=Source.[DirectFundedEmpIndicator],
				[Comment]=Source.[Comment],
				[Created_On]=Source.[Created_On],
				[Created_By]=Source.[Created_By],
				[Modified_On]=Source.[Modified_On],
				[Modified_By]=Source.[Modified_By],
				[HESAProvider]=Source.[HESAProvider]			
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (   [UKPRN]
				  ,[Name]
				  ,[OrganisationCode]
				  ,[SubLocation]
				  ,[Location]
				  ,[Street]
				  ,[Town]
				  ,[Locality]
				  ,[Postcode]
				  ,[ExternalData]
				  ,[PhaseEduc]
				  ,[GovOffReg]
				  ,[LegalOrgType]
				  ,[Status]
				  ,[StatusExtended]
				  ,[ThirdSector]
				  ,[AccERGFold]
				  ,[ContAppsTrainAgncy]
				  ,[DanceDramaAward]
				  ,[DirectFund]
				  ,[EmpOnlyTrain]
				  ,[IndepOrg]
				  ,[IssueAuth]
				  ,[LLDDIndepSpec]
				  ,[NatSkillsAcademy]
				  ,[PotThirdSector]
				  ,[NASEmpUnit]
				  ,[School6Form]
				  ,[TertiaryColl]
				  ,[OFSTEDEffect]
				  ,[OFSTED_AchStnd]
				  ,[DfEEstabNum]
				  ,[EduBLocAuthSchEst]
				  ,[EdubaseURN]
				  ,[LEACode]
				  ,[LocalAuthCode]
				  ,[LongTermResid]
				  ,[OfstedCareStds]
				  ,[OFSTEDNonEduBURN]
				  ,[SpecialResources]
				  ,[StatryHighAge]
				  ,[StatryLowAge]
				  ,[OFSTEDRep]
				  ,[OFSTEDInsp]
				  ,[UKLearnProv]
				  ,[AgencyTrainProv]
				  ,[FundBody]
				  ,[EducProv]
				  ,[LocalAuthority]
				  ,[RegCompany]
				  ,[RegCharity]
				  ,[Auditor]
				  ,[AwardOrgCode]
				  ,[SecSkillsCoun]
				  ,[SectorLeadBody]
				  ,[Regulator]
				  ,[HMPP]
				  ,[DanceAndDramaIndicator]
				  ,[DirectFundedEmpIndicator]
				  ,[Comment]
				  ,[Created_On]
				  ,[Created_By]
				  ,[Modified_On]
				  ,[Modified_By]
				  ,[HESAProvider]
					)
			VALUES ( 
					Source.[UKPRN],
					Source.[Name],
					Source.[OrganisationCode],
					Source.[SubLocation],
					Source.[Location],
					Source.[Street],
					Source.[Town],
					Source.[Locality],
					Source.[Postcode],
					Source.[ExternalData],
					Source.[PhaseEduc],
					Source.[GovOffReg],
					Source.[LegalOrgType],
					Source.[Status],
					Source.[StatusExtended],
					Source.[ThirdSector],
					Source.[AccERGFold],
					Source.[ContAppsTrainAgncy],
					Source.[DanceDramaAward],
					Source.[DirectFund],
					Source.[EmpOnlyTrain],
					Source.[IndepOrg],
					Source.[IssueAuth],
					Source.[LLDDIndepSpec],
					Source.[NatSkillsAcademy],
					Source.[PotThirdSector],
					Source.[NASEmpUnit],
					Source.[School6Form],
					Source.[TertiaryColl],
					Source.[OFSTEDEffect],
					Source.[OFSTED_AchStnd],
					Source.[DfEEstabNum],
					Source.[EduBLocAuthSchEst],
					Source.[EdubaseURN],
					Source.[LEACode],
					Source.[LocalAuthCode],
					Source.[LongTermResid],
					Source.[OfstedCareStds],
					Source.[OFSTEDNonEduBURN],
					Source.[SpecialResources],
					Source.[StatryHighAge],
					Source.[StatryLowAge],
					Source.[OFSTEDRep],
					Source.[OFSTEDInsp],
					Source.[UKLearnProv],
					Source.[AgencyTrainProv],
					Source.[FundBody],
					Source.[EducProv],
					Source.[LocalAuthority],
					Source.[RegCompany],
					Source.[RegCharity],
					Source.[Auditor],
					Source.[AwardOrgCode],
					Source.[SecSkillsCoun],
					Source.[SectorLeadBody],
					Source.[Regulator],
					Source.[HMPP],
					Source.[DanceAndDramaIndicator],
					Source.[DirectFundedEmpIndicator],
					Source.[Comment],
					Source.[Created_On],
					Source.[Created_By],
					Source.[Modified_On],
					Source.[Modified_By],
					Source.[HESAProvider]
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
