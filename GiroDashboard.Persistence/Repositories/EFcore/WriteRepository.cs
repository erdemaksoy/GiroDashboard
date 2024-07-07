using GiroDashboard.Domain;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GiroDashboard.Application.Repositories.EFcore;

namespace GiroDashboard.Persistence.Repositories.EFcore;

public class WriteRepository<T> : IWriteRepository<T> where T : class
{
    private readonly PbwebContext _context;
    public WriteRepository(PbwebContext context)
    {
        _context = context;
    }
    public DbSet<T> Table => _context.Set<T>();

    public async Task<bool> AddAsync(T entity)
    {
        EntityEntry<T> entry = await Table.AddAsync(entity);
        return entry.State == EntityState.Added;
    }

    public async Task<bool> AddAsync(List<T> entity)
    {
        await Table.AddRangeAsync(entity);
        return true;
    }
    public bool Update(T entity)
    {
        EntityEntry<T> entry = Table.Update(entity);
        return entry.State == EntityState.Modified;
    }
    public bool Remove(T entity)
    {
        EntityEntry<T> entry = Table.Remove(entity);
        return entry.State == EntityState.Deleted;
    }

    public Task<int> SaveAsync()
     => _context.SaveChangesAsync();
}
