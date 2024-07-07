using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Role
{
    public class RoleEditModel
    {
        public int RolId { get; set; }

        public DateTime? RIdate { get; set; }

        public int? RIkull { get; set; }

        public DateTime? RUdate { get; set; }

        public int? RUkull { get; set; }

        public string? RolAciklama { get; set; }

        public static explicit operator Tblrol(RoleEditModel model)
        {
            return new Tblrol
            {
                RolAciklama = model.RolAciklama,
                RolId = model.RolId,
                RIdate = model.RIdate,
                RIkull = model.RIkull,
                RUkull = model.RUkull,
                RUdate = model.RUdate
            };
        }
    }
}
