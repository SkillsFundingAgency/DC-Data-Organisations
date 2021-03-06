﻿CREATE TABLE [dbo].[Org_Funding]
(
	[UKPRN] BIGINT NOT NULL,
	[FundModelName] NVARCHAR(250) NOT NULL,
	[FundingFactor] NVARCHAR(250) NOT NULL,
	[FundingFactorType] NVARCHAR(100) NOT NULL,
	[FundingFactorValue] NVARCHAR(250) NOT NULL,
	[EffectiveFrom] DATE NOT NULL,
	[EffectiveTo] DATE NULL,
	[CODACode] NVARCHAR(10) NULL,
	[Comment] NVARCHAR(max) NULL,
	[Created_On] DATETIME NOT NULL,
	[Created_By] NVARCHAR(100) NOT NULL,
	[Modified_On] DATETIME NOT NULL,
	[Modified_By] NVARCHAR(100) NOT NULL,
    CONSTRAINT [FK_Org_Funding] FOREIGN KEY ([UKPRN]) REFERENCES [MasterOrganisations]([UKPRN]),
    PRIMARY KEY ([UKPRN] ASC, [FundingFactorType] ASC, [FundingFactor] ASC, [EffectiveFrom] ASC)
)