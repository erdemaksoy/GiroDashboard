using GiroDashboard.Application.DTOs.Rapor.Tanim;
using GiroDashboard.Application.DTOs;
using GiroDashboard.Application.Repositories.EFcore.Yetki;
using GiroDashboard.Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using GiroDashboard.Application.DTOs.Yetki;
using GiroDashboard.Application.DTOs.Role;
using GiroDashboard.Persistence.Repositories.EFcore.Yetki;
using GiroDashboard.Application.Repositories.SQL;

namespace GiroDashboard.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class YetkiController : ControllerBase
    {
        private readonly IYetkiSQL _yetkiSQL;
        private readonly IYetkiReadRepository _yetkiReadRepository;
        private readonly ILogger<YetkiController> _logger;
        private readonly IYetkiWriteRepository _yetkiWriteRepository;
        bool isCompleted = false;
        public YetkiController(IYetkiReadRepository yetkiReadRepository, ILogger<YetkiController> logger, IYetkiWriteRepository yetkiWriteRepository, IYetkiSQL yetkiSQL)
        {
            _yetkiReadRepository = yetkiReadRepository;
            _logger = logger;
            _yetkiWriteRepository = yetkiWriteRepository;
            _yetkiSQL = yetkiSQL;
        }
        [HttpPost("GetYetki")]
        public IActionResult GetYetki(RoleEditModel model)
        {
            var response = _yetkiReadRepository.GetWhere(x => x.RolId == model.RolId);
            _logger.LogInformation("Yetkiler Listelendi");
            return Ok(response);
        }
        [HttpPost("AddYetki")]
        public async Task<IActionResult> AddYetki(YetkiAddModel model)
        {
            Tblyetki tblyetki = (Tblyetki)model;
            isCompleted = await _yetkiWriteRepository.AddAsync(tblyetki);
            if (isCompleted)
            {
                int result = await _yetkiWriteRepository.SaveAsync();
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
        [HttpPut("UpdateYetki")]
        public async Task<IActionResult> Updateyetki(YetkiModel model)
        {
            Tblyetki tblyetki = (Tblyetki)model;
            isCompleted = _yetkiWriteRepository.Update(tblyetki);
            if (isCompleted)
            {
                int result = await _yetkiWriteRepository.SaveAsync();
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

        [HttpPost("YetkiEkle")]
        public async Task<IActionResult> YetkiEkle(RoleEditModel model)
        {
            isCompleted = _yetkiSQL.YetkiDuzenle(model.RolId);
            if (isCompleted)
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
    }
}
