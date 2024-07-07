using System;
using System.Collections.Generic;

namespace GiroDashboard.Domain;

public partial class UrysViewKullliste
{
    public int KullaniciNo { get; set; }

    public string? KullaniciAdi { get; set; }

    public string? KullaniciIsim { get; set; }

    public string? Sifre { get; set; }

    public int? RolId { get; set; }
}
