using System;
using System.Collections.Generic;

namespace GiroDashboard.Domain;

public partial class Tblmbraporkolon
{
    public int Id { get; set; }

    public string RaporKodu { get; set; } = null!;

    public string Kolon { get; set; } = null!;

    public string? KolonBaslik { get; set; }

    public string? KolonTip { get; set; }

    public string KolonAltToplam { get; set; } = null!;
}
