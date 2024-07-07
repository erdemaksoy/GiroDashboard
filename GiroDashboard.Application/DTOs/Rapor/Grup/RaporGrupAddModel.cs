using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Rapor.Grup
{
    public class RaporGrupAddModel: RaporGrupTanimModel
    {
        public static explicit operator Tblmblraporgrup(RaporGrupAddModel model)
        {
            return new Tblmblraporgrup
            {
                Id = model.Id,
                GrupKodu = model.GrupKodu,
                GrupAciklama = model.GrupAciklama,
                GrupIkon = model.GrupIkon
            };
        }
    }
}
