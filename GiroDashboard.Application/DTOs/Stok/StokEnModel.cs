using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Stok
{
    public class StokEnModel
    {
        public string? StokKodu { get; set; }

        public string? StokAdi { get; set; }

        public decimal? SatisMiktari { get; set; }

        public decimal? SatisTutari { get; set; }

    }
}