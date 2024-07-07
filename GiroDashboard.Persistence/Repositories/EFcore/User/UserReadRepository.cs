using GiroDashboard.Application.Repositories.EFcore.User;
using GiroDashboard.Domain;

namespace GiroDashboard.Persistence.Repositories.EFcore.User
{
    public class UserReadRepository : ReadRepository<Tblkullanici>, IUserReadRepository
    {
        public UserReadRepository(PbwebContext context) : base(context)
        {
        }
    }
}
