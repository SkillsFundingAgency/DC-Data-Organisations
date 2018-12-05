using System;
using System.Collections.Generic;

namespace ESFA.DC.ReferenceData.FCS.Model
{
    public partial class OrgFunding
    {
        public long Ukprn { get; set; }
        public string FundModelName { get; set; }
        public string FundingFactor { get; set; }
        public string FundingFactorType { get; set; }
        public string FundingFactorValue { get; set; }
        public DateTime EffectiveFrom { get; set; }
        public DateTime? EffectiveTo { get; set; }
        public string Codacode { get; set; }
        public string Comment { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedBy { get; set; }

        public virtual MasterOrganisations UkprnNavigation { get; set; }
    }
}
