using GiroDashboard.Application.DTOs.Satis;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.Repositories.SQL
{
    public interface ISatisSQL
    {
        List<SaatlikSatisModel>? GetSaatlikSatis(SatisRequestModel model);
        List<SatisOdemeModel>? GetSatisOdeme(SatisRequestModel model);
        List<SatisUrunModel>? GetSatisUrun(SatisRequestModel model);
    }
}
