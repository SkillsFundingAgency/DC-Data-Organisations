CREATE TABLE [Staging].[MasterOrganisations] (
    [UKPRN] BIGINT NOT NULL,
    CONSTRAINT [PK_Staging_MasterOrganisations] PRIMARY KEY CLUSTERED ([UKPRN] ASC)
);

GO
GRANT ALTER ON OBJECT::Staging.MasterOrganisations TO [Org_RW_User];

