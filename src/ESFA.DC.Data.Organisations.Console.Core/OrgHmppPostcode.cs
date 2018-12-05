using System;
using System.Collections.Generic;

namespace ESFA.DC.ReferenceData.FCS.Model
{
    public partial class OrgHmppPostcode
    {
        public long Ukprn { get; set; }
        public string HmpppostCode { get; set; }
        public DateTime EffectiveFrom { get; set; }
        public DateTime? EffectiveTo { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedBy { get; set; }

        public virtual MasterOrganisations UkprnNavigation { get; set; }
    }
}
