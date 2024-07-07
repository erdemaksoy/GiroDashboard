using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Rapor.Tanim
{
    public class RaporTanimModel
    {
        public int Id { get; set; }

        public string? GrupKodu { get; set; }

        public string RaporKodu { get; set; } = null!;

        public string? RaporAdi { get; set; }

        public string? SqlProcAdi { get; set; }

        public string? Filtre { get; set; }

        public string? RaporIkon { get; set; }

        public string? GosterimTipi { get; set; }

    }
}