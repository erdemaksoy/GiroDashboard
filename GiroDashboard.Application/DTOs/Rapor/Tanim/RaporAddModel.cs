using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Rapor.Tanim
{
    public class RaporAddModel:RaporTanimModel
    {

        public static explicit operator Tblmbrapor(RaporAddModel model)
        {
            return new Tblmbrapor
            {
                Id = model.Id,
                GrupKodu = model.GrupKodu,
                RaporKodu = model.RaporKodu,
                RaporAdi = model.RaporAdi,
                SqlProcAdi = model.SqlProcAdi,
                Filtre = model.Filtre,
                RaporIkon = model.RaporIkon,
                GosterimTipi = model.GosterimTipi,
            };
        }
    }
}
