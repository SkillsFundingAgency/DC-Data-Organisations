CREATE TABLE [dbo].[Org_PartnerUKPRN]
(
	[UKPRN] BIGINT NOT NULL,
	[NameLegal] NVARCHAR(15) NOT NULL,
	[EffectiveFrom] DATE NOT NULL,
	[EffectiveTo] DATE NULL,
	[Created_On] DATETIME NOT NULL, 
	[Created_By] NVARCHAR(100) NOT NULL,
	[Modified_On] DATETIME NOT NULL,
	[Modified_By] NVARCHAR(100) NOT NULL,
    CONSTRAINT [FK_Org_PartnerUKPRN] FOREIGN KEY ([UKPRN]) REFERENCES [MasterOrganisations]([UKPRN]),
    PRIMARY KEY ([UKPRN], [EffectiveFrom])
)