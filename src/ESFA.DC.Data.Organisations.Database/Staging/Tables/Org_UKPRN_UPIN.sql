CREATE TABLE [Staging].[Org_UKPRN_UPIN]
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
    CONSTRAINT [PK_Staging_Org_UKPRN_UPIN] PRIMARY KEY ([UKPRN], [UPIN], [EffectiveFrom])
)

GO
GRANT ALTER ON OBJECT::Staging.Org_UKPRN_UPIN TO [Org_RW_User];

