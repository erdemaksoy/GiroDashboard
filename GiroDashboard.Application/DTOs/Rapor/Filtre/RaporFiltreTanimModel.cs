using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Rapor.Filtre
{
    public class RaporFiltreTanimModel
    {

        public int Id { get; set; }

        public string RaporKodu { get; set; } = null!;

        public string FiltreKodu { get; set; } = null!;

        public string? FiltreBaslik { get; set; }

        public string? FiltreTip { get; set; }

        public string? FiltreDeger { get; set; }

        public int? FiltreSira { get; set; }

        public string? VarsayilanDeger { get; set; }


    }
}