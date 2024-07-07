using System;
using System.Collections.Generic;

namespace GiroDashboard.Domain;

public partial class Tblkullanici
{
    public int KullId { get; set; }

    public DateTime? RIdate { get; set; }

    public int? RIkull { get; set; }

    public DateTime? RUdate { get; set; }

    public int? RUkull { get; set; }

    public int? KullRolid { get; set; }

    public string? KullKodu { get; set; }

    public string? KullParola { get; set; }

    public string? KullAdi { get; set; }

    public string? KullEposta { get; set; }

    public string? KullTelefon { get; set; }

    public string? KullResim { get; set; }

    public string? SifreDegistiMi { get; set; }

    public DateTime? SonGirisTarih { get; set; }

    public string? SonGirisIp { get; set; }

    public string? TcNo { get; set; }

    public string? VarsayilanKasaKodu { get; set; }

    public string? PersonelCariKodu { get; set; }

    public string? YaziciMacAdresi { get; set; }

    public string? AcikSubeler { get; set; }

    public string? DashboardYetki { get; set; }

    public string? VarsayilanRaporId { get; set; }
}
