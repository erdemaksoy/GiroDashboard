using GiroDashboard.Application.Repositories.EFcore.Rapor.RaporFilitre;
using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Persistence.Repositories.EFcore.Rapor.RaporFiltre
{
    public class RaporFiltreWriteRepository : WriteRepository<TblmbraporFiltre>, IRaporFiltreWriteRepository
    {
        public RaporFiltreWriteRepository(PbwebContext context) : base(context)
        {
        }
    }
}
