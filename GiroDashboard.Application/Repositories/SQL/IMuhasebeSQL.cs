using GiroDashboard.Application.DTOs.Muhasebe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.Repositories.SQL
{
    public interface IMuhasebeSQL
    {
        List<KasiyerAcikModel>? GetKasiyerAcik(MuhasebeRequestModel model);
        List<KasiyerPerformansModel>? GetKasiyerPerformans(MuhasebeRequestModel model);
        List<KDVDurumuModel>? GetKDVDurum(MuhasebeRequestModel model);
    }
}
