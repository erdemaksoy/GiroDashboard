using System;
using System.Collections.Generic;

namespace GiroDashboard.Domain;

public partial class UrysTblRapor
{
    public int Id { get; set; }

    public string? GrupKodu { get; set; }

    public string RaporKodu { get; set; } = null!;

    public string? RaporAdi { get; set; }

    public string? SqlProcAdi { get; set; }

    public string? Filtre { get; set; }

    public string? RaporIkon { get; set; }

    public string? GosterimTipi { get; set; }
}
