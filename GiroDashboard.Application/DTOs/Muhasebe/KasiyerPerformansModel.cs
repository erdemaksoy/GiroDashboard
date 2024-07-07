using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Muhasebe
{
    public class KasiyerPerformansModel
    {
        public int? SubeKodu {  get; set; }

        public string? SubeAdi { get; set; }

        public int? Kasiyer { get; set; }

        public string? AdSoyad { get; set; }

        public string? StokAd { get; set; }

        public decimal? SatisMiktar { get; set; }

        public decimal? SatisTutar { get; set; }
    }
}
