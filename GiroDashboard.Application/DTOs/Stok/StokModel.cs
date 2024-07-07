using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Stok
{
    public class StokModel
    {
        public int? SubeKodu { get; set; }
        public DateTime? Tarih { get; set; }
        public string? BelgeNo { get; set; }
        public string? EvrakNo { get; set; }
        public int? BelgeTipi { get; set; }
        public string? BelgeAdi { get; set; }
        public decimal? GirenMiktar { get; set; }
        public decimal? CikanMiktar { get; set; }
        public decimal? HarBakiye { get; set; }
        public string? CariAdi { get; set; }
        public decimal? StokNF { get; set; }
        public decimal? NetTutar { get; set; }
        public decimal? StokBF { get; set; }
        public decimal? KdvOrani { get; set; }
        public int? StokHr_Recno { get; set; }
    }
}
