using GiroDashboard.Application.DTOs.Rapor.Filtre;
using GiroDashboard.Application.DTOs;
using GiroDashboard.Application.Repositories.EFcore.Rapor.RaporFilitre;
using GiroDashboard.Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GiroDashboard.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RaporFiltreController : ControllerBase
    {
        private readonly IRaporFiltreReadRepository _raporFiltreReadRepository;
        private readonly IRaporFiltreWriteRepository _raporFiltreWriteRepository;
        private readonly ILogger<RaporFiltreController> _logger;
        bool isCompleted = false;

        public RaporFiltreController(IRaporFiltreReadRepository raporFiltreReadRepository, IRaporFiltreWriteRepository raporFiltreWriteRepository, ILogger<RaporFiltreController> logger)
        {
            _raporFiltreReadRepository = raporFiltreReadRepository;
            _raporFiltreWriteRepository = raporFiltreWriteRepository;
            _logger = logger;
        }

        [HttpGet("GetRaporFiltre")]
        public IActionResult GetRaporFiltre(string RaporKodu)
        {
            var response = _raporFiltreReadRepository.GetWhere(i => i.RaporKodu == RaporKodu, true);
            _logger.LogInformation("RaporFiltre Listelendi");
            return Ok(response);
        }
        [HttpPost("AddRaporFiltre")]
        public async Task<IActionResult> AddRaporFiltre(RaporFiltreAddModel model)
        {
            TblmbraporFiltre tblmbraporFiltre = (TblmbraporFiltre)model;
            isCompleted = await _raporFiltreWriteRepository.AddAsync(tblmbraporFiltre);
            if (isCompleted)
            {
                int result = await _raporFiltreWriteRepository.SaveAsync();
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
        [HttpPut("UpdateRaporFiltre")]
        public async Task<IActionResult> UpdateRaporFiltre(RaporFiltreAddModel model)
        {
            TblmbraporFiltre tblmbraporFiltre = (TblmbraporFiltre)model;
            isCompleted = _raporFiltreWriteRepository.Update(tblmbraporFiltre);
            if (isCompleted)
            {
                int result = await _raporFiltreWriteRepository.SaveAsync();
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
        [HttpDelete("DeleteRaporFiltre")]
        public async Task<IActionResult> DeleteRaporFiltre(RaporFiltreTanimModel model)
        {
            var raporFiltre = await _raporFiltreReadRepository.GetSingleAsync(i => i.Id == model.Id, true);
            isCompleted = _raporFiltreWriteRepository.Remove(raporFiltre);
            if (isCompleted)
            {
                int result = await _raporFiltreWriteRepository.SaveAsync();
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
