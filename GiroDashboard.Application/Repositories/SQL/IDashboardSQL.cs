using GiroDashboard.Application.DTOs.Dashboard;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.Repositories.SQL
{
    public interface IDashboardSQL
    {
        List<DashboardModel>? GetDashboardData(DashboardRequestModel request);
    }
}
