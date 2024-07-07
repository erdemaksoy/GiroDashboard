using GiroDashboard.Application.DTOs.Rapor.Kolon;
using GiroDashboard.Application.DTOs;
using GiroDashboard.Application.Repositories.EFcore.Rapor.RaporKolon;
using GiroDashboard.Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GiroDashboard.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RaporKolonController : ControllerBase
    {
        private readonly IRaporKolonWriteRepository _raporKolonWriteRepository;
        private readonly IRaporKolonReadRepository _raporKolonReadRepository;
        private readonly ILogger<RaporKolonController> _logger;
        bool isCompleted = false;

        public RaporKolonController(IRaporKolonWriteRepository raporKolonWriteRepository, IRaporKolonReadRepository raporKolonReadRepository, ILogger<RaporKolonController> logger)
        {
            _raporKolonWriteRepository = raporKolonWriteRepository;
            _raporKolonReadRepository = raporKolonReadRepository;
            _logger = logger;
        }
        [HttpGet("GetRaporKolon")]
        public IActionResult GetRaporKolon(string RaporKodu)
        {
            var response = _raporKolonReadRepository.GetWhere(i => i.RaporKodu == RaporKodu, true);
            _logger.LogInformation("RaporKolon Listelendi");
            return Ok(response);
        }
        [HttpPost("AddRaporKolon")]
        public async Task<IActionResult> AddRaporKolon(RaporKolonAddModel model)
        {
            Tblmbraporkolon tblmbraporkolon = (Tblmbraporkolon)model;
            isCompleted = await _raporKolonWriteRepository.AddAsync(tblmbraporkolon);
            if (isCompleted)
            {
                int result = await _raporKolonWriteRepository.SaveAsync();
                if (result > 0)
                {
                    return Ok(
                                                                                         new MessageModel()
                                                                                         {
                                                                                             Succeded = true,
                                                                                             Message = "Başarılı"
                                                                                         }
                                                                                                                                                                                                                      );
                }
                else
                {
                    return BadRequest(new MessageModel()
                    {
                        Succeded = false,
                        Message = "Başarısız"
                    });
                }
            }
            else
            {
                return BadRequest(new MessageModel()
                {
                    Succeded = false,
                    Message = "Başarısız"
                });
            }
        }
        [HttpPut("UpdateRaporKolon")]
        public async Task<IActionResult> UpdateRaporKolon(RaporKolonAddModel model)
        {
            Tblmbraporkolon tblmbraporkolon = (Tblmbraporkolon)model;
            isCompleted = _raporKolonWriteRepository.Update(tblmbraporkolon);
            if (isCompleted)
            {
                int result = await _raporKolonWriteRepository.SaveAsync();
                if (result > 0)
                {
                    return Ok(
                                                                                                                                       new MessageModel()
                                                                                                                                       {
                                                                                                                                           Succeded = true,
                                                                                                                                           Message = "Başarılı"
                                                                                                                                       }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                           );
                }
                else
                {
                    return BadRequest(new MessageModel()
                    {
                        Succeded = false,
                        Message = "Başarısız"
                    });
                }
            }
            else
            {
                return BadRequest(new MessageModel()
                {
                    Succeded = false,
                    Message = "Başarısız"
                });
            }
        }
        [HttpDelete("DeleteRaporKolon")]
        public async Task<IActionResult> DeleteRaporKolon(RaporKolonTanimModel model)
        {
            var raporKolon = await _raporKolonReadRepository.GetSingleAsync(i => i.Id == model.Id, true);
            isCompleted = _raporKolonWriteRepository.Remove(raporKolon);
            if (isCompleted)
            {
                int result = await _raporKolonWriteRepository.SaveAsync();
                if (result > 0)
                {
                    return Ok(
                                                                                                                                                                                                                                                                       new MessageModel()
                                                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                                                           Succeded = true,
                                                                                                                                                                                                                                                                           Message = "Başarılı"
                                                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            );
                }
                else
                {
                    return BadRequest(new MessageModel()
                    {
                        Succeded = false,
                        Message = "Başarısız"
                    });
                }
            }
            else
            {
                return BadRequest(new MessageModel()
                {
                    Succeded = false,
                    Message = "Başarısız"
                });
            }
        }
    }
}
