using System;
using System.Collections.Generic;

namespace GiroDashboard.Domain;

public partial class Tbliplog
{
    public string? KullKodu { get; set; }

    public string? Ip { get; set; }

    public DateTime? Tarih { get; set; }

    public string? Mesaj { get; set; }
}
