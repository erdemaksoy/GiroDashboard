using GiroDashboard.Application.Repositories.EFcore.Rapor;
using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Persistence.Repositories.EFcore.Rapor
{
    public class RaporWriteRepository : WriteRepository<Tblmbrapor>, IRaporWriteRepository
    {
        public RaporWriteRepository(PbwebContext context) : base(context)
        {
        }
    }
}
