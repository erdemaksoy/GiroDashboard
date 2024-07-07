using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Stok
{
    public class StokGimsaModel
    {
        public string? StokNo { get; set; }

        public string? UrunKodu { get; set; }

        public double? Barkod { get; set; }

        public string? UrunAdı { get; set; }

        public decimal? KdvHariçMal { get; set; }

        public decimal? SatışFiyatı { get; set; }

        public string? Kdv { get; set; }

        public string? Mevcut { get; set; }

        public string? Brm { get; set; }

        public string? _2023 { get; set; }

        public string? _2022 { get; set; }

        public string? _2021 { get; set; }

        public string? _2020 { get; set; }

        public string? Giriş2023 { get; set; }
    }
}
