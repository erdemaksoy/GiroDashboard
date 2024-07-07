using System;
using System.Collections.Generic;

namespace GiroDashboard.Domain;

public partial class UrysTblRaporgrup
{
    public int Id { get; set; }

    public string GrupKodu { get; set; } = null!;

    public string? GrupAciklama { get; set; }

    public string? GrupIkon { get; set; }
}
