using GiroDashboard.Application.DTOs.Stok;
using GiroDashboard.Application.Repositories.SQL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GiroDashboard.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StokController : ControllerBase
    {
        private readonly IStokSQL _stokSQL;
        private readonly ILogger<StokController> _logger;
        public StokController(IStokSQL stokSQL, ILogger<StokController> logger)
        {
            _stokSQL = stokSQL;
            _logger = logger;
        }
        [HttpPost("Gimsa")]
        public IActionResult GetStokGimsa( StokRequestModel model)
        {
            var stokGimsa = _stokSQL.GetStokGimsa(model);//ilk üçlüye değer girmeyi zorunlu kılıyor
            _logger.LogInformation("Stok Gimsa Listelendi");
            return Ok(stokGimsa);
        }
        [HttpPost("StokHareket")]
        public IActionResult GetStokHareket( StokRequestModel model)
        {
            var stokHareket = _stokSQL.GetStokHareket(model);
            _logger.LogInformation("Stok Hareket Listelendi");
            return Ok(stokHareket);
        }
        [HttpPost("EnCokSatanUrunler")]
        public IActionResult GetEnCok( StokRequestModel model)
        {
            var stokHareket = _stokSQL.GetStokEnCokSatan(model);
            _logger.LogInformation("En Çok Satan Ürünler Listelendi");
            return Ok(stokHareket);
        }
    }
}
