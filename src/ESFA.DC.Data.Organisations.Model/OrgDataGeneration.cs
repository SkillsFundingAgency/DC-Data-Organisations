using System;
using System.Collections.Generic;

namespace ESFA.DC.ReferenceData.Organisations.Model
{
    public partial class OrgDataGeneration
    {
        public DateTime DataGeneratedOn { get; set; }
        public string Description { get; set; }
        public string Comment { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
    }
}
