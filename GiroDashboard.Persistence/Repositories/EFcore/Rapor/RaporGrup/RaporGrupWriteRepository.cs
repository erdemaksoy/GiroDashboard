using GiroDashboard.Application.Repositories.EFcore.Rapor.RaporGrup;
using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Persistence.Repositories.EFcore.Rapor.RaporGrup
{
    public class RaporGrupWriteRepository : WriteRepository<Tblmblraporgrup>, IRaporGrupWriteRepository
    {
        public RaporGrupWriteRepository(PbwebContext context) : base(context)
        {
        }
    }
}
