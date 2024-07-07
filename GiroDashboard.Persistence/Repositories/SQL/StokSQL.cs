using GiroDashboard.Application.DTOs.Stok;
using GiroDashboard.Application.Repositories.SQL;
using GiroDashboard.Persistence.Repositories.SQL;
using Microsoft.Data.SqlClient;
using System.Data;

public class StokSQL : IStokSQL
{
    private Database veritabani;
    SqlCommand _command;
    DataSet dataSet;
    public StokSQL()
    {
        veritabani = new Database();
        dataSet = new DataSet();
    }
    public List<StokEnModel>? GetStokEnCokSatan(StokRequestModel model)
    {
        try
        {
            List<StokEnModel> models = new List<StokEnModel>();
            _command = new SqlCommand("dbo.PrgProc_BI_Analiz");
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
                StokEnModel stokenmodel = new StokEnModel();
                stokenmodel.StokKodu = (string?)row[1];
                stokenmodel.StokAdi = (string?)row[2];
                stokenmodel.SatisMiktari = (decimal?)row[3];
                stokenmodel.SatisTutari = (decimal?)row[4];
                models.Add(stokenmodel);
            }
            veritabani.BaglantiAyarla();

            return models;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public List<StokGimsaModel>? GetStokGimsa(StokRequestModel model)
    {
        try
        {
            List<StokGimsaModel>? models = new();
            _command = new SqlCommand("dbo.PrgProc_BI_GimsaSatis");
            _command.Parameters.Add(new SqlParameter("@Barkod", SqlDbType.VarChar, 20));
            _command.Parameters["@Barkod"].Value = model.Barkod;
            _command.Parameters.Add(new SqlParameter("@ADI", SqlDbType.VarChar));
            _command.Parameters["@ADI"].Value = model.UrunAdı == null ? "" : model.UrunAdı;
            _command.Parameters.Add(new SqlParameter("@KOD", SqlDbType.VarChar));
            _command.Parameters["@KOD"].Value = model.UrunKodu == null ? "" : model.UrunKodu;
            _command.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter dr = veritabani.adapter(_command);
            dr.Fill(dataSet);
            var data = dataSet.Tables[0];
            foreach (DataRow row in data.Rows)
            {
                StokGimsaModel stokGimsaModel = new();
                stokGimsaModel.StokNo = (string?)row[0];
                stokGimsaModel.UrunKodu = (string?)row[1];
                stokGimsaModel.Barkod = (double?)row[2];
                stokGimsaModel.UrunAdı = (string?)row[3];
                stokGimsaModel.KdvHariçMal = (decimal?)row[4];
                stokGimsaModel.SatışFiyatı = (decimal?)row[5];
                stokGimsaModel.Kdv = (string?)row[6];
                stokGimsaModel.Mevcut = (string?)row[7];
                stokGimsaModel.Brm = (string?)row[8];
                stokGimsaModel._2023 = (string?)row[9];
                stokGimsaModel._2022 = (string?)row[10];
                stokGimsaModel._2021 = (string?)row[11];
                stokGimsaModel._2020 = (string?)row[12];
                stokGimsaModel.Giriş2023 = (string?)row[13];
                models.Add(stokGimsaModel);
            }
            //veritabani.BaglantiAyarla();
            return models;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        
    }

    public List<StokModel>? GetStokHareket(StokRequestModel model)
    {
        try
        {
            List<StokModel> models = new List<StokModel>();
            _command = new SqlCommand("dbo.PrgProc_BI_StokHareketIzle");
            _command.Parameters.Add(new SqlParameter("@Barkod", SqlDbType.VarChar, 20));
            _command.Parameters["@Barkod"].Value = model.Barkod;
            _command.Parameters.Add(new SqlParameter("@SUBE_KODU", SqlDbType.Int));
            _command.Parameters["@SUBE_KODU"].Value = model.SubeKodu;
            _command.Parameters.Add(new SqlParameter("@KULLANICI", SqlDbType.Int));
            _command.Parameters["@KULLANICI"].Value = model.Kullanici;
            _command.CommandType = CommandType.StoredProcedure;


            SqlDataAdapter dr = veritabani.adapter(_command);
            dr.Fill(dataSet);
            var data = dataSet.Tables[0];
            foreach (DataRow row in data.Rows)
            {
                StokModel stokModel = new StokModel();
                var de = data.Rows.Count;
                stokModel.SubeKodu = (int?)row[0];
                stokModel.Tarih = (DateTime?)row[1];
                stokModel.BelgeNo = (string?)row[2];
                stokModel.EvrakNo = (string?)row[3];
                stokModel.BelgeTipi = (int?)row[4];
                stokModel.BelgeAdi = (string?)row[5];
                stokModel.GirenMiktar = (decimal?)row[6];
                stokModel.CikanMiktar = (decimal?)row[7];
                stokModel.HarBakiye = (decimal?)row[8];
                stokModel.CariAdi = (string?)row[9];
                stokModel.StokNF = (decimal?)row[10];
                stokModel.NetTutar = (decimal?)row[11];
                //var a = row[13];
                stokModel.StokBF = (decimal?)row[12];
                //stokModel.KdvOrani = (decimal?)row[13];
                stokModel.StokHr_Recno = (int?)row[14];

                models.Add(stokModel);
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