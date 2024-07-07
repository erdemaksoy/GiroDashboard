using GiroDashboard.Application.Repositories.EFcore.User;
using GiroDashboard.Domain;
using GiroDashboard.Persistence.Repositories.EFcore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Persistence.Repositories.EFcore.User
{
    public class UserWriteRepository : WriteRepository<Tblkullanici>, IUserWriteRepository
    {
        public UserWriteRepository(PbwebContext context) : base(context)
        {
        }
    }
}
