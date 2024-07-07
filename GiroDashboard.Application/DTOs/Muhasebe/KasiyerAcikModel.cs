using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Muhasebe
{
    public class KasiyerAcikModel
    {
        public DateTime? Tarih { get; set; }
        public string? KasiyerAdi { get; set; }
        public string? PersonelNo { get; set; }
        public double? Acik { get; set; }
        public double? Fazla { get; set; }
    }
}
