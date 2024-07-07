using GiroDashboard.Application.DTOs.Stok;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.Repositories.SQL
{
    public interface IStokSQL
    {
        List<StokGimsaModel>? GetStokGimsa(StokRequestModel model);
        List<StokModel>? GetStokHareket(StokRequestModel model);
        List<StokEnModel>? GetStokEnCokSatan(StokRequestModel model);
    }
}
