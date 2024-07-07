using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace GiroDashboard.Domain;

public partial class PbwebContext : DbContext
{
    public PbwebContext()
    {
    }

    public PbwebContext(DbContextOptions<PbwebContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Aylar> Aylars { get; set; }

    public virtual DbSet<Log> Logs { get; set; }

    public virtual DbSet<Proje> Projes { get; set; }

    public virtual DbSet<TblMblog> TblMblogs { get; set; }

    public virtual DbSet<Tblaciksubeler> Tblaciksubelers { get; set; }

    public virtual DbSet<Tblgenelfiltre> Tblgenelfiltres { get; set; }

    public virtual DbSet<Tbliplog> Tbliplogs { get; set; }

    public virtual DbSet<Tblkullanici> Tblkullanicis { get; set; }

    public virtual DbSet<Tblmbkullanici> Tblmbkullanicis { get; set; }

    public virtual DbSet<Tblmblraporgrup> Tblmblraporgrups { get; set; }

    public virtual DbSet<Tblmbrapor> Tblmbrapors { get; set; }

    public virtual DbSet<TblmbraporFiltre> TblmbraporFiltres { get; set; }

    public virtual DbSet<Tblmbraporkolon> Tblmbraporkolons { get; set; }

    public virtual DbSet<Tblmenu> Tblmenus { get; set; }

    public virtual DbSet<Tblrol> Tblrols { get; set; }

    public virtual DbSet<Tbltemp> Tbltemps { get; set; }

    public virtual DbSet<Tbltemp2> Tbltemp2s { get; set; }

    public virtual DbSet<Tbltemp6> Tbltemp6s { get; set; }

    public virtual DbSet<Tblyetki> Tblyetkis { get; set; }

    public virtual DbSet<UrysTblDashboard> UrysTblDashboards { get; set; }

    public virtual DbSet<UrysTblIkonset> UrysTblIkonsets { get; set; }

    public virtual DbSet<UrysTblRapor> UrysTblRapors { get; set; }

    public virtual DbSet<UrysTblRaporfiltre> UrysTblRaporfiltres { get; set; }

    public virtual DbSet<UrysTblRaporgrup> UrysTblRaporgrups { get; set; }

    public virtual DbSet<UrysTblRaporkolon> UrysTblRaporkolons { get; set; }

    public virtual DbSet<UrysViewKullliste> UrysViewKulllistes { get; set; }

    public virtual DbSet<UrysViewMobilyetki> UrysViewMobilyetkis { get; set; }

    public virtual DbSet<VwYetkiMenu> VwYetkiMenus { get; set; }

    public virtual DbSet<Yillar> Yillars { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=FRKISYNT;Database=PBWEB;User Id=staj;Password=Staj2024.;Trusted_Connection=False; TrustServerCertificate=True; MultipleActiveResultSets=true;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.UseCollation("Turkish_CI_AS");

        modelBuilder.Entity<Aylar>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("AYLAR");

            entity.Property(e => e.Adi)
                .HasMaxLength(7)
                .IsUnicode(false)
                .HasColumnName("ADI");
            entity.Property(e => e.Ay).HasColumnName("AY");
        });

        modelBuilder.Entity<Log>(entity =>
        {
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
        });

        modelBuilder.Entity<Proje>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("PROJE");

