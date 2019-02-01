using System;
using System.Collections.Generic;

namespace ESFA.DC.ReferenceData.Organisations.Model
{
    public partial class ConditionOfFundingRemoval
    {
        public long Ukprn { get; set; }
        public decimal CoFremoval { get; set; }
        public DateTime EffectiveFrom { get; set; }
        public DateTime? EffectiveTo { get; set; }

        public virtual MasterOrganisation UkprnNavigation { get; set; }
    }
}
