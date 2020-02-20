namespace DoAnTotNghiep.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HinhAnh")]
    public partial class HinhAnh
    {
        [Key]
        public int MaAnh { get; set; }

        [Required]
        [StringLength(100)]
        public string DuongDan { get; set; }

        public int MaTin { get; set; }

        public virtual Tin Tin { get; set; }
    }
}
