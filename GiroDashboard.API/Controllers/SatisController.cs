using GiroDashboard.Application.DTOs.Satis;
using GiroDashboard.Application.Repositories.SQL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GiroDashboard.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SatisController : ControllerBase
    {
        private readonly ISatisSQL _satisSQL;
        private readonly ILogger<SatisController> _logger;

        public SatisController(ISatisSQL satisSQL, ILogger<SatisController> logger)
        {
            _satisSQL = satisSQL;
            _logger = logger;
        }
        [HttpPost("SaatlikSatis")]
        public IActionResult GetSaatlikSatis( SatisRequestModel model)
        {
            var response = _satisSQL.GetSaatlikSatis(model);
            _logger.LogInformation("SaatlikSatis Listelendi");
            return Ok(response);
        }
        [HttpPost("SatisOdeme")]
        public IActionResult GetSatisOdeme(SatisRequestModel model)
        {
            var response = _satisSQL.GetSatisOdeme(model);
            _logger.LogInformation("SatisOdeme Listelendi");
            return Ok(response);
        }
        [HttpPost("SatisUrun")]
        public IActionResult GetSatisUrun(SatisRequestModel model)
        {
            var response = _satisSQL.GetSatisUrun(model);
            _logger.LogInformation("SatisUrun Listelendi");
            return Ok(response);
        }
    }
}
