
CREATE TABLE [dbo].[ConditionOfFundingRemoval](
	[UKPRN]			[bigint] NOT NULL,
	[CoFRemoval]	[decimal](9, 2) NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo]	[date] NULL,
    CONSTRAINT [PK_ConditionOfFundingRemoval] PRIMARY KEY CLUSTERED ([UKPRN], [EffectiveFrom]),
	CONSTRAINT [FK_ConditionOfFundingRemoval_OrgDetails_UKPRN] FOREIGN KEY ([UKPRN]) REFERENCES [MasterOrganisations]([UKPRN])
)