            entity.Property(e => e.Brm).HasMaxLength(255);
            entity.Property(e => e.Kdv).HasMaxLength(255);
            entity.Property(e => e.KdvHariçMal)
                .HasColumnType("money")
                .HasColumnName("KDV_Hariç_Mal");
            entity.Property(e => e.Pa)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("PA");
            entity.Property(e => e.SatışFiyatı).HasColumnType("money");
            entity.Property(e => e.StokNo).HasMaxLength(255);
            entity.Property(e => e.UrunAdı).HasMaxLength(255);
            entity.Property(e => e.UrunKodu).HasMaxLength(255);
            entity.Property(e => e._2020).HasColumnName("2020");
            entity.Property(e => e._2021).HasColumnName("2021");
            entity.Property(e => e._2022).HasColumnName("2022");
            entity.Property(e => e._2023).HasColumnName("2023");
        });

        modelBuilder.Entity<TblMblog>(entity =>
        {
            entity.ToTable("TblMBLogs");

            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
        });

        modelBuilder.Entity<Tblaciksubeler>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("TBLACIKSUBELER");

            entity.Property(e => e.KullId).HasColumnName("KULL_ID");
            entity.Property(e => e.Subeler)
                .HasMaxLength(500)
                .IsUnicode(false)
                .HasColumnName("SUBELER");
        });

        modelBuilder.Entity<Tblgenelfiltre>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("TBLGENELFILTRE");

            entity.Property(e => e.Deger)
                .HasMaxLength(10)
                .IsFixedLength()
                .HasColumnName("DEGER");
            entity.Property(e => e.Id).HasColumnName("ID");
        });

        modelBuilder.Entity<Tbliplog>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("TBLIPLOG");

            entity.Property(e => e.Ip)
                .HasMaxLength(50)
                .HasColumnName("IP");
            entity.Property(e => e.KullKodu)
                .HasMaxLength(50)
                .HasColumnName("KULL_KODU");
            entity.Property(e => e.Mesaj)
                .HasMaxLength(500)
                .HasColumnName("MESAJ");
            entity.Property(e => e.Tarih)
                .HasColumnType("datetime")
                .HasColumnName("TARIH");
        });

        modelBuilder.Entity<Tblkullanici>(entity =>
        {
            entity.HasKey(e => e.KullId).HasName("PK_KULLANICI_1");

            entity.ToTable("TBLKULLANICI", tb => tb.HasTrigger("KullaniciAcikSubeler"));

            entity.Property(e => e.KullId).HasColumnName("KULL_ID");
            entity.Property(e => e.AcikSubeler)
                .HasMaxLength(500)
                .IsUnicode(false)
                .HasColumnName("ACIK_SUBELER");
            entity.Property(e => e.DashboardYetki)
                .HasMaxLength(1)
                .IsUnicode(false)
                .HasColumnName("DASHBOARD_YETKI");
            entity.Property(e => e.KullAdi)
                .HasMaxLength(50)
                .HasColumnName("KULL_ADI");
            entity.Property(e => e.KullEposta)
                .HasMaxLength(50)
                .HasColumnName("KULL_EPOSTA");
            entity.Property(e => e.KullKodu)
                .HasMaxLength(50)
                .HasColumnName("KULL_KODU");
            entity.Property(e => e.KullParola)
                .HasMaxLength(50)
                .HasColumnName("KULL_PAROLA");
            entity.Property(e => e.KullResim)
                .HasMaxLength(250)
                .HasColumnName("KULL_RESIM");
            entity.Property(e => e.KullRolid).HasColumnName("KULL_ROLID");
            entity.Property(e => e.KullTelefon)
                .HasMaxLength(50)
                .HasColumnName("KULL_TELEFON");
            entity.Property(e => e.PersonelCariKodu)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("PERSONEL_CARI_KODU");
            entity.Property(e => e.RIdate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("R_IDATE");
            entity.Property(e => e.RIkull).HasColumnName("R_IKULL");
            entity.Property(e => e.RUdate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("R_UDATE");
            entity.Property(e => e.RUkull).HasColumnName("R_UKULL");
            entity.Property(e => e.SifreDegistiMi)
                .HasMaxLength(5)
                .IsUnicode(false)
                .HasColumnName("SIFRE_DEGISTI_MI");
            entity.Property(e => e.SonGirisIp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("SON_GIRIS_IP");
            entity.Property(e => e.SonGirisTarih)
                .HasColumnType("smalldatetime")
                .HasColumnName("SON_GIRIS_TARIH");
            entity.Property(e => e.TcNo)
                .HasMaxLength(11)
                .IsUnicode(false)
                .HasColumnName("TC_NO");
            entity.Property(e => e.VarsayilanKasaKodu)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("VARSAYILAN_KASA_KODU");
            entity.Property(e => e.VarsayilanRaporId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("VARSAYILAN_RAPOR_ID");
            entity.Property(e => e.YaziciMacAdresi)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("YAZICI_MAC_ADRESI");
        });

        modelBuilder.Entity<Tblmbkullanici>(entity =>
        {
            entity.HasKey(e => e.KullId);

            entity.ToTable("TBLMBKullanici");

            entity.Property(e => e.KullId)
                .ValueGeneratedNever()
                .HasColumnName("KULL_ID");
            entity.Property(e => e.AcikSubeler)
                .HasMaxLength(500)
                .IsUnicode(false)
                .HasColumnName("ACIK_SUBELER");
            entity.Property(e => e.DashboardYetki)
                .HasMaxLength(1)
                .IsUnicode(false)
                .HasColumnName("DASHBOARD_YETKI");
            entity.Property(e => e.KullAdi)
                .HasMaxLength(50)
                .HasColumnName("KULL_ADI");
            entity.Property(e => e.KullEposta)
                .HasMaxLength(50)
                .HasColumnName("KULL_EPOSTA");
            entity.Property(e => e.KullKodu)
                .HasMaxLength(50)
                .HasColumnName("KULL_KODU");
            entity.Property(e => e.KullParola)
                .HasMaxLength(50)
                .HasColumnName("KULL_PAROLA");
            entity.Property(e => e.KullResim)
                .HasMaxLength(250)
                .HasColumnName("KULL_RESIM");
            entity.Property(e => e.KullRolid).HasColumnName("KULL_ROLID");
            entity.Property(e => e.KullTelefon)
                .HasMaxLength(50)
                .HasColumnName("KULL_TELEFON");
            entity.Property(e => e.PersonelCariKodu)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("PERSONEL_CARI_KODU");
            entity.Property(e => e.RIdate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("R_IDATE");
            entity.Property(e => e.RIkull).HasColumnName("R_IKULL");
            entity.Property(e => e.RUdate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("R_UDATE");
            entity.Property(e => e.RUkull).HasColumnName("R_UKULL");
            entity.Property(e => e.SifreDegistiMi)
                .HasMaxLength(5)
                .IsUnicode(false)
                .HasColumnName("SIFRE_DEGISTI_MI");
            entity.Property(e => e.SonGirisIp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("SON_GIRIS_IP");
            entity.Property(e => e.SonGirisTarih)
                .HasColumnType("smalldatetime")
                .HasColumnName("SON_GIRIS_TARIH");
            entity.Property(e => e.TcNo)
                .HasMaxLength(11)
                .IsUnicode(false)
                .HasColumnName("TC_NO");
            entity.Property(e => e.VarsayilanKasaKodu)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("VARSAYILAN_KASA_KODU");
            entity.Property(e => e.VarsayilanRaporId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("VARSAYILAN_RAPOR_ID");
            entity.Property(e => e.YaziciMacAdresi)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("YAZICI_MAC_ADRESI");
        });

        modelBuilder.Entity<Tblmblraporgrup>(entity =>
        {
            entity.HasKey(e => e.GrupKodu).HasName("TBLMBL_RAPORGRUP");

            entity.ToTable("TBLMBLRAPORGRUP");

            entity.Property(e => e.GrupKodu)
                .HasMaxLength(50)
                .HasColumnName("GRUP_KODU");
            entity.Property(e => e.GrupAciklama)
                .HasMaxLength(50)
                .HasColumnName("GRUP_ACIKLAMA");
            entity.Property(e => e.GrupIkon)
                .HasMaxLength(250)
                .HasColumnName("GRUP_IKON");
            entity.Property(e => e.Id).HasColumnName("ID");
        });

        modelBuilder.Entity<Tblmbrapor>(entity =>
        {
            entity.HasKey(e => e.RaporKodu);

            entity.ToTable("TBLMBRapor");

            entity.Property(e => e.RaporKodu)
                .HasMaxLength(50)
                .HasColumnName("RAPOR_KODU");
            entity.Property(e => e.Filtre)
                .HasMaxLength(500)
                .HasColumnName("FILTRE");
            entity.Property(e => e.GosterimTipi)
                .HasMaxLength(1)
                .HasColumnName("GOSTERIM_TIPI");
            entity.Property(e => e.GrupKodu)
                .HasMaxLength(50)
                .HasColumnName("GRUP_KODU");
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.RaporAdi)
                .HasMaxLength(50)
                .HasColumnName("RAPOR_ADI");
            entity.Property(e => e.RaporIkon)
                .HasMaxLength(250)
                .HasColumnName("RAPOR_IKON");
            entity.Property(e => e.SqlProcAdi)
                .HasMaxLength(150)
                .HasColumnName("SQL_PROC_ADI");
        });

        modelBuilder.Entity<TblmbraporFiltre>(entity =>
        {
            entity.HasKey(e => new { e.RaporKodu, e.FiltreKodu });

            entity.ToTable("TBLMBRaporFiltre");

            entity.Property(e => e.RaporKodu)
                .HasMaxLength(50)
                .HasColumnName("RAPOR_KODU");
            entity.Property(e => e.FiltreKodu)
                .HasMaxLength(150)
                .HasColumnName("FILTRE_KODU");
            entity.Property(e => e.FiltreBaslik)
                .HasMaxLength(50)
                .HasColumnName("FILTRE_BASLIK");
            entity.Property(e => e.FiltreDeger)
                .HasMaxLength(4000)
                .HasColumnName("FILTRE_DEGER");
            entity.Property(e => e.FiltreSira).HasColumnName("FILTRE_SIRA");
            entity.Property(e => e.FiltreTip)
                .HasMaxLength(50)
                .HasColumnName("FILTRE_TIP");
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.VarsayilanDeger)
                .HasMaxLength(50)
                .HasColumnName("VARSAYILAN_DEGER");
        });

        modelBuilder.Entity<Tblmbraporkolon>(entity =>
        {
            entity.HasKey(e => new { e.RaporKodu, e.Kolon });

            entity.ToTable("TBLMBRAPORKOLON");

            entity.Property(e => e.RaporKodu)
                .HasMaxLength(50)
                .HasColumnName("RAPOR_KODU");
            entity.Property(e => e.Kolon)
                .HasMaxLength(150)
                .HasColumnName("KOLON");
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.KolonAltToplam)
                .HasMaxLength(1)
                .HasColumnName("KOLON_ALT_TOPLAM");
            entity.Property(e => e.KolonBaslik)
                .HasMaxLength(50)
                .HasColumnName("KOLON_BASLIK");
            entity.Property(e => e.KolonTip)
                .HasMaxLength(50)
                .HasColumnName("KOLON_TIP");
        });

        modelBuilder.Entity<Tblmenu>(entity =>
        {
            entity.HasKey(e => e.MenuId).HasName("PK_MENU");

            entity.ToTable("TBLMENU");

            entity.Property(e => e.MenuId).HasColumnName("MENU_ID");
            entity.Property(e => e.Action)
                .HasMaxLength(50)
                .HasColumnName("ACTION");
            entity.Property(e => e.Controller)
                .HasMaxLength(50)
                .HasColumnName("CONTROLLER");
            entity.Property(e => e.GorunurMu)
                .HasMaxLength(50)
                .HasColumnName("GORUNUR_MU");
            entity.Property(e => e.MenuAdi)
                .HasMaxLength(50)
                .HasColumnName("MENU_ADI");
            entity.Property(e => e.MenuIkon).HasColumnName("MENU_IKON");
            entity.Property(e => e.MenuUrl)
                .HasMaxLength(50)
                .HasColumnName("MENU_URL");
            entity.Property(e => e.RIdate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("R_IDATE");
            entity.Property(e => e.RIkull).HasColumnName("R_IKULL");
            entity.Property(e => e.RUdate)
                .HasColumnType("datetime")
                .HasColumnName("R_UDATE");
            entity.Property(e => e.RUkull).HasColumnName("R_UKULL");
            entity.Property(e => e.Sira).HasColumnName("SIRA");
            entity.Property(e => e.UstMenuId).HasColumnName("UST_MENU_ID");
        });

        modelBuilder.Entity<Tblrol>(entity =>
        {
            entity.HasKey(e => e.RolId).HasName("PK_ROL");

            entity.ToTable("TBLROL");

            entity.Property(e => e.RolId).HasColumnName("ROL_ID");
            entity.Property(e => e.RIdate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("R_IDATE");
            entity.Property(e => e.RIkull).HasColumnName("R_IKULL");
            entity.Property(e => e.RUdate)
                .HasColumnType("datetime")
                .HasColumnName("R_UDATE");
            entity.Property(e => e.RUkull).HasColumnName("R_UKULL");
            entity.Property(e => e.RolAciklama)
                .HasMaxLength(50)
                .HasColumnName("ROL_ACIKLAMA");
        });

        modelBuilder.Entity<Tbltemp>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("TBLTEMP");

            entity.Property(e => e.FisSayisi).HasColumnName("FIS_SAYISI");
            entity.Property(e => e.Kasano).HasColumnName("KASANO");
            entity.Property(e => e.MagazaAd)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("MAGAZA_AD");
            entity.Property(e => e.MagazaNo).HasColumnName("MAGAZA_NO");
            entity.Property(e => e.NetCiro)
                .HasColumnType("decimal(28, 2)")
                .HasColumnName("NET_CIRO");
            entity.Property(e => e.Yc)
                .HasColumnType("decimal(28, 2)")
                .HasColumnName("YC");
        });

        modelBuilder.Entity<Tbltemp2>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("TBLTEMP2");

            entity.Property(e => e.FisSayisi).HasColumnName("FIS_SAYISI");
            entity.Property(e => e.Kasano).HasColumnName("KASANO");
            entity.Property(e => e.MagazaAd)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("MAGAZA_AD");
            entity.Property(e => e.MagazaNo).HasColumnName("MAGAZA_NO");
            entity.Property(e => e.NetCiro)
                .HasColumnType("decimal(28, 2)")
                .HasColumnName("NET_CIRO");
            entity.Property(e => e.Yc)
                .HasColumnType("decimal(28, 2)")
                .HasColumnName("YC");
        });

        modelBuilder.Entity<Tbltemp6>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("TBLTEMP6");

            entity.Property(e => e.Ay).HasColumnName("AY");
            entity.Property(e => e.Genel)
                .HasColumnType("decimal(28, 2)")
                .HasColumnName("GENEL");
            entity.Property(e => e.Magaza)
                .HasColumnType("decimal(28, 2)")
                .HasColumnName("MAGAZA");
            entity.Property(e => e.MagazaAd)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("MAGAZA_AD");
            entity.Property(e => e.Magno).HasColumnName("MAGNO");
            entity.Property(e => e.Oran)
                .HasColumnType("decimal(28, 2)")
                .HasColumnName("ORAN");
            entity.Property(e => e.Yil).HasColumnName("YIL");
        });

        modelBuilder.Entity<Tblyetki>(entity =>
        {
            entity.HasKey(e => e.YetkiId).HasName("PK_YETKI");

            entity.ToTable("TBLYETKI");

            entity.Property(e => e.YetkiId).HasColumnName("YETKI_ID");
            entity.Property(e => e.GuncelleYetki).HasColumnName("GUNCELLE_YETKI");
            entity.Property(e => e.IzlemeYetki).HasColumnName("IZLEME_YETKI");
            entity.Property(e => e.KayitYetki).HasColumnName("KAYIT_YETKI");
            entity.Property(e => e.MenuId).HasColumnName("MENU_ID");
            entity.Property(e => e.RIdate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("R_IDATE");
            entity.Property(e => e.RIkull).HasColumnName("R_IKULL");
            entity.Property(e => e.RUdate)
                .HasColumnType("datetime")
                .HasColumnName("R_UDATE");
            entity.Property(e => e.RUkull).HasColumnName("R_UKULL");
            entity.Property(e => e.RolId).HasColumnName("ROL_ID");
            entity.Property(e => e.SilYetki).HasColumnName("SIL_YETKI");

            entity.HasOne(d => d.Menu).WithMany(p => p.Tblyetkis)
                .HasForeignKey(d => d.MenuId)
                .HasConstraintName("FK_YETKI_MENU");
        });

        modelBuilder.Entity<UrysTblDashboard>(entity =>
        {
            entity.ToTable("URYS_TBL_DASHBOARD");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Aciklama)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("ACIKLAMA");
            entity.Property(e => e.AktifPasif).HasColumnName("AKTIF_PASIF");
            entity.Property(e => e.Genislik)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("GENISLIK");
            entity.Property(e => e.Ikon)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("IKON");
            entity.Property(e => e.RaporAdi)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("RAPOR_ADI");
            entity.Property(e => e.RaporBaslik)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("RAPOR_BASLIK");
            entity.Property(e => e.RaporProc)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("RAPOR_PROC");
            entity.Property(e => e.RaporSiraNo).HasColumnName("RAPOR_SIRA_NO");
            entity.Property(e => e.RaporTipi).HasColumnName("RAPOR_TIPI");
            entity.Property(e => e.SiraNo).HasColumnName("SIRA_NO");
        });

        modelBuilder.Entity<UrysTblIkonset>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("URYS_TBL_IKONSET");

            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.IkonKodu)
                .HasMaxLength(150)
                .HasColumnName("IKON_KODU");
            entity.Property(e => e.IkonUrl)
                .HasMaxLength(250)
                .HasColumnName("IKON_URL");
        });

        modelBuilder.Entity<UrysTblRapor>(entity =>
        {
            entity.HasKey(e => e.RaporKodu);

            entity.ToTable("URYS_TBL_RAPOR");

            entity.Property(e => e.RaporKodu)
                .HasMaxLength(50)
                .HasColumnName("RAPOR_KODU");
            entity.Property(e => e.Filtre)
                .HasMaxLength(500)
                .HasColumnName("FILTRE");
            entity.Property(e => e.GosterimTipi)
                .HasMaxLength(1)
                .HasColumnName("GOSTERIM_TIPI");
            entity.Property(e => e.GrupKodu)
                .HasMaxLength(50)
                .HasColumnName("GRUP_KODU");
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.RaporAdi)
                .HasMaxLength(50)
                .HasColumnName("RAPOR_ADI");
            entity.Property(e => e.RaporIkon)
                .HasMaxLength(250)
                .HasColumnName("RAPOR_IKON");
            entity.Property(e => e.SqlProcAdi)
                .HasMaxLength(150)
                .HasColumnName("SQL_PROC_ADI");
        });

        modelBuilder.Entity<UrysTblRaporfiltre>(entity =>
        {
            entity.HasKey(e => new { e.RaporKodu, e.FiltreKodu });

            entity.ToTable("URYS_TBL_RAPORFILTRE");

            entity.Property(e => e.RaporKodu)
                .HasMaxLength(50)
                .HasColumnName("RAPOR_KODU");
            entity.Property(e => e.FiltreKodu)
                .HasMaxLength(150)
                .HasColumnName("FILTRE_KODU");
            entity.Property(e => e.FiltreBaslik)
                .HasMaxLength(50)
                .HasColumnName("FILTRE_BASLIK");
            entity.Property(e => e.FiltreDeger)
                .HasMaxLength(4000)
                .HasColumnName("FILTRE_DEGER");
            entity.Property(e => e.FiltreSira).HasColumnName("FILTRE_SIRA");
            entity.Property(e => e.FiltreTip)
                .HasMaxLength(50)
                .HasColumnName("FILTRE_TIP");
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.VarsayilanDeger)
                .HasMaxLength(50)
                .HasColumnName("VARSAYILAN_DEGER");
        });

        modelBuilder.Entity<UrysTblRaporgrup>(entity =>
        {
            entity.HasKey(e => e.GrupKodu);

            entity.ToTable("URYS_TBL_RAPORGRUP");

            entity.Property(e => e.GrupKodu)
                .HasMaxLength(50)
                .HasColumnName("GRUP_KODU");
            entity.Property(e => e.GrupAciklama)
                .HasMaxLength(50)
                .HasColumnName("GRUP_ACIKLAMA");
            entity.Property(e => e.GrupIkon)
                .HasMaxLength(250)
                .HasColumnName("GRUP_IKON");
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
        });

        modelBuilder.Entity<UrysTblRaporkolon>(entity =>
        {
            entity.HasKey(e => new { e.RaporKodu, e.Kolon });

            entity.ToTable("URYS_TBL_RAPORKOLON");

            entity.Property(e => e.RaporKodu)
                .HasMaxLength(50)
                .HasColumnName("RAPOR_KODU");
            entity.Property(e => e.Kolon)
                .HasMaxLength(150)
                .HasColumnName("KOLON");
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.KolonAltToplam)
                .HasMaxLength(1)
                .HasColumnName("KOLON_ALT_TOPLAM");
            entity.Property(e => e.KolonBaslik)
                .HasMaxLength(50)
                .HasColumnName("KOLON_BASLIK");
            entity.Property(e => e.KolonTip)
                .HasMaxLength(50)
                .HasColumnName("KOLON_TIP");
        });

        modelBuilder.Entity<UrysViewKullliste>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("URYS_VIEW_KULLLISTE");

            entity.Property(e => e.KullaniciAdi)
                .HasMaxLength(50)
                .HasColumnName("KULLANICI_ADI");
            entity.Property(e => e.KullaniciIsim)
                .HasMaxLength(50)
                .HasColumnName("KULLANICI_ISIM");
            entity.Property(e => e.KullaniciNo)
                .ValueGeneratedOnAdd()
                .HasColumnName("KULLANICI_NO");
            entity.Property(e => e.RolId).HasColumnName("ROL_ID");
            entity.Property(e => e.Sifre)
                .HasMaxLength(50)
                .HasColumnName("SIFRE");
        });

        modelBuilder.Entity<UrysViewMobilyetki>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("URYS_VIEW_MOBILYETKI");

            entity.Property(e => e.GuncelleYetki).HasColumnName("GUNCELLE_YETKI");
            entity.Property(e => e.IzlemeYetki).HasColumnName("IZLEME_YETKI");
            entity.Property(e => e.KayitYetki).HasColumnName("KAYIT_YETKI");
            entity.Property(e => e.MenuAdi)
                .HasMaxLength(50)
                .HasColumnName("MENU_ADI");
            entity.Property(e => e.RolId).HasColumnName("ROL_ID");
            entity.Property(e => e.SilYetki).HasColumnName("SIL_YETKI");
        });

        modelBuilder.Entity<VwYetkiMenu>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_YetkiMenu");

            entity.Property(e => e.Controller)
                .HasMaxLength(50)
                .HasColumnName("CONTROLLER");
            entity.Property(e => e.GorunurMu)
                .HasMaxLength(50)
                .HasColumnName("GORUNUR_MU");
            entity.Property(e => e.GuncelleYetki).HasColumnName("GUNCELLE_YETKI");
            entity.Property(e => e.IzlemeYetki).HasColumnName("IZLEME_YETKI");
            entity.Property(e => e.KayitYetki).HasColumnName("KAYIT_YETKI");
            entity.Property(e => e.MenuAdi)
                .HasMaxLength(50)
                .HasColumnName("MENU_ADI");
            entity.Property(e => e.MenuId).HasColumnName("MENU_ID");
            entity.Property(e => e.RolId).HasColumnName("ROL_ID");
            entity.Property(e => e.SilYetki).HasColumnName("SIL_YETKI");
            entity.Property(e => e.YetkiId).HasColumnName("YETKI_ID");
        });

        modelBuilder.Entity<Yillar>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("YILLAR");

            entity.Property(e => e.Yil).HasColumnName("YIL");
            entity.Property(e => e.Yiladi)
                .HasMaxLength(35)
                .IsUnicode(false)
                .HasColumnName("YILADI");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
