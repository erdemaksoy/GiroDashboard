using System;
using System.Collections.Generic;

namespace GiroDashboard.Domain;

public partial class UrysTblRaporfiltre
{
    public int Id { get; set; }

    public string RaporKodu { get; set; } = null!;

    public string FiltreKodu { get; set; } = null!;

    public string? FiltreBaslik { get; set; }

    public string? FiltreTip { get; set; }

    public string? FiltreDeger { get; set; }

    public int? FiltreSira { get; set; }

    public string? VarsayilanDeger { get; set; }
}
