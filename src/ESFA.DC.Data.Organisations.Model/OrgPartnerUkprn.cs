using System;
using System.Collections.Generic;

namespace ESFA.DC.ReferenceData.Organisations.Model
{
    public partial class OrgPartnerUkprn
    {
        public long Ukprn { get; set; }
        public string NameLegal { get; set; }
        public DateTime EffectiveFrom { get; set; }
        public DateTime? EffectiveTo { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedBy { get; set; }

        public virtual MasterOrganisation UkprnNavigation { get; set; }
    }
}
