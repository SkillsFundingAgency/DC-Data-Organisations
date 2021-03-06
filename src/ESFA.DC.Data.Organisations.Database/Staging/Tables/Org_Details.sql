﻿CREATE TABLE [Staging].[Org_Details]
(
	[UKPRN] BIGINT NOT NULL,
	[Name] NVARCHAR(250) NULL,
	[OrganisationCode] NVARCHAR(50) NULL,
	[SubLocation] NVARCHAR(250) NULL,
	[Location] NVARCHAR(250) NULL,
	[Street] NVARCHAR(250) NULL,
	[Town] NVARCHAR(250) NULL,
	[Locality] NVARCHAR(250) NULL,
	[Postcode] NVARCHAR(15) NULL,
	[ExternalData] NVARCHAR(250) NULL,
	[PhaseEduc] NVARCHAR(9) NULL,
	[GovOffReg] NVARCHAR(13) NULL,
	[LegalOrgType] NVARCHAR(50) NULL,
	[Status] NVARCHAR(50) NULL,
	[StatusExtended] NVARCHAR(75) NULL,
	[ThirdSector] INT NULL,
	[AccERGFold] INT NULL,
	[ContAppsTrainAgncy] INT NULL,
	[DanceDramaAward] INT NULL,
	[DirectFund] INT NULL,
	[EmpOnlyTrain] INT NULL,
	[IndepOrg] INT NULL,
	[IssueAuth] INT NULL,
	[LLDDIndepSpec] INT NULL,
	[NatSkillsAcademy] INT NULL,
	[PotThirdSector] INT NULL,
	[NASEmpUnit] INT NULL,
	[School6Form] INT NULL,
	[TertiaryColl] INT NULL,
	[OFSTEDEffect] NVARCHAR(250) NULL,
	[OFSTED_AchStnd] NVARCHAR(250) NULL,
	[DfEEstabNum] NVARCHAR(250) NULL,
	[EduBLocAuthSchEst] NVARCHAR(250) NULL,
	[EdubaseURN] NVARCHAR(250) NULL,
	[LEACode] NVARCHAR(250) NULL,
	[LocalAuthCode] NVARCHAR(250) NULL,
	[LongTermResid] INT NULL,
	[OfstedCareStds] INT NULL,
	[OFSTEDNonEduBURN] NVARCHAR(250) NULL,
	[SpecialResources] INT NULL,
	[StatryHighAge] INT NULL,
	[StatryLowAge] INT NULL,
	[OFSTEDRep] NVARCHAR(250) NULL,
	[OFSTEDInsp] NVARCHAR(250) NULL,
	[UKLearnProv] INT NULL,
	[AgencyTrainProv] INT NULL,
	[FundBody] INT NULL,
	[EducProv] INT NULL,
	[LocalAuthority] INT NULL,
	[RegCompany] INT NULL,
	[RegCharity] INT NULL,
	[Auditor] INT NULL,
	[AwardOrgCode] NVARCHAR(20) NULL,
	[SecSkillsCoun] INT NULL,
	[SectorLeadBody] INT NULL,
	[Regulator] INT NULL,
	[HMPP] INT NULL,
	[DanceAndDramaIndicator] INT NULL,
	[DirectFundedEmpIndicator] INT NULL,
	[Comment] NVARCHAR(max) NULL,
	[Created_On] DATETIME NOT NULL,
	[Created_By] NVARCHAR(100) NOT NULL,
	[Modified_On] DATETIME NOT NULL,
	[Modified_By] NVARCHAR(100) NOT NULL,
	[HESAProvider] BIT NULL,	
    CONSTRAINT [PK_Staging_Org_Details] PRIMARY KEY ([UKPRN])
)

GO
GRANT ALTER ON OBJECT::Staging.Org_Details TO [Org_RW_User];

