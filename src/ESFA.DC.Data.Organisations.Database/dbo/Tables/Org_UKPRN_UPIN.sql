CREATE TABLE [dbo].[Org_UKPRN_UPIN]
(
	[UKPRN] BIGINT NOT NULL,
	[UPIN] INT NOT NULL,
	[Status] NVARCHAR(250) NOT NULL,
	[StatusEffectiveFrom] DATE NOT NULL,
	[StatusEffectiveTo] DATE NULL,
	[EffectiveFrom] DATE NOT NULL,
	[EffectiveTo] DATE NULL,
	[Created_On] DATETIME NOT NULL,
	[Created_By] NVARCHAR(100) NOT NULL,
	[Modified_On] DATETIME NOT NULL,
	[Modified_By] NVARCHAR(100) NOT NULL,
    CONSTRAINT [FK_Org_UKPRN_UPIN] FOREIGN KEY ([UKPRN]) REFERENCES [MasterOrganisations]([UKPRN]),
    PRIMARY KEY ([UKPRN], [UPIN], [EffectiveFrom])
)