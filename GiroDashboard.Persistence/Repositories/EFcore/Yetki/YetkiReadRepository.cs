using GiroDashboard.Application.Repositories.EFcore.Yetki;
using GiroDashboard.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Persistence.Repositories.EFcore.Yetki
{
    public class YetkiReadRepository : ReadRepository<VwYetkiMenu>, IYetkiReadRepository
    {
        public YetkiReadRepository(PbwebContext context) : base(context)
        {
        }
    }
}
