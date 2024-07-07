using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Stok
{
    public class StokRequestModel
    {
        public string? Barkod { get; set; }

        public string? UrunKodu { get; set; }

        public string? UrunAdı { get; set; }

        public int? SubeKodu { get; set; }

        public int? Kullanici { get; set; }

        public DateTime? Tarih { get; set; }
    }
}
