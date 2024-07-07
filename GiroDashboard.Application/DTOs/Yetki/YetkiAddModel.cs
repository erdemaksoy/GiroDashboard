using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Yetki
{
    public class YetkiAddModel
    {
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

        public static explicit operator Tblyetki(YetkiAddModel model)
        {
            return new Tblyetki
            {
                GuncelleYetki = model.GuncelleYetki,
                IzlemeYetki = model.IzlemeYetki,
                SilYetki = model.SilYetki,
                KayitYetki = model.KayitYetki,
                RolId = model.RolId,
                MenuId = model.MenuId,
            };
        }
    }
}
