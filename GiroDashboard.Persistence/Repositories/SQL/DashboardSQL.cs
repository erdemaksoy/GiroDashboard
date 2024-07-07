using GiroDashboard.Application.DTOs.Dashboard;
using GiroDashboard.Application.DTOs.Muhasebe;
using GiroDashboard.Application.Repositories.SQL;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Persistence.Repositories.SQL
{
    public class DashboardSQL : IDashboardSQL 
    {
        private Database veritabani;
        SqlCommand _command;
        DataSet dataSet;

        public DashboardSQL()
        {
            veritabani = new Database();
            dataSet = new DataSet();

        }

        public List<DashboardModel>? GetDashboardData(DashboardRequestModel model)
        { 
            try
            {
               List<DashboardModel> listDashboard = new List<DashboardModel>();

                _command = new SqlCommand("dbo.RYS_PROC_DASHBOARD");
                _command.Parameters.Add(new SqlParameter("@MUSTERI_ID", SqlDbType.Int));
                _command.Parameters["@MUSTERI_ID"].Value = model.MusteriId;
                _command.Parameters.Add(new SqlParameter("@RAPOR_TIPI", SqlDbType.Int));
                _command.Parameters["@RAPOR_TIPI"].Value = model.RaporTipi;
                _command.Parameters.Add(new SqlParameter("@TARIH", SqlDbType.DateTime));
                _command.Parameters["@TARIH"].Value = model.Tarih;
                _command.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter dr = veritabani.adapter(_command);
                dr.Fill(dataSet);
                 var data = dataSet.Tables[0];
                foreach (DataRow row in data.Rows)
                {
                    DashboardModel dashboardModel = new DashboardModel();
                    var de = data.Columns.Count;
                    if (de == 1)
                    {   

                        dashboardModel.value = (decimal?)row[0];

                    }
                    if (de == 2)
                    {
                        dashboardModel.label = (string?)row[0];
                        dashboardModel.value = (decimal?) row[1];
                    }
                   
                   listDashboard.Add(dashboardModel);
                }
                veritabani.BaglantiAyarla();

                return listDashboard;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
