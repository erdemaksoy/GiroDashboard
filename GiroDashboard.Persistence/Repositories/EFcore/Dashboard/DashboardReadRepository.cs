using GiroDashboard.Application.Repositories.EFcore.Dashboard;
using GiroDashboard.Domain;

namespace GiroDashboard.Persistence.Repositories.EFcore.Dashboard
{
    public class DashboardReadRepository : ReadRepository<UrysTblDashboard>, IDashboardReadRepository
    {
        public DashboardReadRepository(PbwebContext context) : base(context)
        {
        }
    }
}
