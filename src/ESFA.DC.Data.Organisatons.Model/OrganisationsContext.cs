using ESFA.DC.Data.Organisations.Model.Interface;
using Microsoft.EntityFrameworkCore;

namespace ESFA.DC.Data.Organisations.Model
{
    public partial class OrganisationsContext : DbContext, IOrganisationsContext
    {
        public OrganisationsContext()
        {
        }

        public OrganisationsContext(DbContextOptions<OrganisationsContext> options)
            : base(options)
        {
        }

        public virtual DbSet<MasterOrganisations> MasterOrganisations { get; set; }
        public virtual DbSet<OrgDataGeneration> OrgDataGeneration { get; set; }
        public virtual DbSet<OrgDetails> OrgDetails { get; set; }
        public virtual DbSet<OrgFunding> OrgFunding { get; set; }
        public virtual DbSet<OrgHmppPostcode> OrgHmppPostcode { get; set; }
        public virtual DbSet<OrgHmppUop> OrgHmppUop { get; set; }
        public virtual DbSet<OrgPartnerUkprn> OrgPartnerUkprn { get; set; }
        public virtual DbSet<OrgUkprnUpin> OrgUkprnUpin { get; set; }
        public virtual DbSet<OrgVersion> OrgVersion { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=(localdb)\\MSSQLLocalDB;Database=Org;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.0-rtm-35687");

            modelBuilder.Entity<MasterOrganisations>(entity =>
            {
                entity.HasKey(e => e.Ukprn);

                entity.Property(e => e.Ukprn)
                    .HasColumnName("UKPRN")
                    .ValueGeneratedNever();
            });

            modelBuilder.Entity<OrgDataGeneration>(entity =>
            {
                entity.HasKey(e => e.DataGeneratedOn)
                    .HasName("PK_Org_DataGeneratedOn");

                entity.ToTable("Org_DataGeneration");

                entity.Property(e => e.DataGeneratedOn).HasColumnType("datetime");

                entity.Property(e => e.Comment).HasMaxLength(500);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasColumnName("Created_By")
                    .HasMaxLength(100);

                entity.Property(e => e.CreatedOn)
                    .HasColumnName("Created_On")
                    .HasColumnType("datetime");

                entity.Property(e => e.Description).HasMaxLength(500);
            });

            modelBuilder.Entity<OrgDetails>(entity =>
            {
                entity.HasKey(e => e.Ukprn)
                    .HasName("PK__Org_Deta__50F26B71F7C05D9C");

                entity.ToTable("Org_Details");

                entity.Property(e => e.Ukprn)
                    .HasColumnName("UKPRN")
                    .ValueGeneratedNever();

                entity.Property(e => e.AccErgfold).HasColumnName("AccERGFold");

                entity.Property(e => e.AwardOrgCode).HasMaxLength(20);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasColumnName("Created_By")
                    .HasMaxLength(100);

                entity.Property(e => e.CreatedOn)
                    .HasColumnName("Created_On")
                    .HasColumnType("datetime");

                entity.Property(e => e.DfEestabNum)
                    .HasColumnName("DfEEstabNum")
                    .HasMaxLength(250);

                entity.Property(e => e.EduBlocAuthSchEst)
                    .HasColumnName("EduBLocAuthSchEst")
                    .HasMaxLength(250);

                entity.Property(e => e.EdubaseUrn)
                    .HasColumnName("EdubaseURN")
                    .HasMaxLength(250);

                entity.Property(e => e.ExternalData).HasMaxLength(250);

                entity.Property(e => e.GovOffReg).HasMaxLength(13);

                entity.Property(e => e.Hesaprovider).HasColumnName("HESAProvider");

                entity.Property(e => e.Hmpp).HasColumnName("HMPP");

                entity.Property(e => e.Leacode)
                    .HasColumnName("LEACode")
                    .HasMaxLength(250);

                entity.Property(e => e.LegalOrgType).HasMaxLength(50);

                entity.Property(e => e.LlddindepSpec).HasColumnName("LLDDIndepSpec");

                entity.Property(e => e.LocalAuthCode).HasMaxLength(250);

                entity.Property(e => e.Locality).HasMaxLength(250);

                entity.Property(e => e.Location).HasMaxLength(250);

                entity.Property(e => e.ModifiedBy)
                    .IsRequired()
                    .HasColumnName("Modified_By")
                    .HasMaxLength(100);

                entity.Property(e => e.ModifiedOn)
                    .HasColumnName("Modified_On")
                    .HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(250);

                entity.Property(e => e.NasempUnit).HasColumnName("NASEmpUnit");

                entity.Property(e => e.OfstedAchStnd)
                    .HasColumnName("OFSTED_AchStnd")
                    .HasMaxLength(250);

                entity.Property(e => e.Ofstedeffect)
                    .HasColumnName("OFSTEDEffect")
                    .HasMaxLength(250);

                entity.Property(e => e.Ofstedinsp)
                    .HasColumnName("OFSTEDInsp")
                    .HasMaxLength(250);

                entity.Property(e => e.OfstednonEduBurn)
                    .HasColumnName("OFSTEDNonEduBURN")
                    .HasMaxLength(250);

                entity.Property(e => e.Ofstedrep)
                    .HasColumnName("OFSTEDRep")
                    .HasMaxLength(250);

                entity.Property(e => e.OrganisationCode).HasMaxLength(50);

                entity.Property(e => e.PhaseEduc).HasMaxLength(9);

                entity.Property(e => e.Postcode).HasMaxLength(15);

                entity.Property(e => e.Status).HasMaxLength(50);

                entity.Property(e => e.StatusExtended).HasMaxLength(75);

                entity.Property(e => e.Street).HasMaxLength(250);

                entity.Property(e => e.SubLocation).HasMaxLength(250);

                entity.Property(e => e.Town).HasMaxLength(250);

                entity.Property(e => e.UklearnProv).HasColumnName("UKLearnProv");

                entity.HasOne(d => d.UkprnNavigation)
                    .WithOne(p => p.OrgDetails)
                    .HasForeignKey<OrgDetails>(d => d.Ukprn)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Org_Details_UKPRN");
            });

            modelBuilder.Entity<OrgFunding>(entity =>
            {
                entity.HasKey(e => new { e.Ukprn, e.FundingFactorType, e.FundingFactor, e.EffectiveFrom })
                    .HasName("PK__Org_Fund__CB23E3DE4E328440");

                entity.ToTable("Org_Funding");

                entity.Property(e => e.Ukprn).HasColumnName("UKPRN");

                entity.Property(e => e.FundingFactorType).HasMaxLength(100);

                entity.Property(e => e.FundingFactor).HasMaxLength(250);

                entity.Property(e => e.EffectiveFrom).HasColumnType("date");

                entity.Property(e => e.Codacode)
                    .HasColumnName("CODACode")
                    .HasMaxLength(10);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasColumnName("Created_By")
                    .HasMaxLength(100);

                entity.Property(e => e.CreatedOn)
                    .HasColumnName("Created_On")
                    .HasColumnType("datetime");

                entity.Property(e => e.EffectiveTo).HasColumnType("date");

                entity.Property(e => e.FundModelName)
                    .IsRequired()
                    .HasMaxLength(250);

                entity.Property(e => e.FundingFactorValue)
                    .IsRequired()
                    .HasMaxLength(250);

                entity.Property(e => e.ModifiedBy)
                    .IsRequired()
                    .HasColumnName("Modified_By")
                    .HasMaxLength(100);

                entity.Property(e => e.ModifiedOn)
                    .HasColumnName("Modified_On")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.UkprnNavigation)
                    .WithMany(p => p.OrgFunding)
                    .HasForeignKey(d => d.Ukprn)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Org_Funding");
            });

