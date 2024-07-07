using System;
using System.Collections.Generic;

namespace GiroDashboard.Domain;

public partial class Proje
{
    public string? StokNo { get; set; }

    public string? UrunKodu { get; set; }

    public double? Barkod { get; set; }

    public string? UrunAdı { get; set; }

    public decimal? KdvHariçMal { get; set; }

    public decimal? SatışFiyatı { get; set; }

    public string? Pa { get; set; }

    public string? Kdv { get; set; }

    public double? Mevcut { get; set; }

    public string? Brm { get; set; }

    public double? _2023 { get; set; }

    public double? _2022 { get; set; }

    public double? _2021 { get; set; }

    public double? _2020 { get; set; }

    public double? Giriş2023 { get; set; }
}
