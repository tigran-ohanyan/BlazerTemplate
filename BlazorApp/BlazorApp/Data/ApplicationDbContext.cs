using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

    public DbSet<User> Users { get; set; }
    public DbSet<TasksList> Tasks { get; set; }
    
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.Entity<User>()
            .HasKey(u => u.id); 
        modelBuilder.Entity<User>()
            .ToTable("users");
        modelBuilder.Entity<TasksList>()
            .HasKey(o => o.Id);
        modelBuilder.Entity<TasksList>()
            .ToTable("tasks");
    }
}

