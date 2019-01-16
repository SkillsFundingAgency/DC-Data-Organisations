
using System.Threading;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;

namespace ESFA.DC.ReferenceData.Organisations.Model.Interface
{
     public interface IOrganisationsContext
    {
        DbSet<CampusIdentifier> CampusIdentifiers { get; set; }
        DbSet<ConditionOfFundingRemoval> ConditionOfFundingRemovals { get; set; }
        DbSet<MasterOrganisation> MasterOrganisations { get; set; }
        DbSet<OrgDataGeneration> OrgDataGenerations { get; set; }
        DbSet<OrgDetail> OrgDetails { get; set; }
        DbSet<OrgFunding> OrgFundings { get; set; }
        DbSet<OrgHmppPostcode> OrgHmppPostcodes { get; set; }
        DbSet<OrgHmppUop> OrgHmppUops { get; set; }
        DbSet<OrgPartnerUkprn> OrgPartnerUkprns { get; set; }
        DbSet<OrgUkprnUpin> OrgUkprnUpins { get; set; }
        DbSet<OrgVersion> OrgVersions { get; set; }

        DatabaseFacade Database { get; }

        Task<int> SaveChangesAsync(CancellationToken cancellationToken);
    }
}
