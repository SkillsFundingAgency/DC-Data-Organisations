using System;
using System.Collections.Generic;

namespace ESFA.DC.ReferenceData.FCS.Model
{
    public partial class MasterOrganisations
    {
        public MasterOrganisations()
        {
            ConditionOfFundingRemoval = new HashSet<ConditionOfFundingRemoval>();
            OrgFunding = new HashSet<OrgFunding>();
            OrgHmppPostcode = new HashSet<OrgHmppPostcode>();
            OrgHmppUop = new HashSet<OrgHmppUop>();
            OrgPartnerUkprn = new HashSet<OrgPartnerUkprn>();
            OrgUkprnUpin = new HashSet<OrgUkprnUpin>();
        }

        public long Ukprn { get; set; }

        public virtual OrgDetails OrgDetails { get; set; }
        public virtual ICollection<ConditionOfFundingRemoval> ConditionOfFundingRemoval { get; set; }
        public virtual ICollection<OrgFunding> OrgFunding { get; set; }
        public virtual ICollection<OrgHmppPostcode> OrgHmppPostcode { get; set; }
        public virtual ICollection<OrgHmppUop> OrgHmppUop { get; set; }
        public virtual ICollection<OrgPartnerUkprn> OrgPartnerUkprn { get; set; }
        public virtual ICollection<OrgUkprnUpin> OrgUkprnUpin { get; set; }
    }
}
