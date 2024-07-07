using GiroDashboard.Application.Repositories.EFcore.Dashboard;
using GiroDashboard.Domain;


namespace GiroDashboard.Persistence.Repositories.EFcore.Dashboard
{
    public class DashboardWriteRepository : WriteRepository<UrysTblDashboard>, IDashboardWriteRepository
    {
        public DashboardWriteRepository(PbwebContext context) : base(context)
        {
        }
    }
}
