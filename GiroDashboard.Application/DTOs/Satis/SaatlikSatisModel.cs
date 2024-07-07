using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Satis
{
    public class SaatlikSatisModel
    {
        public DateTime? Tarih { get; set; }

        public string? Saat { get; set; }    

        public int? MusSay { get; set; }

        public decimal? SepetOrt { get; set; }

        public decimal? Ciro { get; set; }

        public decimal? YemekKarti { get; set; }

        public decimal? ToplamSepet { get; set; }
    }
}
