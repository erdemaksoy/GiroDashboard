using GiroDashboard.Application.DTOs;
using GiroDashboard.Application.DTOs.Role;
using GiroDashboard.Application.Repositories.EFcore.Role;
using GiroDashboard.Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GiroDashboard.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoleController : ControllerBase
    {
        private readonly IRoleReadRepository _roleReadRepostory;
        private readonly IRoleWriteRepository _roleWriteRepository;
        private readonly ILogger<RoleController> _logger;
        bool isCompleted = false;

        public RoleController(IRoleReadRepository roleReadRepostory, IRoleWriteRepository roleWriteRepository, ILogger<RoleController> logger)
        {
            _roleReadRepostory = roleReadRepostory;
            _roleWriteRepository = roleWriteRepository;
            _logger = logger;
        }

        [HttpGet("roles")]
        public IActionResult GetRoles()
        {
            var role = _roleReadRepostory.GetAll(true);
            if (role != null)
            {
                _logger.LogInformation("GetRoles methodu çalıştı");
                return Ok(role);
            }
            else
            {
                _logger.LogInformation("GetRoles methodu çalıştı");
                return BadRequest(new MessageModel()
                {
                    Succeded = false,
                    Message = "Başarısız"
                });
            }
        }

        [HttpPost("AddRole")]
        public async Task<IActionResult> AddRole(RoleAddModel model)
        {

            Tblrol role = (Tblrol)model;

            isCompleted = await _roleWriteRepository.AddAsync(role);
            if (isCompleted)
            {
                int result = await _roleWriteRepository.SaveAsync();
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
        [HttpPut("EditRole")]
        public async Task<IActionResult> EditRole(RoleEditModel model)
        {
            Tblrol role = (Tblrol)model;
            isCompleted = _roleWriteRepository.Update(role);
            if (isCompleted)
            {
                int result = await _roleWriteRepository.SaveAsync();
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
        [HttpDelete]
        public async Task<IActionResult> DeleteRole(RoleEditModel model)
        {
            var role = await _roleReadRepostory.GetSingleAsync(i => i.RolId == model.RolId, true);
            if (role != null)
            {
                isCompleted = _roleWriteRepository.Remove(role);
                if (isCompleted)
                {
                    int result = await _roleWriteRepository.SaveAsync();
                    if (result > 0)
                    {
                        return Ok(
                        new MessageModel()
                        {
                            Succeded = true,
                            Message = "Başarılı"
                        });
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