using System;
using System.Collections.Generic;

namespace ESFA.DC.ReferenceData.FCS.Model
{
    public partial class ConditionOfFundingRemoval
    {
        public long Ukprn { get; set; }
        public decimal CoFremoval { get; set; }
        public DateTime EffectiveFrom { get; set; }
        public DateTime? EffectiveTo { get; set; }

        public virtual MasterOrganisations UkprnNavigation { get; set; }
    }
}
