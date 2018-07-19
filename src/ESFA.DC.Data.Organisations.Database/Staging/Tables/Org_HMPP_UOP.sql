CREATE TABLE [Staging].[Org_HMPP_UOP]
(
	[UKPRN] BIGINT NOT NULL,
	[UOPCode] NVARCHAR(15) NOT NULL,
	[EffectiveFrom] DATE NOT NULL,
	[EffectiveTo] DATE NULL,
	[Created_On] DATETIME NOT NULL, 
	[Created_By] NVARCHAR(100) NOT NULL,
	[Modified_On] DATETIME NOT NULL,
	[Modified_By] NVARCHAR(100) NOT NULL,
    PRIMARY KEY ([UKPRN], [UOPCode], [EffectiveFrom])
)