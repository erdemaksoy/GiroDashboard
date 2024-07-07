using System;
using System.Collections.Generic;

namespace GiroDashboard.Domain;

public partial class UrysTblDashboard
{
    public int Id { get; set; }

    public string? RaporAdi { get; set; }

    public string? RaporBaslik { get; set; }

    public string? RaporProc { get; set; }

    public int? RaporTipi { get; set; }

    public string? Aciklama { get; set; }

    public int? RaporSiraNo { get; set; }

    public bool? AktifPasif { get; set; }

    public int? SiraNo { get; set; }

    public string? Genislik { get; set; }

    public string? Ikon { get; set; }

    public int? ProcedureSira { get; set; }
}
