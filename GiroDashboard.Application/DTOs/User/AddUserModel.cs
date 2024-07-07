using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.User
{
    public class AddUserModel
    {
        public string? KullKodu { get; set; }
        public string? KullParola { get; set; }
        public string? KullAdi { get; set; }
        public int? KullRolid { get; set; }
        public string? KullEposta { get; set; }
        public string? KullTelefon { get; set; }
        public string? AcikSubeler { get; set; }
        public string? SifreDegistiMi { get; set; }
        public string? DashboardYetki { get; set; }
        public string? VarsayilanRaporId { get; set; }
        public string? KullResim { get; set; }

        public static explicit operator Tblkullanici(AddUserModel model)
        {
            return new Tblkullanici
            {
                KullRolid = model.KullRolid,
                KullKodu = model.KullKodu,
                KullParola = model.KullParola,
                KullAdi = model.KullAdi,
                KullEposta = model.KullEposta,
                KullTelefon = model.KullTelefon,
                KullResim = model.KullResim,
                SifreDegistiMi = model.SifreDegistiMi,
                AcikSubeler = model.AcikSubeler,
                DashboardYetki = model.DashboardYetki,
                VarsayilanRaporId = model.VarsayilanRaporId,
            };
        }

    }
    
}
