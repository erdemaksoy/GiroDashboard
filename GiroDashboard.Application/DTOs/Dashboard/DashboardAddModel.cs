using GiroDashboard.Application.DTOs.Rapor.Filtre;
using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Dashboard
{
    public class DashboardAddModel
    {
        public int Id { get; set; }

        public string? RaporAdi { get; set; }

        public string? RaporBaslik { get; set; }

        public string? RaporProc { get; set; }

        public int? RaporTipi { get; set; }

        public string? Aciklama { get; set; }

        public int? RaporSiraNo { get; set; }

        public bool AktifPasif { get; set; }

        public int? SiraNo { get; set; }

        public string? Genislik { get; set; }

        public string? Ikon { get; set; }


        public static explicit operator UrysTblDashboard(DashboardAddModel model)
        {
            return new UrysTblDashboard()
            {
                Id = model.Id,
                RaporAdi = model.RaporAdi,
                RaporBaslik = model.RaporBaslik,
                RaporProc = model.RaporProc,
                RaporTipi = model.RaporTipi,
                Aciklama = model.Aciklama,
                RaporSiraNo = model.RaporSiraNo,
                SiraNo = model.SiraNo,
                Genislik = model.Genislik,
                Ikon = model.Ikon,
                AktifPasif = model.AktifPasif,

            };
        }
    }
}
