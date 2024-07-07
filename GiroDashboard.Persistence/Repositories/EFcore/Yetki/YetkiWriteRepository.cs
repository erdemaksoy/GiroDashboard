using GiroDashboard.Application.DTOs.Rapor.Tanim;
using GiroDashboard.Application.DTOs;
using GiroDashboard.Application.Repositories.EFcore.Yetki;
using GiroDashboard.Domain;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Persistence.Repositories.EFcore.Yetki
{
    public class YetkiWriteRepository : WriteRepository<Tblyetki>, IYetkiWriteRepository
    {
        public YetkiWriteRepository(PbwebContext context) : base(context)
        {
        }
    }
}