            modelBuilder.Entity<OrgHmppPostcode>(entity =>
            {
                entity.HasKey(e => new { e.Ukprn, e.HmpppostCode, e.EffectiveFrom })
                    .HasName("PK__Org_HMPP__3BF64923E255257F");

                entity.ToTable("Org_HMPP_Postcode");

                entity.Property(e => e.Ukprn).HasColumnName("UKPRN");

                entity.Property(e => e.HmpppostCode)
                    .HasColumnName("HMPPPostCode")
                    .HasMaxLength(15);

                entity.Property(e => e.EffectiveFrom).HasColumnType("date");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasColumnName("Created_By")
                    .HasMaxLength(100);

                entity.Property(e => e.CreatedOn)
                    .HasColumnName("Created_On")
                    .HasColumnType("datetime");

                entity.Property(e => e.EffectiveTo).HasColumnType("date");

                entity.Property(e => e.ModifiedBy)
                    .IsRequired()
                    .HasColumnName("Modified_By")
                    .HasMaxLength(100);

                entity.Property(e => e.ModifiedOn)
                    .HasColumnName("Modified_On")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.UkprnNavigation)
                    .WithMany(p => p.OrgHmppPostcode)
                    .HasForeignKey(d => d.Ukprn)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Org_HMPP_Postcode");
            });

