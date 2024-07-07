using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Rapor.Filtre
{
    public class RaporFiltreEditModel: RaporFiltreTanimModel
    {
        public static explicit operator UrysTblRaporfiltre(RaporFiltreEditModel model)
        {
            return new UrysTblRaporfiltre
            {
                Id = model.Id,
                RaporKodu = model.RaporKodu,
                FiltreKodu = model.FiltreKodu,
                FiltreBaslik = model.FiltreBaslik,
                FiltreTip = model.FiltreTip,
                FiltreDeger = model.FiltreDeger,
                FiltreSira = model.FiltreSira,
                VarsayilanDeger = model.VarsayilanDeger
            };
        }
    }
}
