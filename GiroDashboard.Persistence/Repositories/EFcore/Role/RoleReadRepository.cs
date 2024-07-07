using GiroDashboard.Application.Repositories.EFcore.Role;
using GiroDashboard.Domain;
using GiroDashboard.Persistence.Repositories.EFcore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Persistence.Repositories.EFcore.Role
{
    public class RoleReadRepository : ReadRepository<Tblrol>, IRoleReadRepository
    {
        public RoleReadRepository(PbwebContext context) : base(context)
        {
        }
    }
}
