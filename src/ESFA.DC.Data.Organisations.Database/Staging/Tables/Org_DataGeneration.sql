CREATE TABLE [Staging].[Org_DataGeneration]
(
	[DataGeneratedOn] DATETIME NOT NULL,
	[Description] NVARCHAR(500) NULL,
	[Comment] NVARCHAR(500) NULL,
	[Created_On] DATETIME NOT NULL,
	[Created_By] NVARCHAR(100) NOT NULL,
    CONSTRAINT [PK_Org_DataGeneratedOn] PRIMARY KEY ([DataGeneratedOn]))