            modelBuilder.Entity<OrgHmppUop>(entity =>
            {
                entity.HasKey(e => new { e.Ukprn, e.Uopcode, e.EffectiveFrom })
                    .HasName("PK__Org_HMPP__8CC5E974E4F1CA56");

                entity.ToTable("Org_HMPP_UOP");

                entity.Property(e => e.Ukprn).HasColumnName("UKPRN");

                entity.Property(e => e.Uopcode)
                    .HasColumnName("UOPCode")
                    .HasMaxLength(15);

                entity.Property(e => e.EffectiveFrom).HasColumnType("date");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasColumnName("Created_By")
                    .HasMaxLength(100);

                entity.Property(e => e.CreatedOn)
                    .HasColumnName("Created_On")
                    .HasColumnType("datetime");

                entity.Property(e => e.EffectiveTo).HasColumnType("date");

                entity.Property(e => e.ModifiedBy)
                    .IsRequired()
                    .HasColumnName("Modified_By")
                    .HasMaxLength(100);

                entity.Property(e => e.ModifiedOn)
                    .HasColumnName("Modified_On")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.UkprnNavigation)
                    .WithMany(p => p.OrgHmppUop)
                    .HasForeignKey(d => d.Ukprn)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Org_HMPP_UOP");
            });

            modelBuilder.Entity<OrgPartnerUkprn>(entity =>
            {
                entity.HasKey(e => new { e.Ukprn, e.EffectiveFrom })
                    .HasName("PK__Org_Part__175AE8806780BE40");

                entity.ToTable("Org_PartnerUKPRN");

                entity.Property(e => e.Ukprn).HasColumnName("UKPRN");

                entity.Property(e => e.EffectiveFrom).HasColumnType("date");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasColumnName("Created_By")
                    .HasMaxLength(100);

                entity.Property(e => e.CreatedOn)
                    .HasColumnName("Created_On")
                    .HasColumnType("datetime");

                entity.Property(e => e.EffectiveTo).HasColumnType("date");

                entity.Property(e => e.ModifiedBy)
                    .IsRequired()
                    .HasColumnName("Modified_By")
                    .HasMaxLength(100);

                entity.Property(e => e.ModifiedOn)
                    .HasColumnName("Modified_On")
                    .HasColumnType("datetime");

                entity.Property(e => e.NameLegal)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.HasOne(d => d.UkprnNavigation)
                    .WithMany(p => p.OrgPartnerUkprn)
                    .HasForeignKey(d => d.Ukprn)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Org_PartnerUKPRN");
            });

            modelBuilder.Entity<OrgUkprnUpin>(entity =>
            {
                entity.HasKey(e => new { e.Ukprn, e.Upin, e.EffectiveFrom })
                    .HasName("PK__Org_UKPR__8FE2958920F488BA");

                entity.ToTable("Org_UKPRN_UPIN");

                entity.Property(e => e.Ukprn).HasColumnName("UKPRN");

                entity.Property(e => e.Upin).HasColumnName("UPIN");

                entity.Property(e => e.EffectiveFrom).HasColumnType("date");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasColumnName("Created_By")
                    .HasMaxLength(100);

                entity.Property(e => e.CreatedOn)
                    .HasColumnName("Created_On")
                    .HasColumnType("datetime");

                entity.Property(e => e.EffectiveTo).HasColumnType("date");

                entity.Property(e => e.ModifiedBy)
                    .IsRequired()
                    .HasColumnName("Modified_By")
                    .HasMaxLength(100);

                entity.Property(e => e.ModifiedOn)
                    .HasColumnName("Modified_On")
                    .HasColumnType("datetime");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(250);

                entity.Property(e => e.StatusEffectiveFrom).HasColumnType("date");

                entity.Property(e => e.StatusEffectiveTo).HasColumnType("date");

                entity.HasOne(d => d.UkprnNavigation)
                    .WithMany(p => p.OrgUkprnUpin)
                    .HasForeignKey(d => d.Ukprn)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Org_UKPRN_UPIN");
            });

            modelBuilder.Entity<OrgVersion>(entity =>
            {
                entity.HasKey(e => new { e.MajorNumber, e.MinorNumber, e.MaintenanceNumber });

                entity.ToTable("Org_Version");

                entity.Property(e => e.ActivationDate).HasColumnType("date");

                entity.Property(e => e.Comment).HasMaxLength(500);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasColumnName("Created_By")
                    .HasMaxLength(100);

                entity.Property(e => e.CreatedOn)
                    .HasColumnName("Created_On")
                    .HasColumnType("datetime");

                entity.Property(e => e.Description).HasMaxLength(500);

                entity.Property(e => e.ExpiryDate).HasColumnType("date");

                entity.Property(e => e.MainDataSchemaName).HasMaxLength(256);

                entity.Property(e => e.ModifiedBy)
                    .IsRequired()
                    .HasColumnName("Modified_By")
                    .HasMaxLength(100);

                entity.Property(e => e.ModifiedOn)
                    .HasColumnName("Modified_On")
                    .HasColumnType("datetime");

                entity.Property(e => e.RefDataSchemaName).HasMaxLength(256);
            });
        }
    }
}
