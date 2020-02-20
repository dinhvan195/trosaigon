using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnTotNghiep.Models;
using PagedList;
using DoAnTotNghiep.Models.Dao;

namespace DoAnTotNghiep.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        DBTro db = new DBTro();
        public ActionResult Index(int? page)//Danh sách tin
        {
            List<DoiTuong> DT = new List<DoiTuong> { new DoiTuong(1, "Tất cả"), new DoiTuong(2, "Nam"), new DoiTuong(3, "Nữ") };
            List<Gia> G = new List<Gia> { new Gia(1000000, "Dưới 1.000.000 vnđ"), new Gia(2000000, "Dưới 2.000.000 vnđ"), new Gia(3000000, "Dưới 3.000.000 vnđ"), new Gia(5000000, "Dưới 5.000.000 vnđ"), new Gia(5000001, "Trên 5.000.000 vnđ") };
            var DStin = db.Tin.Where(x => x.KiemDuyet == true).ToList();//lấy tin đã kiễm duyệt
            var pageSize = 12;
            var pageNumber = (int)(page == null ? 1 : page);
            ViewBag.LoaiTin = new SelectList(db.LoaiTin, "MaLoai", "TenLoai");
            ViewBag.Quan = new SelectList(db.Quan, "MaQuan", "TenQuan");
            ViewBag.DoiTuong = new SelectList(DT, "TenDT", "TenDT");
            ViewBag.Gia = new SelectList(G, "MaGia", "GiaPhong");
            return View(DStin.OrderBy(x => x.NgayDang).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult About()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
    }
}