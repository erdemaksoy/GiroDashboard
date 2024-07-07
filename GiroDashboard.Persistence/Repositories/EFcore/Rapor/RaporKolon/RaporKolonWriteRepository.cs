using GiroDashboard.Application.Repositories.EFcore.Rapor.RaporKolon;
using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Persistence.Repositories.EFcore.Rapor.RaporKolon
{
    public class RaporKolonWriteRepository : WriteRepository<Tblmbraporkolon>, IRaporKolonWriteRepository
    {
        public RaporKolonWriteRepository(PbwebContext context) : base(context)
        {
        }
    }
}
