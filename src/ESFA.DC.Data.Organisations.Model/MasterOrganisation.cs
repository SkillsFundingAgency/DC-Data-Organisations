using System;
using System.Collections.Generic;

namespace ESFA.DC.ReferenceData.Organisations.Model
{
    public partial class MasterOrganisation
    {
        public MasterOrganisation()
        {
            ConditionOfFundingRemovals = new HashSet<ConditionOfFundingRemoval>();
            OrgFundings = new HashSet<OrgFunding>();
            OrgHmppPostcodes = new HashSet<OrgHmppPostcode>();
            OrgHmppUops = new HashSet<OrgHmppUop>();
            OrgPartnerUkprns = new HashSet<OrgPartnerUkprn>();
            OrgUkprnUpins = new HashSet<OrgUkprnUpin>();
        }

        public long Ukprn { get; set; }

        public virtual OrgDetail OrgDetail { get; set; }
        public virtual ICollection<ConditionOfFundingRemoval> ConditionOfFundingRemovals { get; set; }
        public virtual ICollection<OrgFunding> OrgFundings { get; set; }
        public virtual ICollection<OrgHmppPostcode> OrgHmppPostcodes { get; set; }
        public virtual ICollection<OrgHmppUop> OrgHmppUops { get; set; }
        public virtual ICollection<OrgPartnerUkprn> OrgPartnerUkprns { get; set; }
        public virtual ICollection<OrgUkprnUpin> OrgUkprnUpins { get; set; }
    }
}
