using GiroDashboard.Application.Repositories.SQL;
using Microsoft.Data.SqlClient;

using System.Data;


namespace GiroDashboard.Persistence.Repositories.SQL
{
    public class YetkiSQL : IYetkiSQL
    {
        private Database veritabani;
        SqlCommand _command;
        DataSet dataSet;
        public YetkiSQL()
        {
            veritabani = new Database();
            dataSet = new DataSet();

        }

        public bool YetkiDuzenle(int id)
        {
            try
            {
                bool ekle = false;

                _command = new SqlCommand("dbo.P_YETKIDUZENLE");
                _command.Parameters.Add(new SqlParameter("@KULL_ID", SqlDbType.Int));
                _command.Parameters["@KULL_ID"].Value = id;
                _command.CommandType = CommandType.StoredProcedure;
              
                int sayi =  veritabani.ekleDuzenleSil(_command);
               
                veritabani.BaglantiAyarla();
                if(sayi > 0)
                {
                    ekle = true;
                }

                return ekle;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
