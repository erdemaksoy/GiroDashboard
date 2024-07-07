using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Protocols;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Persistence
{
    static public class Configuration
    {
        static public string ConnectionString
        {
            get
            {
                ConfigurationManager configurationManager = new();

                configurationManager.SetBasePath(Path.Combine(Directory.GetCurrentDirectory(), "C:\\Users\\erdmg\\source\\repos\\giroDashboard\\GiroDashboard.API"));
                configurationManager.AddJsonFile("appsettings.json");

                return configurationManager.GetConnectionString("SQL");
            }
        }

    }
}
