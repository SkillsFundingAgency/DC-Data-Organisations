using System;
using System.Collections.Generic;

namespace ESFA.DC.ReferenceData.Organisations.Model
{
    public partial class CampusIdentifier
    {
        public long MasterUkprn { get; set; }
        public string CampusIdentifier1 { get; set; }
        public long? OriginalUkprn { get; set; }
        public DateTime EffectiveFrom { get; set; }
        public DateTime? EffectiveTo { get; set; }
    }
}
