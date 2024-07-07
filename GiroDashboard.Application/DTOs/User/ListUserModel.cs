using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.User
{
    public class ListUserModel
    {
        public int KullaniciNo { get; set; }

        public string? KullaniciAdi { get; set; }

        public string? KullaniciIsim { get; set; }

        public int? RolId { get; set; }
    }
}

