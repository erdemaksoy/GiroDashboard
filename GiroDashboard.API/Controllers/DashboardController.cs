using GiroDashboard.Application.DTOs;
using GiroDashboard.Application.DTOs.Dashboard;
using GiroDashboard.Application.DTOs.Rapor.Filtre;
using GiroDashboard.Application.Repositories.EFcore.Dashboard;
using GiroDashboard.Application.Repositories.SQL;
using GiroDashboard.Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GiroDashboard.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DashboardController : ControllerBase
    {
        private readonly IDashboardSQL _dashboardSQL;
        private readonly IDashboardReadRepository _dashboardEfRead;
        private readonly IDashboardWriteRepository _dashboardEfWrite;
        bool isCompleted = false;

        public DashboardController(IDashboardSQL dashboardSQL, IDashboardReadRepository dashboardEfRead, IDashboardWriteRepository dashboardEfWrite)
        {
            _dashboardSQL = dashboardSQL;
            _dashboardEfRead = dashboardEfRead;
            _dashboardEfWrite = dashboardEfWrite;
        }

        [HttpPost("GetDashboardData")]
        public IActionResult GetDashboardData(DashboardRequestModel request)
        {
            var response = _dashboardSQL.GetDashboardData(request);
            return Ok(response);
        }
        [HttpGet("GetDashboards")]
        public IActionResult GetDashboards()
        {
            var response = _dashboardEfRead.GetAll(true);
            return Ok(response);
        }
        [HttpPost("AddDashboard")]
        public async Task<IActionResult> AddDashboard(DashboardAddModel model)
        {
            UrysTblDashboard dashboard = (UrysTblDashboard)model;
            isCompleted = await _dashboardEfWrite.AddAsync(dashboard);
            if (isCompleted)
            {
                int result = await _dashboardEfWrite.SaveAsync();
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
        [HttpPut("UpdateDashboard")]
        public async Task<IActionResult> UpdateDashboard(DashboardAddModel model)
        {
            UrysTblDashboard dashboard = (UrysTblDashboard)model;
            isCompleted = _dashboardEfWrite.Update(dashboard);
            if (isCompleted)
            {
                int result = await _dashboardEfWrite.SaveAsync();
                if (result > 0)
                {
                    return Ok(
                    new MessageModel()
                    {
                        Succeded = true,
                        Message = "Başarılı"
                    }     );
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
        [HttpDelete("DeleteDashboard")]
        public async Task<IActionResult> DeleteDashboard(DashboardAddModel model)
        {
            var dashboard = await _dashboardEfRead.GetSingleAsync(i => i.Id == model.Id, true);
            isCompleted = _dashboardEfWrite.Remove(dashboard);
            if (isCompleted)
            {
                int result = await _dashboardEfWrite.SaveAsync();
                if (result > 0)
                {
                    return Ok(
                        new MessageModel()
                        {
                            Succeded = true,
                            Message = "Başarılı"
                        }                                                                                                                   );
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
