using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnTotNghiep.Models;
using DoAnTotNghiep.Models.Dao;
using DoAnTotNghiep.Areas.Admin.Models;
using System.Data.Entity;
using System.IO;

namespace DoAnTotNghiep.Controllers
{
    public class CustomerController : Controller
    {
        DBTro db = new DBTro();
        // GET: Customer
        List<DoiTuong> DT = new List<DoiTuong> { new DoiTuong(0, "Nam"), new DoiTuong(1, "Nữ") };
        public ActionResult Login()//view đăng nhập
        {
            return View();
        }
        public ActionResult Log(LoginModel model)//Xữ lý đăng nhập
        {
            if (ModelState.IsValid)
            {
                var dao = new ThanhVienDao();
                var result = dao.Login(model.Email, model.MatKhau);
                if (result == -1)
                {
                    ThanhVien kh = db.ThanhVien.SingleOrDefault(x => x.Email == model.Email && x.MatKhau == model.MatKhau);

                    Session["KH"] = kh;
                    return RedirectToAction("Index", "Home");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Email không tồn tại");
                }
                else if (result == 1)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng");
                }
            }
            return View("Login");
        }
        public ActionResult Register()//view đăng ký 
        {
            return View();
        }
        public ActionResult DangKy(string HoTen ,string Email,string MK ,string MKNL,string SDT)//Xữ lý đăng ký
        {
            if (ModelState.IsValid)
            {
                ThanhVien kh = db.ThanhVien.SingleOrDefault(x => x.Email == Email);
                if(kh != null)
                    ModelState.AddModelError("", "Email đã được đăng ký");
                if(MKNL!=MK)
                    ModelState.AddModelError("", "Mật khẩu nhập lại không đúng");
                if (kh == null)
                {
                    ThanhVien tv = new ThanhVien();
                    tv.SDT = SDT;
                    tv.HoTen = HoTen;
                    tv.Email = Email;
                    tv.MatKhau = MK;
                    tv.AnhDaiDien = "avatar5.png";
                    db.ThanhVien.Add(tv);
                    db.SaveChanges();
                    Session["KH"] = tv;
                    return RedirectToAction("Index", "Home");
                }
            }
            return View();
        }
        public ActionResult ProfileTV()//Thông tin thành viên
        {
            var tv = (ThanhVien)Session["KH"];

            if(tv == null)
            {
                return RedirectToAction("Login", "Customer");
            }
            ViewBag.GT = new SelectList(DT, "TenDT", "TenDT");
            return View(tv);
        }
        public ActionResult PWChange()//view đỗi mk
        {
            var tv = (ThanhVien)Session["KH"];
            if (tv == null)
            {
                return RedirectToAction("Login", "Customer");
            }
            return View();
        }
        public ActionResult ChangePassword(string MKcu, string MKmoi,string MKnhaplai)//Xữ lý đổi mk
        {
            ThanhVien kh = (ThanhVien)Session["KH"];

            var dao = new ThanhVienDao();
            var result = dao.ChangePassword(kh.Email,MKmoi,MKcu,MKnhaplai);
            if (result == -1)
            {
                var tv = db.ThanhVien.Find(kh.MaTV);
                tv.MatKhau = MKmoi;
                db.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
            else if (result == 0)
            {
                ModelState.AddModelError("", "Chưa nhập mật khẩu");
            }
            else if (result == 1)
            {
                ModelState.AddModelError("", "Chưa nhập mật khẩu mới");
            }
            else if (result == 2)
            {
                ModelState.AddModelError("", "Chưa nhập mật khẩu nhập lại");
            }
            else if (result == 3)
            {
                ModelState.AddModelError("", "Không đúng mật khẩu");
            }
            else
            {
                ModelState.AddModelError("", "Mật khẩu nhập lại không đúng");
            }
            return View("PWChange");
        }
        public ActionResult Logout()//Đăng xuất
        {
            Session.Remove("KH");
            return RedirectToAction("Index", "Home");
        }
        public ActionResult TinDaDang()//Tin đã đăng và đc phê duyệt
        {
            var tv = (ThanhVien)Session["KH"];
            if (tv == null)
            {
                return RedirectToAction("Login", "Customer");
            }
            var Tin = db.Tin.Where(x => x.MaTV == tv.MaTV && x.KiemDuyet==true).OrderByDescending(a => a.NgayDang).ToList();
            return View(Tin);
        }
        public ActionResult TinCho()//Tin chờ phê duyệt
        {
            var tv = (ThanhVien)Session["KH"];
            if (tv == null)
            {
                return RedirectToAction("Login", "Customer");
            }
            var Tin = db.Tin.Where(x => x.MaTV == tv.MaTV && x.KiemDuyet == false).OrderByDescending(a=>a.NgayDang).ToList();
            return View(Tin);
        }
        public ActionResult TinDaLuu()//DS tin đã luw
        {
            var tv = (ThanhVien)Session["KH"];
            if (tv == null)
            {
                return RedirectToAction("Login", "Customer");
            }
            var LuuTin = db.LuuTin.Where(x => x.MaTV == tv.MaTV).ToList();
            return View(LuuTin);
        }
        public ActionResult XoaTin(int MaTin)//xoa bài viết đã đăng
        {
            Tin tin = db.Tin.Find(MaTin);
            if (tin == null)
                return HttpNotFound();
            foreach (var x in db.HinhAnh.ToList())
            {
                if (x.MaTin == MaTin)
                    db.HinhAnh.Remove(x);
            }
            foreach (var x in db.LuuTin.ToList())
            {
                if (x.MaTin == MaTin)
                    db.LuuTin.Remove(x);
            }
            db.Tin.Remove(tin);
            db.SaveChanges();
            return RedirectToAction("TinDaDang");
        }
        public ActionResult XoaTinLuu(int MaTin)//xoa bài viết da luu
        {
            var tv = (ThanhVien)Session["KH"];
            if (tv == null)
            {
                return RedirectToAction("Login", "Customer");
            }
            foreach (var x in db.LuuTin.ToList())
            {
                if (x.MaTin == MaTin && x.MaTV ==tv.MaTV)
                    db.LuuTin.Remove(x);
                db.SaveChanges();
            }
            return RedirectToAction("TinDaLuu", "Customer");
        }
        public ActionResult Update(string HoTen, string Email, string SDT, string GC, string DC , string GT)//Cập nhật thông tin cá nhân
        {
            ThanhVien kh = (ThanhVien)Session["KH"];
            var tv = db.ThanhVien.Find(kh.MaTV);
            tv.HoTen = HoTen;
            tv.Email = Email;
            tv.SDT = SDT;
            tv.GioiTinh = GT.ToString()=="Nam"?true:false;
            tv.GhiChu = GC;
            tv.DiaChi = DC;
            db.SaveChanges();
            Session.Remove("KH");
            Session["KH"] = tv;
            return RedirectToAction("ProfileTV");
        }
        public ActionResult AnhDaiDien(List<HttpPostedFileBase> postedFiles)//Đổi ảnh đại diện
        {
            var tv = (ThanhVien)Session["KH"];
            if (tv == null)
            {
                return RedirectToAction("Login", "Customer");
            }
            string path = Server.MapPath("~/Images/Avatar/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            foreach (HttpPostedFileBase postedFile in postedFiles)
            {
                if (postedFile != null)
                {
                    string fileName = Path.GetFileName(postedFile.FileName);
                    postedFile.SaveAs(path + fileName);
                }
                tv.AnhDaiDien = Path.GetFileName(postedFile.FileName);
            }
            db.SaveChanges();
            return RedirectToAction("ProfileTV");
        }
    }
}