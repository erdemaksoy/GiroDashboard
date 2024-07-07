using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GiroDashboard.Application.Repositories.EFcore
{
    public interface IWriteRepository<T> : IRepository<T> where T : class
    {
        Task<bool> AddAsync(T entity);
        Task<bool> AddAsync(List<T> entity);
        bool Update(T entity);
        Task<int> SaveAsync();
        bool Remove(T entity);
    }
}
