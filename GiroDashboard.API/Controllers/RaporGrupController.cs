using GiroDashboard.Application.DTOs.Rapor.Grup;
using GiroDashboard.Application.DTOs;
using GiroDashboard.Application.Repositories.EFcore.Rapor.RaporGrup;
using GiroDashboard.Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GiroDashboard.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RaporGrupController : ControllerBase
    {
        private readonly IRaporGrupReadRepository _raporGrupReadRepository;
        private readonly IRaporGrupWriteRepository _raporGrupWriteRepository;
        private readonly ILogger<RaporGrupController> _logger;
        bool isCompleted = false;

        public RaporGrupController(IRaporGrupReadRepository raporGrupReadRepository, IRaporGrupWriteRepository raporGrupWriteRepository, ILogger<RaporGrupController> logger)
        {
            _raporGrupReadRepository = raporGrupReadRepository;
            _raporGrupWriteRepository = raporGrupWriteRepository;
            _logger = logger;
        }
        [HttpGet("GetRaporGrup")]
        public IActionResult GetRaporGrup()
        {
            var response = _raporGrupReadRepository.GetAll(true);
            _logger.LogInformation("RaporGrup Listelendi");
            return Ok(response);
        }
        [HttpPost("AddRaporGrup")]
        public async Task<IActionResult> AddRaporGrup(RaporGrupAddModel model)
        {
            Tblmblraporgrup tblmblraporgrup = (Tblmblraporgrup)model;
            isCompleted = await _raporGrupWriteRepository.AddAsync(tblmblraporgrup);
            if (isCompleted)
            {
                int result = await _raporGrupWriteRepository.SaveAsync();
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
        [HttpPut("UpdateRaporGrup")]
        public async Task<IActionResult> UpdateRaporGrup(RaporGrupAddModel model)
        {
            Tblmblraporgrup urysTblRaportanim = (Tblmblraporgrup)model;
            isCompleted = _raporGrupWriteRepository.Update(urysTblRaportanim);
            if (isCompleted)
            {
                int result =await _raporGrupWriteRepository.SaveAsync();//await _raporGrupWriteRepository.SaveAsync();
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
            }
                throw new Exception();
        }
        [HttpDelete("DeleteRaporGrup")]
        public async Task<IActionResult> DeleteRaporGrup(RaporGrupTanimModel model)
        {
            var raporGrup = await _raporGrupReadRepository.GetSingleAsync(i => i.Id == model.Id, true);
            isCompleted = _raporGrupWriteRepository.Remove(raporGrup);
            if (isCompleted)
            {
                int result = await _raporGrupWriteRepository.SaveAsync();
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
