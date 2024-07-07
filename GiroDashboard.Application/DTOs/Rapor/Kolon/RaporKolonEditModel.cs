using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Rapor.Kolon
{
    public class RaporKolonEditModel:RaporKolonTanimModel
    {
        public static explicit operator UrysTblRaporkolon(RaporKolonEditModel model)
        {
            return new UrysTblRaporkolon
            {
                Id = model.Id,
                RaporKodu = model.RaporKodu,
                Kolon = model.Kolon,
                KolonBaslik = model.KolonBaslik,
                KolonTip = model.KolonTip,
                KolonAltToplam = model.KolonAltToplam,
            };
        }
    }
    
}
