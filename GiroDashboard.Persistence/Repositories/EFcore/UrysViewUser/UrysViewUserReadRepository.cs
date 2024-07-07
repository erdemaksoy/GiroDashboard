using GiroDashboard.Application.Repositories;
using GiroDashboard.Application.Repositories.EFcore.UrysViewUser;
using GiroDashboard.Domain;
using GiroDashboard.Persistence.Repositories.EFcore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Persistence.Repositories.EFcore.UrysViewUser
{
    public class UrysViewUserReadRepository : ReadRepository<UrysViewKullliste>, IUrysViewUserReadRepository
    {
        public UrysViewUserReadRepository(PbwebContext context) : base(context)
        {
        }
    }
}
