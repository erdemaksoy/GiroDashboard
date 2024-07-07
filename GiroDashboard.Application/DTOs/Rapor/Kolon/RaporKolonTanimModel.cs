using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Rapor.Kolon
{
    public class RaporKolonTanimModel
    {
        public int Id { get; set; }

        public string RaporKodu { get; set; } = null!;

        public string Kolon { get; set; } = null!;

        public string? KolonBaslik { get; set; }

        public string? KolonTip { get; set; }

        public string KolonAltToplam { get; set; } = null!;

    }
}