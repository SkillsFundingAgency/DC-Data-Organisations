CREATE TABLE [Staging].[Org_Version] (
	[MajorNumber] INT NOT NULL,
	[MinorNumber] INT NOT NULL,
	[MaintenanceNumber] INT NOT NULL,
	[MainDataSchemaName] NVARCHAR(256) NULL,
	[RefDataSchemaName] NVARCHAR(256) NULL,
	[ActivationDate] DATE NOT NULL,
	[ExpiryDate] DATE NULL,
	[Description] NVARCHAR(500) NULL,
	[Comment] NVARCHAR(500) NULL,
	[Created_On] DATETIME NOT NULL,
	[Created_By] NVARCHAR(100) NOT NULL,
	[Modified_On] DATETIME NOT NULL,
	[Modified_By] NVARCHAR(100) NOT NULL,
    CONSTRAINT [PK_Org_Version] PRIMARY KEY CLUSTERED ([MajorNumber], [MinorNumber], [MaintenanceNumber])
);

