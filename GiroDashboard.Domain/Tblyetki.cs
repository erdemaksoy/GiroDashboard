using System;
using System.Collections.Generic;

namespace GiroDashboard.Domain;

public partial class Tblyetki
{
    public int YetkiId { get; set; }

    public DateTime? RIdate { get; set; }

    public int? RIkull { get; set; }

    public DateTime? RUdate { get; set; }

    public int? RUkull { get; set; }

    public int? RolId { get; set; }

    public int? MenuId { get; set; }

    public bool? KayitYetki { get; set; }

    public bool? SilYetki { get; set; }

    public bool? GuncelleYetki { get; set; }

    public bool? IzlemeYetki { get; set; }

    public virtual Tblmenu? Menu { get; set; }
}
