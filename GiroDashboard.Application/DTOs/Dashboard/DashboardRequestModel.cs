using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.DTOs.Dashboard
{
    public class DashboardRequestModel
    {
        public int MusteriId { get; set; }
        public int RaporTipi { get; set; }
        public DateTime Tarih { get; set; }
    }
}
