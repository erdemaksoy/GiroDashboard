using System;
using System.Collections.Generic;

namespace GiroDashboard.Domain;

public partial class VwYetkiMenu
{
    public int YetkiId { get; set; }

    public int? MenuId { get; set; }

    public string? MenuAdi { get; set; }

    public int? RolId { get; set; }

    public bool? KayitYetki { get; set; }

    public bool? SilYetki { get; set; }

    public bool? GuncelleYetki { get; set; }

    public bool? IzlemeYetki { get; set; }

    public string? GorunurMu { get; set; }

    public string? Controller { get; set; }
}
