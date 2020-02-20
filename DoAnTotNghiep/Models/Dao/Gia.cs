using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnTotNghiep.Models.Dao
{
    public class Gia
    {
        public int MaGia { get; set; }
        public string GiaPhong { get; set; }
        public Gia(int magia, string giaphong)
        {
            MaGia = magia;
            GiaPhong = giaphong;
        }
    }
}