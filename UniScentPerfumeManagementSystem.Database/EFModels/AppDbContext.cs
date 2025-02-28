using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace UniScentPerfumeManagementSystem.Database.EFModels;

public partial class AppDbContext : DbContext
{
    public AppDbContext()
    {
    }

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TblOrder> TblOrders { get; set; }

    public virtual DbSet<TblOrderItem> TblOrderItems { get; set; }

    public virtual DbSet<TblPerfume> TblPerfumes { get; set; }

    public virtual DbSet<TblRole> TblRoles { get; set; }

    public virtual DbSet<TblUser> TblUsers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=.;Database=PerfumeShopManagementSystem;User Id=sa;Password=sa@123;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblOrder>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__TblOrder__3214EC0753270EBD");

            entity.ToTable("TblOrder");

            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.OrderDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.PaymentMethod).HasMaxLength(100);
            entity.Property(e => e.Status).HasMaxLength(50);
            entity.Property(e => e.TotalAmount).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.UpdatedAt).HasColumnType("datetime");

            entity.HasOne(d => d.User).WithMany(p => p.TblOrders)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TblOrder_UserId");
        });

        modelBuilder.Entity<TblOrderItem>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__TblOrder__3214EC07451944FB");

            entity.ToTable("TblOrderItem");

            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.UnitPrice).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.Order).WithMany(p => p.TblOrderItems)
                .HasForeignKey(d => d.OrderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__TblOrderI__Order__3BFFE745");

            entity.HasOne(d => d.Perfume).WithMany(p => p.TblOrderItems)
                .HasForeignKey(d => d.PerfumeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__TblOrderI__Perfu__3CF40B7E");
        });

        modelBuilder.Entity<TblPerfume>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__TblPerfu__3214EC0766E12350");

            entity.ToTable("TblPerfume");

            entity.Property(e => e.Category).HasMaxLength(100);
            entity.Property(e => e.CompanyName).HasMaxLength(255);
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Longevity).HasMaxLength(255);
            entity.Property(e => e.Name).HasMaxLength(255);
            entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.SizeMl).HasColumnName("SizeML");
            entity.Property(e => e.Status).HasDefaultValue(true);
            entity.Property(e => e.UpdatedAt).HasColumnType("datetime");
        });

        modelBuilder.Entity<TblRole>(entity =>
        {
            entity.HasKey(e => e.RoleId).HasName("PK__TblRole__8AFACE1A8072FE64");

            entity.ToTable("TblRole");

            entity.HasIndex(e => e.RoleCode, "UQ__TblRole__D62CB59C2173A7B7").IsUnique();

            entity.Property(e => e.RoleId).ValueGeneratedNever();
            entity.Property(e => e.RoleCode).HasMaxLength(50);
            entity.Property(e => e.RoleName).HasMaxLength(100);
        });

        modelBuilder.Entity<TblUser>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__TblUser__3214EC0756509803");

            entity.ToTable("TblUser");

            entity.HasIndex(e => e.Email, "UQ__TblUser__A9D10534E258268C").IsUnique();

            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Email).HasMaxLength(255);
            entity.Property(e => e.Password).HasMaxLength(255);
            entity.Property(e => e.PhoneNo).HasMaxLength(15);
            entity.Property(e => e.RoleCode).HasMaxLength(50);
            entity.Property(e => e.UpdatedDate).HasColumnType("datetime");
            entity.Property(e => e.UserId).HasMaxLength(50);
            entity.Property(e => e.UserName).HasMaxLength(255);

            entity.HasOne(d => d.RoleCodeNavigation).WithMany(p => p.TblUsers)
                .HasPrincipalKey(p => p.RoleCode)
                .HasForeignKey(d => d.RoleCode)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TblUser_RoleCode");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
