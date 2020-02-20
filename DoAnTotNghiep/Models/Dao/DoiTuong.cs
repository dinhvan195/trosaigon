using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnTotNghiep.Models.Dao
{
    public class DoiTuong
    {
        public int MaDT { get; set; }
        public string TenDT { get; set; }
        public DoiTuong(int madt,string tendt)
        {
            MaDT = madt;
            TenDT = tendt;
        }
        public List<DoiTuong> KTDL()
        {
            List<DoiTuong> dsDT = new List<DoiTuong> {
                                             new DoiTuong (1, "Tất cả"),
                                             new DoiTuong (2, "Nam"),
                                             new DoiTuong (3, "Nữ")
                                            };
            return dsDT;
        }
    }
}