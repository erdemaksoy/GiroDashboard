using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Satis
{
    public class SatisRequestModel
    {
        public int? Kullanici { get; set; }
        public int? SubeKodu { get; set; }
        public DateTime? Tarih { get; set; }
        public DateTime? BasTarih { get; set; }
        public DateTime? BitTarih { get; set; }
        public string? Barkod { get; set; }
    }
}
