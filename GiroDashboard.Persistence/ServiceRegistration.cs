using GiroDashboard.Application.Repositories.EFcore.Dashboard;
using GiroDashboard.Application.Repositories.EFcore.Rapor;
using GiroDashboard.Application.Repositories.EFcore.Rapor.RaporFilitre;
using GiroDashboard.Application.Repositories.EFcore.Rapor.RaporGrup;
using GiroDashboard.Application.Repositories.EFcore.Rapor.RaporKolon;
using GiroDashboard.Application.Repositories.EFcore.Role;
using GiroDashboard.Application.Repositories.EFcore.UrysViewUser;
using GiroDashboard.Application.Repositories.EFcore.User;
using GiroDashboard.Application.Repositories.EFcore.Yetki;
using GiroDashboard.Application.Repositories.SQL;
using GiroDashboard.Domain;
using GiroDashboard.Persistence.Repositories.EFcore.Dashboard;
using GiroDashboard.Persistence.Repositories.EFcore.Rapor;
using GiroDashboard.Persistence.Repositories.EFcore.Rapor.RaporFiltre;
using GiroDashboard.Persistence.Repositories.EFcore.Rapor.RaporGrup;
using GiroDashboard.Persistence.Repositories.EFcore.Rapor.RaporKolon;
using GiroDashboard.Persistence.Repositories.EFcore.Role;
using GiroDashboard.Persistence.Repositories.EFcore.UrysViewUser;
using GiroDashboard.Persistence.Repositories.EFcore.User;
using GiroDashboard.Persistence.Repositories.EFcore.Yetki;
using GiroDashboard.Persistence.Repositories.SQL;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace GiroDashboard.Persistence
{
    public static class ServiceRegistration
    {
        public static void AddPersistenceServices(this IServiceCollection services)
        {
            services.AddDbContext<PbwebContext>(options => options.UseSqlServer(Configuration.ConnectionString), ServiceLifetime.Scoped);
            services.AddScoped<IUserReadRepository, UserReadRepository>();
            services.AddScoped<IUrysViewUserReadRepository, UrysViewUserReadRepository>();
            services.AddScoped<IUserWriteRepository, Repositories.EFcore.User.UserWriteRepository>();
            services.AddScoped<IRoleWriteRepository, RoleWriteRepository>();
            services.AddScoped<IRoleReadRepository, RoleReadRepository>();
            services.AddScoped<IStokSQL, StokSQL>();
            services.AddScoped<IMuhasebeSQL, MuhasebeSQL>();
            services.AddScoped<ISatisSQL, SatisSQL>();
            services.AddScoped<IRaporFiltreReadRepository, RaporFiltreReadRepository>();
            services.AddScoped<IRaporFiltreWriteRepository, RaporFiltreWriteRepository>();
            services.AddScoped<IRaporKolonReadRepository, RaporKolonReadRepository>();
            services.AddScoped<IRaporKolonWriteRepository, RaporKolonWriteRepository>();
            services.AddScoped<IRaporGrupReadRepository, RaporGrupReadRepository>();
            services.AddScoped<IRaporGrupWriteRepository, RaporGrupWriteRepository>();
            services.AddScoped<IRaporReadRepository, RaporReadRepository>();
            services.AddScoped<IRaporWriteRepository, RaporWriteRepository>();
            services.AddScoped<IDashboardSQL, DashboardSQL>();
            services.AddScoped<IYetkiWriteRepository, YetkiWriteRepository>();
            services.AddScoped<IYetkiReadRepository, YetkiReadRepository>();
            services.AddScoped<IDashboardReadRepository,DashboardReadRepository>();
            services.AddScoped<IDashboardWriteRepository,DashboardWriteRepository>();
            services.AddScoped<IYetkiSQL,YetkiSQL>();
        }
    }
}
