using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Satis
{
    public class SatisUrunModel
    {
        public DateTime? Tarih { get; set; }
        public double? Sube { get; set; }
        public decimal? KasaNo { get; set; }
        public decimal? FisNo { get; set; }
        public decimal? Saat { get; set; }
        public decimal? Sira { get; set; }
        public string? MusteriNo { get; set; }
        public double? ZNo { get; set; }
        public string? StokAd { get; set; }
        public string? StokKod { get; set; }
        public string? Barkod { get; set; }
        public string? Belge { get; set; }
        public string? Durumu { get; set; }
        public decimal? Kasiyer { get; set; }
        public decimal? Kdv { get; set; }
        public decimal? Fiyat { get; set; }
        public decimal? Miktar { get; set; }
        public string? Birim { get; set; }
        public decimal? Tutar { get; set; }
        public decimal? SatirInd { get; set; }
        public decimal? GenelInd { get; set; }
        public decimal? FisToplam { get; set; }
    }
}
