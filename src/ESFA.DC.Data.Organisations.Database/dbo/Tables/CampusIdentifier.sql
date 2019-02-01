CREATE TABLE [dbo].[CampusIdentifier](
	[MasterUKPRN] [bigint] NOT NULL,
	[CampusIdentifier] [varchar](8) NOT NULL,
	[OriginalUKPRN] [bigint] NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NULL, 
    CONSTRAINT [PK_dbo_CampusIdentifier] PRIMARY KEY ([MasterUKPRN], [CampusIdentifier], [EffectiveFrom])
) ON [PRIMARY]