using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnTotNghiep.Models;
using PagedList;
using System.IO;
using DoAnTotNghiep.Models.Dao;

namespace DoAnTotNghiep.Controllers
{
    public class PostController : Controller
    {
        DBTro db = new DBTro();
        List<DoiTuong> DT = new List<DoiTuong> { new DoiTuong(1, "Tất cả"), new DoiTuong(2, "Nam"), new DoiTuong(3, "Nữ") };
        List<Gia> G = new List<Gia> { new Gia(1000000, "Dưới 1.000.000 vnđ"), new Gia(2000000, "Dưới 2.000.000 vnđ"), new Gia(3000000, "Dưới 3.000.000 vnđ"), new Gia(5000000, "Dưới 5.000.000 vnđ"), new Gia(5000001, "Trên 5.000.000 vnđ") };
        // GET: Post
        public ActionResult Detail(int MaTin)//chi tiết bài viết
        {
            var tin = db.Tin.Find(MaTin);
            tin.LuotXem++;
            db.SaveChanges();
            return View(tin);
        }
        public ActionResult LuuTin(int MaTin)//Lưu bài viết
        {
            ThanhVien tv = (ThanhVien)Session["KH"];
            if (tv == null)
            {
                return RedirectToAction("Login", "Customer");
            }
            else
            {
                LuuTin l = new LuuTin();
                
                l.MaTin = MaTin;
                l.MaTV = tv.MaTV;
                db.LuuTin.Add(l);
                db.SaveChanges();
                return RedirectToAction("TinDaLuu", "Customer");
            }
        }
        [HttpGet]
        public ActionResult ToPost()//đăng bài viết
        {
            var tv = (ThanhVien)Session["KH"];
            if (tv == null)
            {
                return RedirectToAction("Login", "Customer");
            }
            ViewBag.DoiTuong = new SelectList(DT, "TenDT", "TenDT");
            ViewBag.MaLoai = new SelectList(db.LoaiTin, "MaLoai", "TenLoai");
            ViewBag.MaQuan = new SelectList(db.Quan, "MaQuan", "TenQuan");
            ViewBag.MaPhuong = new SelectList(db.Phuong.Where(a => a.MaQuan == 0), "MaPhuong", "TenPhuong");
            return View();
        }
        [HttpPost]
        public ActionResult ToPost(int? MaQuan, int? MaPhuong ,Tin T, List<HttpPostedFileBase> uploadFile)//xữ lý đăng bài viết
        {
            var tv = (ThanhVien)Session["KH"];
            if (tv == null)
            {
                return RedirectToAction("Login", "Customer");
            }
            ViewBag.DoiTuong = new SelectList(DT, "TenDT", "TenDT");
            ViewBag.MaLoai = new SelectList(db.LoaiTin, "MaLoai", "TenLoai");
            ViewBag.MaQuan = new SelectList(db.Quan, "MaQuan", "TenQuan");
            ViewBag.MaPhuong = new SelectList(db.Phuong.Where(a=>a.MaQuan==MaQuan),"MaPhuong", "TenPhuong");
            if(MaPhuong != null)
            {
                T.LuotXem = 0;
                T.MaTV = tv.MaTV;
                T.KiemDuyet = false;
                T.NgayDang = DateTime.Now;
                db.Tin.Add(T);
                db.SaveChanges();
                string path = Server.MapPath("~/Images/img/");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                foreach (var item in uploadFile)
                {
                    if (item != null)
                    {
                        string fileName = Path.GetFileName(item.FileName);
                        item.SaveAs(path + fileName);
                    }
                    HinhAnh ha = new HinhAnh();
                    ha.MaTin = T.MaTin;
                    ha.DuongDan = Path.GetFileName(item.FileName);
                    db.HinhAnh.Add(ha);
                    db.SaveChanges();
                }
                return RedirectToAction("TinCho", "Customer");
            }
            return View();
        }
        public ActionResult TinTheoQuan(int? page,int? MaQuan,int? MaLoai)//Duyệt tin theo Quan/Loai
        {
            ViewBag.LoaiTin = new SelectList(db.LoaiTin, "MaLoai", "TenLoai");
            ViewBag.Quan = new SelectList(db.Quan, "MaQuan", "TenQuan");
            ViewBag.DoiTuong = new SelectList(DT, "TenDT", "TenDT");
            ViewBag.Gia = new SelectList(G, "MaGia", "GiaPhong");
            List<Tin> DStin =db.Tin.Where(x => x.KiemDuyet == true).OrderByDescending(a => a.NgayDang).ToList();
            if (MaQuan != null)
            {
                DStin = db.Tin.Where(x => x.KiemDuyet == true && x.MaQuan == MaQuan).OrderByDescending(a=>a.NgayDang).ToList();
                ViewBag.TenQuan = db.Quan.Find(MaQuan).TenQuan;
            }
            if (MaLoai != null)
            {
                DStin = db.Tin.Where(x => x.KiemDuyet == true && x.MaLoai == MaLoai).OrderBy(a=>a.Gia).ToList();
                ViewBag.TenQuan = db.LoaiTin.Find(MaLoai).TenLoai;
            }
            var pageSize = 12;
            var pageNumber = (int)(page == null ? 1 : page);
            return View(DStin.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Filter(int? LoaiTin, int? Quan, int? Gia,string DoiTuong)//Lọc tin theo yêu cầu
        {
            ViewBag.LoaiTin = new SelectList(db.LoaiTin, "MaLoai", "TenLoai");
            ViewBag.Quan = new SelectList(db.Quan, "MaQuan", "TenQuan");
            ViewBag.DoiTuong = new SelectList(DT, "TenDT", "TenDT");
            ViewBag.Gia = new SelectList(G, "MaGia", "GiaPhong");
            var DStin = db.Tin.Where(x => x.KiemDuyet == true).ToList();
            if (LoaiTin != null)
            {
                DStin = DStin.Where(x => x.MaLoai == LoaiTin).ToList();
                ViewBag.TenLoai = db.LoaiTin.Find(LoaiTin).TenLoai;
            }
            if (Quan != null)
            {
                DStin = DStin.Where(x => x.MaQuan == Quan).ToList();
                ViewBag.TenQuan = db.Quan.Find(Quan).TenQuan;
            }
            if(Gia != null)
            {
                if (Gia < 5000000)
                {
                    DStin = DStin.Where(x => x.Gia < Gia).ToList();
                    ViewBag.TenGia = "Dưới " + Gia.ToString();
                }
                else
                {
                    DStin = DStin.Where(x => x.Gia > Gia).ToList();
                    ViewBag.TenGia = "Trên " + Gia.ToString();
                }
            }
            if (!string.IsNullOrEmpty(DoiTuong))
            {
                DStin = DStin.Where(x => x.DoiTuong.ToUpper().Contains(DoiTuong.ToUpper())).ToList();
                ViewBag.TenDoiTuong = DoiTuong.ToString();
            }
            return View(DStin.OrderBy(x => x.NgayDang).ToList());
        }
    }
}