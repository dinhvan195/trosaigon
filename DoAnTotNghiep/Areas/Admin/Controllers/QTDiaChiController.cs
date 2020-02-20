using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnTotNghiep.Models;
using PagedList;

namespace DoAnTotNghiep.Areas.Admin.Controllers
{
    public class QTDiaChiController : BaseController
    {
        // GET: Admin/QTDiaChi
        DBTro db = new DBTro();
        public ActionResult Quan()
        {
            var dsQuan = db.Quan.ToList();
            return View(dsQuan);
        }
        public ActionResult Phuong(int? page ,int? MaQuan)
        {
            var pageSize = 20;
            var pageNumber = (int)(page == null ? 1 : page);
            ViewBag.MaQuan = new SelectList(db.Quan, "MaQuan", "TenQuan");
            List<Phuong> dsPhuong;
            if (MaQuan != null)
                dsPhuong = db.Phuong.Where(a=>a.MaQuan==MaQuan).ToList();
            else
                dsPhuong = db.Phuong.ToList();
            return View(dsPhuong.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult CreateQ(string TenQuan)
        {
            if (ModelState.IsValid)
            {
                Quan q = db.Quan.SingleOrDefault(x => x.TenQuan == TenQuan);
                if (q != null)
                    ModelState.AddModelError("", "Quận đã có");
                else
                {
                    Quan t = new Quan();
                    t.TenQuan = TenQuan;
                    db.Quan.Add(t);
                    db.SaveChanges();
                    return RedirectToAction("Quan");
                }
            }
            return RedirectToAction("Quan");
        }
        public ActionResult CreateP(string TenPhuong,int MaQuan)
        {
            if (ModelState.IsValid)
            {
                Phuong p = db.Phuong.SingleOrDefault(x => x.TenPhuong == TenPhuong);
                if (p != null)
                    ModelState.AddModelError("", "Phường đã có");
                else
                {
                    Phuong t = new Phuong();
                    t.TenPhuong = TenPhuong;
                    t.MaQuan = MaQuan;
                    db.Phuong.Add(t);
                    db.SaveChanges();
                    return RedirectToAction("Phuong");
                }
            }
            return RedirectToAction("Phuong");
        }
        public ActionResult DeleteQ(int MaQuan)//Xóa quan
        {
            Quan q = db.Quan.Find(MaQuan);
            if (q == null)
                return HttpNotFound();
            foreach (var p in db.Phuong.ToList())
            {
                if (p.MaQuan == MaQuan)
                    db.Phuong.Remove(p);
            }
            db.Quan.Remove(q);
            db.SaveChanges();
            return RedirectToAction("Quan");
        }
        public ActionResult DeleteP(int MaPhuong)//Xóa phuong
        {
            Phuong p = db.Phuong.Find(MaPhuong);
            if (p == null)
                return HttpNotFound();
            db.Phuong.Remove(p);
            db.SaveChanges();
            return RedirectToAction("Phuong");
        }
    }
}