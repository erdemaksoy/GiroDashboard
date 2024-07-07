using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.User
{
    public record LoginModel
    {
        public string KullaniciAdi { get; set; }
        public string? Sifre { get; set; }
    }
}
