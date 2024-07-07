using GiroDashboard.Application.DTOs.Muhasebe;
using GiroDashboard.Application.Repositories.SQL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GiroDashboard.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MuhasebeController : ControllerBase
    {
        private readonly IMuhasebeSQL _muhasebeSQL;
        private readonly ILogger<MuhasebeController> _logger;

        public MuhasebeController(IMuhasebeSQL muhasebeSQL, ILogger<MuhasebeController> logger)
        {
            _muhasebeSQL = muhasebeSQL;
            _logger = logger;
        }
        [HttpPost("KasiyerAcik")]
        public IActionResult GetKasiyerAcik(MuhasebeRequestModel model)
        {
            var response = _muhasebeSQL.GetKasiyerAcik(model);
            _logger.LogInformation("KasiyerAcik Listelendi");
            return Ok(response);
        }
        [HttpPost("KasiyerPerformans")]
        public IActionResult GetKasiyerPerformans(MuhasebeRequestModel model)
        {
            var response = _muhasebeSQL.GetKasiyerPerformans(model);
            _logger.LogInformation("KasiyerPerformans Listelendi");
            return Ok(response);
        }
        [HttpPost("KDVDurum")]
        public IActionResult GetKDVDurum(MuhasebeRequestModel model)
        {
            var response = _muhasebeSQL.GetKDVDurum(model);
            _logger.LogInformation("KDVDurum Listelendi");
            return Ok(response);
        }
    }
}
