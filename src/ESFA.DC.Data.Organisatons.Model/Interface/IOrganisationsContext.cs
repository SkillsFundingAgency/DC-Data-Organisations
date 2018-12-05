
using Microsoft.EntityFrameworkCore;

namespace ESFA.DC.Data.Organisations.Model.Interface
{
     public interface IOrganisationsContext
    {
        DbSet<MasterOrganisations> MasterOrganisations { get; set; }
        DbSet<OrgDataGeneration> OrgDataGeneration { get; set; }
        DbSet<OrgDetails> OrgDetails { get; set; }
        DbSet<OrgFunding> OrgFunding { get; set; }
        DbSet<OrgHmppPostcode> OrgHmppPostcode { get; set; }
        DbSet<OrgHmppUop> OrgHmppUop { get; set; }
        DbSet<OrgPartnerUkprn> OrgPartnerUkprn { get; set; }
        DbSet<OrgUkprnUpin> OrgUkprnUpin { get; set; }
        DbSet<OrgVersion> OrgVersion { get; set; }
    }
}
