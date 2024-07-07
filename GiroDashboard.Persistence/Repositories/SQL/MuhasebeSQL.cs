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
    public class MuhasebeSQL : IMuhasebeSQL
    {
        private Database veritabani;
        SqlCommand _command;
        DataSet dataSet;
        public MuhasebeSQL()
        {
            veritabani = new Database();
            dataSet = new DataSet();
        }

        public List<KasiyerAcikModel>? GetKasiyerAcik(MuhasebeRequestModel model)
        {
            try
            {
 List<KasiyerAcikModel> models = new List<KasiyerAcikModel>();
            _command = new SqlCommand("dbo.PrgProc_BI_Kasiyer");
            _command.Parameters.Add(new SqlParameter("@KULLANICI", SqlDbType.Int));
            _command.Parameters["@KULLANICI"].Value = model.Kullanici;
            _command.Parameters.Add(new SqlParameter("@SUBE_KODU", SqlDbType.Int));
            _command.Parameters["@SUBE_KODU"].Value = model.SubeKodu;
            _command.Parameters.Add(new SqlParameter("@BASTARIH", SqlDbType.DateTime));
            _command.Parameters["@BASTARIH"].Value = model.BasTarih;
            _command.Parameters.Add(new SqlParameter("@BITTARIH", SqlDbType.DateTime));
            _command.Parameters["@BITTARIH"].Value = model.BitTarih;
            _command.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter dr = veritabani.adapter(_command);
            dr.Fill(dataSet);
            var data = dataSet.Tables[0];
            foreach (DataRow row in data.Rows)
            {
                var de = data.Rows.Count;
                KasiyerAcikModel kasiyerAcikModel = new();
                kasiyerAcikModel.Tarih = (DateTime?)row[1];
                kasiyerAcikModel.KasiyerAdi = (string?)row[2];
                kasiyerAcikModel.PersonelNo = (string?)row[3];
                kasiyerAcikModel.Acik = (double?)row[4];
                kasiyerAcikModel.Fazla = (double?)row[5];
            }
            veritabani.BaglantiAyarla();

            return models;
            }
            catch (Exception ex)
            {
                throw ex;
            }
           
        }

        public List<KasiyerPerformansModel>? GetKasiyerPerformans(MuhasebeRequestModel model)
        {
            try
            {
                List<KasiyerPerformansModel> models = new List<KasiyerPerformansModel>();

                // prosedür ismi düzeltilecek
                _command = new SqlCommand("dbo.PrgProc_BI_KasiyerPerformans");
                _command.Parameters.Add(new SqlParameter("@KULLANICI", SqlDbType.Int));
                _command.Parameters["@KULLANICI"].Value = model.Kullanici;
                _command.Parameters.Add(new SqlParameter("@SUBE_KODU", SqlDbType.Int));
                _command.Parameters["@SUBE_KODU"].Value = model.SubeKodu;
                _command.Parameters.Add(new SqlParameter("@BASTARIH", SqlDbType.DateTime));
                _command.Parameters["@BASTARIH"].Value = model.BasTarih;
                _command.Parameters.Add(new SqlParameter("@BITTARIH", SqlDbType.DateTime));
                _command.Parameters["@BITTARIH"].Value = model.BitTarih;
                _command.Parameters.Add(new SqlParameter("@BARKOD", SqlDbType.VarChar, 20));
                _command.Parameters["@BARKOD"].Value = model.Barkod;
                _command.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter dr = veritabani.adapter(_command);
                dr.Fill(dataSet);
                var data = dataSet.Tables[0];
                foreach (DataRow row in data.Rows)
                {
                    var de = data.Rows.Count;
                    KasiyerPerformansModel kasiyerPerformansModel = new();
                    kasiyerPerformansModel.SubeKodu = (int?)row[0];
                    kasiyerPerformansModel.SubeAdi = (string?)row[1];
                    kasiyerPerformansModel.Kasiyer = (int?)row[2];
                    kasiyerPerformansModel.AdSoyad = (string?)row[3];
                    kasiyerPerformansModel.StokAd = (string?)row[4];
                    kasiyerPerformansModel.SatisMiktar = (decimal?)row[5];
                    kasiyerPerformansModel.SatisTutar = (decimal?)row[6];

                    models.Add(kasiyerPerformansModel);
                }
                veritabani.BaglantiAyarla();
                return models;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<KDVDurumuModel>? GetKDVDurum(MuhasebeRequestModel model)
        {
            try
            {
                List<KDVDurumuModel> models = new List<KDVDurumuModel>();
                //prosedür ismi düxeltilecek
                _command = new SqlCommand("dbo.PrgProc_BI_Analiz");
                _command.Parameters.Add(new SqlParameter("@KULLANICI", SqlDbType.Int));
                _command.Parameters["@KULLANICI"].Value = 1;
                _command.Parameters.Add(new SqlParameter("@SUBE_KODU", SqlDbType.Int));
                _command.Parameters["@SUBE_KODU"].Value = 1;
                _command.Parameters.Add(new SqlParameter("@TARIH", SqlDbType.DateTime));
                _command.Parameters["@TARIH"].Value = DateTime.Now;
                _command.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter dr = veritabani.adapter(_command);
                dr.Fill(dataSet);
                var data = dataSet.Tables[0];
                foreach (DataRow row in data.Rows)
                {
                    var de = data.Rows.Count;
                }
                veritabani.BaglantiAyarla();

                return models;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
