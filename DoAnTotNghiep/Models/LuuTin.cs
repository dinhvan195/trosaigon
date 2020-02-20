namespace DoAnTotNghiep.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LuuTin")]
    public partial class LuuTin
    {
        [Key]
        public int MaTinLuu { get; set; }

        public int? MaTin { get; set; }

        public int? MaTV { get; set; }

        public virtual Tin Tin { get; set; }

        public virtual ThanhVien ThanhVien { get; set; }
    }
}
