using System;
using System.Collections.Generic;

namespace ESFA.DC.ReferenceData.FCS.Model
{
    public partial class OrgDetails
    {
        public long Ukprn { get; set; }
        public string Name { get; set; }
        public string OrganisationCode { get; set; }
        public string SubLocation { get; set; }
        public string Location { get; set; }
        public string Street { get; set; }
        public string Town { get; set; }
        public string Locality { get; set; }
        public string Postcode { get; set; }
        public string ExternalData { get; set; }
        public string PhaseEduc { get; set; }
        public string GovOffReg { get; set; }
        public string LegalOrgType { get; set; }
        public string Status { get; set; }
        public string StatusExtended { get; set; }
        public int? ThirdSector { get; set; }
        public int? AccErgfold { get; set; }
        public int? ContAppsTrainAgncy { get; set; }
        public int? DanceDramaAward { get; set; }
        public int? DirectFund { get; set; }
        public int? EmpOnlyTrain { get; set; }
        public int? IndepOrg { get; set; }
        public int? IssueAuth { get; set; }
        public int? LlddindepSpec { get; set; }
        public int? NatSkillsAcademy { get; set; }
        public int? PotThirdSector { get; set; }
        public int? NasempUnit { get; set; }
        public int? School6Form { get; set; }
        public int? TertiaryColl { get; set; }
        public string Ofstedeffect { get; set; }
        public string OfstedAchStnd { get; set; }
        public string DfEestabNum { get; set; }
        public string EduBlocAuthSchEst { get; set; }
        public string EdubaseUrn { get; set; }
        public string Leacode { get; set; }
        public string LocalAuthCode { get; set; }
        public int? LongTermResid { get; set; }
        public int? OfstedCareStds { get; set; }
        public string OfstednonEduBurn { get; set; }
        public int? SpecialResources { get; set; }
        public int? StatryHighAge { get; set; }
        public int? StatryLowAge { get; set; }
        public string Ofstedrep { get; set; }
        public string Ofstedinsp { get; set; }
        public int? UklearnProv { get; set; }
        public int? AgencyTrainProv { get; set; }
        public int? FundBody { get; set; }
        public int? EducProv { get; set; }
        public int? LocalAuthority { get; set; }
        public int? RegCompany { get; set; }
        public int? RegCharity { get; set; }
        public int? Auditor { get; set; }
        public string AwardOrgCode { get; set; }
        public int? SecSkillsCoun { get; set; }
        public int? SectorLeadBody { get; set; }
        public int? Regulator { get; set; }
        public int? Hmpp { get; set; }
        public int? DanceAndDramaIndicator { get; set; }
        public int? DirectFundedEmpIndicator { get; set; }
        public string Comment { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedBy { get; set; }
        public bool? Hesaprovider { get; set; }

        public virtual MasterOrganisations UkprnNavigation { get; set; }
    }
}
