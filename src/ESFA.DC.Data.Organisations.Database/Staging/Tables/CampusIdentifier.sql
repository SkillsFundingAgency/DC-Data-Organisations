CREATE TABLE [Staging].[CampusIdentifier]
(
	[MasterUKPRN] [bigint] NULL,
	[CampusIdentifier] [varchar](8) NULL,
	[OriginalUKPRN] [bigint] NULL,
	[EffectiveFrom] [date] NULL,
	[EffectiveTo] [date] NULL, 
) ON [PRIMARY]
