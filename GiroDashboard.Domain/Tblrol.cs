using System;
using System.Collections.Generic;

namespace GiroDashboard.Domain;

public partial class Tblrol
{
    public int RolId { get; set; }

    public DateTime? RIdate { get; set; }

    public int? RIkull { get; set; }

    public DateTime? RUdate { get; set; }

    public int? RUkull { get; set; }

    public string? RolAciklama { get; set; }
}
