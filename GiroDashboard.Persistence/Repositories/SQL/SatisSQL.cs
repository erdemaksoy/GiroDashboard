using GiroDashboard.Application.DTOs.Satis;
using GiroDashboard.Application.Repositories.SQL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Persistence.Repositories.SQL
{
    public class SatisSQL : ISatisSQL
    {
        private Database veritabani;
        SqlCommand _command;
        DataSet dataSet;
        public SatisSQL()
        {
            veritabani = new Database();
            dataSet = new DataSet();
        }

        public List<SaatlikSatisModel>? GetSaatlikSatis(SatisRequestModel model)
        {
            try
            {
                List<SaatlikSatisModel> models = new List<SaatlikSatisModel>();
                _command = new SqlCommand("dbo.PrgProc_BI_SaatlikSatis");
                _command.Parameters.Add(new SqlParameter("@KULLANICI", SqlDbType.Int));
                _command.Parameters["@KULLANICI"].Value = model.Kullanici;
                _command.Parameters.Add(new SqlParameter("@SUBE_KODU", SqlDbType.Int));
                _command.Parameters["@SUBE_KODU"].Value = model.SubeKodu;
                _command.Parameters.Add(new SqlParameter("@TARIH", SqlDbType.DateTime));
                _command.Parameters["@TARIH"].Value = model.Tarih;
                _command.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter dr = veritabani.adapter(_command);
                dr.Fill(dataSet);
                var data = dataSet.Tables[0];
                foreach (DataRow row in data.Rows)
                {
                    var de = data.Rows.Count;
                    SaatlikSatisModel saatlikSatisModel = new SaatlikSatisModel();
                    saatlikSatisModel.Tarih = (DateTime?)row[0];
                    saatlikSatisModel.Saat = (string?)row[1];
                    saatlikSatisModel.MusSay = (int?)row[2];
                    saatlikSatisModel.SepetOrt = (decimal?)row[3];
                    saatlikSatisModel.Ciro = (decimal?)row[4];
                    saatlikSatisModel.YemekKarti = (decimal?)row[5];
                    saatlikSatisModel.ToplamSepet = (decimal?)row[6];
                    models.Add(saatlikSatisModel);
                }
                veritabani.BaglantiAyarla();

                return models;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            
        }

        public List<SatisOdemeModel>? GetSatisOdeme(SatisRequestModel model)
        {
            try
            {
                List<SatisOdemeModel> models = new List<SatisOdemeModel>();
                _command = new SqlCommand("dbo.PrgProc_BI_OdemeTipiKasaSatis");
                _command.Parameters.Add(new SqlParameter("@KULLANICI", SqlDbType.Int));
                _command.Parameters["@KULLANICI"].Value = model.Kullanici;
                _command.Parameters.Add(new SqlParameter("@PRM_SUBEKODU", SqlDbType.Int));
                _command.Parameters["@PRM_SUBEKODU"].Value = model.SubeKodu;
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

                }

                veritabani.BaglantiAyarla();

                return models;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<SatisUrunModel>? GetSatisUrun(SatisRequestModel model)
        {
            try
            {
                List<SatisUrunModel> models = new List<SatisUrunModel>();
                _command = new SqlCommand("dbo.PrgProc_BI_FisHareketIzle");
                _command.Parameters.Add(new SqlParameter("@KULLANICI", SqlDbType.Int));
                _command.Parameters["@KULLANICI"].Value = model.Kullanici;
                _command.Parameters.Add(new SqlParameter("@SUBE_KODU", SqlDbType.Int));
                _command.Parameters["@SUBE_KODU"].Value = model.SubeKodu;
                _command.Parameters.Add(new SqlParameter("@TARIH", SqlDbType.DateTime));
                _command.Parameters["@TARIH"].Value = model.Tarih;
                _command.Parameters.Add(new SqlParameter("@BARKOD", SqlDbType.VarChar, 20));
                _command.Parameters["@BARKOD"].Value = model.Barkod;
                _command.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter dr = veritabani.adapter(_command);
                dr.Fill(dataSet);
                var data = dataSet.Tables[0];
                foreach (DataRow row in data.Rows)
                {
                    var de = data.Rows.Count;
                    SatisUrunModel satisUrunModel = new SatisUrunModel();
                    satisUrunModel.Tarih = (DateTime?)row[1];
                    satisUrunModel.Sube = (double?)row[2];
                    satisUrunModel.KasaNo = (int?)row[3];
                    satisUrunModel.FisNo = (int?)row[4];
                    satisUrunModel.Saat = (decimal?)row[5];
                    satisUrunModel.Sira = (int?)row[6];
                    satisUrunModel.MusteriNo = (string?)row[7];
                    satisUrunModel.ZNo = (int?)row[8];
                    satisUrunModel.StokAd = (string?)row[9];
                    satisUrunModel.StokKod = (string?)row[10];
                    satisUrunModel.Barkod = (string?)row[11];
                    satisUrunModel.Belge = (string?)row[12];
                    satisUrunModel.Durumu = (string?)row[13];
                    satisUrunModel.Kasiyer = (decimal?)row[14];
                    satisUrunModel.Kdv = (decimal?)row[15];
                    satisUrunModel.Fiyat = (decimal?)row[16];
                    satisUrunModel.Miktar = (decimal?)row[17];
                    satisUrunModel.Birim = (string?)row[18];
                    satisUrunModel.Tutar = (decimal?)row[19];
                    satisUrunModel.SatirInd = (decimal?)row[20];
                    satisUrunModel.GenelInd = (decimal?)row[21];
                    satisUrunModel.FisToplam = (decimal?)row[22];
                    models.Add(satisUrunModel);
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
