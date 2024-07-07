using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Persistence.Repositories.SQL
{
    public class Database
    {
        SqlConnection con;
        int donusdegeri;

        public Database()
        {
            con = new SqlConnection(Configuration.ConnectionString);
        }

        public void BaglantiAyarla()
        {
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            else
                con.Close();
        }

        public int ekleDuzenleSil(SqlCommand komut)
        {
            komut.Connection = con;
            BaglantiAyarla();
            donusdegeri = komut.ExecuteNonQuery();
            BaglantiAyarla();
            return donusdegeri;
        }
        public SqlDataReader liste(SqlCommand komut)
        {
            komut.Connection = con;
            BaglantiAyarla();
            return komut.ExecuteReader();
        }
        public SqlDataAdapter adapter(SqlCommand komut)
        {
            komut.Connection = con;
            BaglantiAyarla();
            SqlDataAdapter adapter = new SqlDataAdapter(komut);
            return adapter;
        }
    }
}
