using GiroDashboard.Application.DTOs.User;
using GiroDashboard.Application.Repositories.EFcore.UrysViewUser;
using GiroDashboard.Application.Repositories.EFcore.User;
using GiroDashboard.Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Identity.Client.Platforms.Features.DesktopOs.Kerberos;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace GiroDashboard.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IUrysViewUserReadRepository _urysViewUserReadRepository;
        private readonly ILogger<AuthController> _logger;

        public AuthController(IUrysViewUserReadRepository urysViewUserReadRepository, ILogger<AuthController> logger)
        {
            _urysViewUserReadRepository = urysViewUserReadRepository;
            _logger = logger;
        }

        //[HttpGet]
        //public IActionResult Get()
        //{
        //    var signingKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("this is my custom Secret key for authentication"));
        //    var credentials = new SigningCredentials(signingKey, SecurityAlgorithms.HmacSha256);
        //    var claims = new[]
        //    {
        //        new Claim(JwtRegisteredClaimNames.Sub, "username"),
        //    };

        //    var jwtSecurityToken = new JwtSecurityToken(
        //    issuer: "https://www.fark.com.tr",
        //    audience: "audiencedegerii",
        //    claims: claims,
        //    expires: DateTime.Now.AddDays(1),
        //    notBefore: DateTime.Now,
        //    signingCredentials: credentials
        //    );

        //    var token = new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken);
        //    return Ok(token);



        //}
        [HttpPost("login")]
        public async Task<IActionResult> LoginAsync(LoginModel model)
        {
            try
            {
                var user = await _urysViewUserReadRepository.GetSingleAsync(i => i.KullaniciAdi == model.KullaniciAdi && i.Sifre == model.Sifre, true);
                var signingKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("this is my custom Secret key for authentication"));
                var credentials = new SigningCredentials(signingKey, SecurityAlgorithms.HmacSha256);
                var claims = new[]
                {
                new Claim(JwtRegisteredClaimNames.Name, user.KullaniciAdi),
                new Claim(ClaimTypes.Role, user.RolId.ToString()),
                new Claim(ClaimTypes.Surname, user.Sifre), // Assuming Sifre is the surname, change it to the correct claim type if not.
                new Claim(ClaimTypes.NameIdentifier, user.KullaniciNo.ToString()), // Assuming KullaniciNo is the unique identifier for the user, change it to the correct claim type if not.
            };

                var jwtSecurityToken = new JwtSecurityToken(
                issuer: "https://www.fark.com.tr",
                audience: "audiencedegerii",
                claims: claims,
                expires: DateTime.Now.AddDays(1),
                notBefore: DateTime.Now,
                signingCredentials: credentials
                );

                var token = new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken);
                _logger.LogInformation("User {0} logged in", user.KullaniciAdi);
                return Ok(token);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        [HttpGet("Validetoken")]
        public bool ValideToken(string token)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("this is my custom Secret key for authentication"));
            try
            {
                JwtSecurityTokenHandler handler = new();
                handler.ValidateToken(token, new TokenValidationParameters()
                {
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ValidateAudience = false,
                    ValidateIssuer = false,
                    IssuerSigningKey = securityKey
                }, out SecurityToken validatedToken);
                var jwtToken = (JwtSecurityToken)validatedToken;
                var claims = jwtToken.Claims.ToList();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        
    }
}
