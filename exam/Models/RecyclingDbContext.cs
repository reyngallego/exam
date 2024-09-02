using exam.Models;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

public class RecyclingDbContext : DbContext
{
    public DbSet<RecyclableType> RecyclableTypes { get; set; }
    public DbSet<RecyclableItem> RecyclableItems { get; set; }

    public RecyclingDbContext() : base("name=RecyclingDbContext")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

        modelBuilder.Entity<RecyclableType>()
            .Property(t => t.Rate)
            .HasPrecision(18, 2);

        modelBuilder.Entity<RecyclableType>()
            .Property(t => t.MinKg)
            .HasPrecision(18, 2);

        modelBuilder.Entity<RecyclableType>()
            .Property(t => t.MaxKg)
            .HasPrecision(18, 2);

        base.OnModelCreating(modelBuilder);
    }
}
