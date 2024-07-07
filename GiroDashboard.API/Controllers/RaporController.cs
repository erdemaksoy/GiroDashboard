using GiroDashboard.Application.DTOs;
using GiroDashboard.Application.DTOs.Rapor.Tanim;
using GiroDashboard.Application.Repositories.EFcore.Rapor;

using GiroDashboard.Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GiroDashboard.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RaporController : ControllerBase
    {
        private readonly IRaporReadRepository _raporReadRepository;
        private readonly IRaporWriteRepository _raporWriteRepository;
        private readonly ILogger<RaporController> _logger;
        bool isCompleted = false;

        public RaporController(IRaporReadRepository raporReadRepository, IRaporWriteRepository raporWriteRepository, ILogger<RaporController> logger)
        {
            _raporReadRepository = raporReadRepository;
            _raporWriteRepository = raporWriteRepository;
            _logger = logger;
        }

        [HttpGet("GetRapor")]
        public IActionResult GetRapor()
        {
            var response = _raporReadRepository.GetAll(true);
            _logger.LogInformation("Rapor Listelendi");
            return Ok(response);
        }
        [HttpPost("AddRapor")]
        public async Task<IActionResult> AddRapor(RaporAddModel model)
        {
            Tblmbrapor tblmbrapor = (Tblmbrapor)model;
            isCompleted = await _raporWriteRepository.AddAsync(tblmbrapor);
            if (isCompleted)
            {
                int result = await _raporWriteRepository.SaveAsync();
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
        [HttpPut("UpdateRapor")]
        public async Task<IActionResult> UpdateRapor(RaporAddModel model)
        {
            Tblmbrapor tblmbrapor = (Tblmbrapor)model;
            isCompleted = _raporWriteRepository.Update(tblmbrapor);
            if (isCompleted)
            {
                int result = await _raporWriteRepository.SaveAsync();
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
        [HttpDelete("DeleteRapor")]
        public async Task<IActionResult> DeleteRapor(RaporTanimModel model)
        {
            var rapor = await _raporReadRepository.GetSingleAsync(i => i.Id == model.Id, true);
            isCompleted = _raporWriteRepository.Remove(rapor);
            if (isCompleted)
            {
                int result = await _raporWriteRepository.SaveAsync();
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
