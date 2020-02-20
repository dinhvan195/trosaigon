namespace DoAnTotNghiep.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DBTro : DbContext
    {
        public DBTro()
            : base("name=DBTro")
        {
        }

        public virtual DbSet<HinhAnh> HinhAnh { get; set; }
        public virtual DbSet<LoaiTin> LoaiTin { get; set; }
        public virtual DbSet<LuuTin> LuuTin { get; set; }
        public virtual DbSet<Phuong> Phuong { get; set; }
        public virtual DbSet<Quan> Quan { get; set; }
        public virtual DbSet<Tin> Tin { get; set; }
        public virtual DbSet<ThanhVien> ThanhVien { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<HinhAnh>()
                .Property(e => e.DuongDan)
                .IsFixedLength();

            modelBuilder.Entity<LoaiTin>()
                .Property(e => e.TenLoai)
                .IsFixedLength();

            modelBuilder.Entity<LoaiTin>()
                .HasMany(e => e.Tin)
                .WithRequired(e => e.LoaiTin)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Phuong>()
                .Property(e => e.TenPhuong)
                .IsFixedLength();

            modelBuilder.Entity<Phuong>()
                .HasMany(e => e.Tin)
                .WithRequired(e => e.Phuong)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Quan>()
                .Property(e => e.TenQuan)
                .IsFixedLength();

            modelBuilder.Entity<Quan>()
                .HasMany(e => e.Phuong)
                .WithRequired(e => e.Quan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Quan>()
                .HasMany(e => e.Tin)
                .WithRequired(e => e.Quan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Tin>()
                .Property(e => e.DienTich)
                .IsFixedLength();

            modelBuilder.Entity<Tin>()
                .Property(e => e.SDTLienHe)
                .IsFixedLength();

            modelBuilder.Entity<Tin>()
                .HasMany(e => e.HinhAnh)
                .WithRequired(e => e.Tin)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ThanhVien>()
                .Property(e => e.SDT)
                .IsFixedLength();

            modelBuilder.Entity<ThanhVien>()
                .HasMany(e => e.Tin)
                .WithRequired(e => e.ThanhVien)
                .WillCascadeOnDelete(false);
        }
    }
}
