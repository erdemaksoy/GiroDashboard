using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Yetki
{
    public class MenuModel
    {
        public int MenuId { get; set; }

        public DateTime? RIdate { get; set; }

        public int? RIkull { get; set; }

        public DateTime? RUdate { get; set; }

        public int? RUkull { get; set; }

        public int? UstMenuId { get; set; }

        public string? MenuAdi { get; set; }

        public string? MenuUrl { get; set; }

        public string? MenuIkon { get; set; }

        public string GorunurMu { get; set; }

        public string? Action { get; set; }

        public string? Controller { get; set; }

        public int? Sira { get; set; }
    }
}
