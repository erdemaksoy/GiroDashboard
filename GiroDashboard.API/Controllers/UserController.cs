using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using GiroDashboard.Application.DTOs.User;
using GiroDashboard.Domain;
using GiroDashboard.Persistence.Repositories.EFcore.User;
using GiroDashboard.Application.DTOs;
using GiroDashboard.Application.Repositories.EFcore.UrysViewUser;
using GiroDashboard.Application.Repositories.EFcore.User;
using GiroDashboard.Persistence.Repositories.EFcore.UrysViewUser;

namespace GiroDashboard.API.Controllers
{
    [Route("api/[controller]")]
    [Authorize(policy:"yönetici")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserReadRepository _userReadrepository;
        private readonly IUrysViewUserReadRepository _urysViewUserReadRepository;
        private readonly IUserWriteRepository _userwriterepository;
        private readonly ILogger<UserController> _logger;
        bool isCompleted = false;

        public UserController(IUserReadRepository userReadrepository, IUserWriteRepository userwriterepository, IUrysViewUserReadRepository urysViewUserReadRepository, ILogger<UserController> logger)
        {
            _userReadrepository = userReadrepository;
            _userwriterepository = userwriterepository;
            _urysViewUserReadRepository = urysViewUserReadRepository;
            _logger = logger;
        }

        [HttpPost("AddUser")]
        public async Task<IActionResult> AddUser(AddUserModel model)
        {
            Tblkullanici tblmbkullanici = (Tblkullanici)model;
            isCompleted = await _userwriterepository.AddAsync(tblmbkullanici);

            if (isCompleted)
            {
                int result = await _userwriterepository.SaveAsync();
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

        [HttpGet("GetUsers")]
        public async Task<IActionResult> GetUsers()
        {
            var users = _urysViewUserReadRepository.GetAll(true);
            if(users != null)
            {
                _logger.LogInformation("Kullanıcılar başarılı bir şekilde getirildi");
                return Ok(users);
            }
            else
            {
                _logger.LogInformation("Kullanıcılar getirilirken bir hata oluştu");
                return BadRequest(new MessageModel()
                {
                    Succeded = false,
                    Message = "Başarısız"
                });
            }
            
        }
        [HttpPost("GetUserforEdit")]
        public async Task<IActionResult> GetUserforEdit(ListUserModel model)
        {
            var user = await _userReadrepository.GetSingleAsync(i => i.KullId == model.KullaniciNo);
            if (user != null)
            {
                _logger.LogInformation("Kullanıcılar başarılı bir şekilde getirildi");
                return Ok(user);
            }
            else
            {
                _logger.LogInformation("Kullanıcılar getirilirken bir hata oluştu");
                return BadRequest(new MessageModel()
                {
                    Succeded = false,
                    Message = "Başarısız"
                });
            }

        }

        [HttpPut("EditUser")]
        public async Task<IActionResult> EditUser(EditUserModel model)
         {
            Tblkullanici tblkullanici = (Tblkullanici)model;
            isCompleted = _userwriterepository.Update(tblkullanici);

            if (isCompleted)
            {
                int result = await _userwriterepository.SaveAsync();
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
            throw new Exception("Bir hata oluştu");
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteUser(AddUserModel model)
        { 
            var user = await _userReadrepository.GetSingleAsync(i => i.KullKodu == model.KullKodu, true);
            isCompleted = _userwriterepository.Remove(user);
            if (isCompleted)
            {
                int result = await _userwriterepository.SaveAsync();
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
