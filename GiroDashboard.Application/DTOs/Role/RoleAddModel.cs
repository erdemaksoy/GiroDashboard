using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Role
{
    public class RoleAddModel
    {
        public string? RolAciklama { get; set; }
        //public int RolId { get; set; }
        public static explicit operator Tblrol(RoleAddModel model)
        {
            return new Tblrol
            {
                RolAciklama = model.RolAciklama,
                //RolId = model.RolId
            };
        }
    }
}
