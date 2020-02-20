namespace DoAnTotNghiep.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Tin")]
    public partial class Tin
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tin()
        {
            HinhAnh = new HashSet<HinhAnh>();
            LuuTin = new HashSet<LuuTin>();
        }

        [Key]
        public int MaTin { get; set; }

        [Required]
        [StringLength(150)]
        public string TieuDe { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayDang { get; set; }

        [Required]
        [StringLength(150)]
        public string DiaChi { get; set; }

        public int Gia { get; set; }

        [StringLength(10)]
        public string DienTich { get; set; }

        [StringLength(20)]
        public string DoiTuong { get; set; }

        [Required]
        public string MoTaChiTiet { get; set; }

        public int MaQuan { get; set; }

        public int MaPhuong { get; set; }

        public int? LuotXem { get; set; }

        public int MaTV { get; set; }

        public int MaLoai { get; set; }

        public bool KiemDuyet { get; set; }

        [StringLength(10)]
        public string SDTLienHe { get; set; }

        [StringLength(50)]
        public string GhiChu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HinhAnh> HinhAnh { get; set; }

        public virtual LoaiTin LoaiTin { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LuuTin> LuuTin { get; set; }

        public virtual Phuong Phuong { get; set; }

        public virtual Quan Quan { get; set; }

        public virtual ThanhVien ThanhVien { get; set; }
    }
}
