using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.User
{
    public class EditUserModel
    {
        public int KullId { get; set; }

        public DateTime? RIdate { get; set; }

        public int? RIkull { get; set; }

        public DateTime? RUdate { get; set; }

        public int? RUkull { get; set; }

        public int? KullRolid { get; set; }

        public string? KullKodu { get; set; }

        public string? KullParola { get; set; }

        public string? KullAdi { get; set; }

        public string? KullEposta { get; set; }

        public string? KullTelefon { get; set; }

        public string? KullResim { get; set; }

        public string? SifreDegistiMi { get; set; }

        public DateTime? SonGirisTarih { get; set; }

        public string? SonGirisIp { get; set; }

        public string? TcNo { get; set; }

        public string? VarsayilanKasaKodu { get; set; }

        public string? PersonelCariKodu { get; set; }

        public string? YaziciMacAdresi { get; set; }

        public string? AcikSubeler { get; set; }

        public string? DashboardYetki { get; set; }

        public string? VarsayilanRaporId { get; set; }

        public static explicit operator Tblkullanici(EditUserModel model)
        {
            return new Tblkullanici
            {
                KullId = model.KullId,
                RIdate = model.RIdate,
                RIkull = model.RIkull,
                RUdate = model.RUdate,
                RUkull = model.RUkull,
                KullRolid = model.KullRolid,
                KullKodu = model.KullKodu,
                KullParola = model.KullParola,
                KullAdi = model.KullAdi,
                KullEposta = model.KullEposta,
                KullTelefon = model.KullTelefon,
                KullResim = model.KullResim,
                SifreDegistiMi = model.SifreDegistiMi,
                SonGirisTarih = model.SonGirisTarih,
                SonGirisIp = model.SonGirisIp,
                TcNo = model.TcNo,
                VarsayilanKasaKodu = model.VarsayilanKasaKodu,
                PersonelCariKodu = model.PersonelCariKodu,
                YaziciMacAdresi = model.YaziciMacAdresi,
                AcikSubeler = model.AcikSubeler,
                DashboardYetki = model.DashboardYetki,
                VarsayilanRaporId = model.VarsayilanRaporId,

            };
        }
    }
}
