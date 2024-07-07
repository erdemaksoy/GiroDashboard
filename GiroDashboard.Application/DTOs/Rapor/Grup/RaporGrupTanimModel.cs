using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Rapor.Grup
{
    public class RaporGrupTanimModel
    {
        public int Id { get; set; }

        public string GrupKodu { get; set; } = null!;

        public string? GrupAciklama { get; set; }

        public string? GrupIkon { get; set; }
    }
}