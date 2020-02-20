using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnTotNghiep.Models;
using PagedList;

namespace DoAnTotNghiep.Areas.Admin.Controllers
{
    public class QTLoaiTinController : BaseController
    {
        DBTro db = new DBTro();
        // GET: Admin/QTLoaiTin
        public ActionResult Index()
        {
            var dsLT = db.LoaiTin.ToList();
            return View(dsLT);
        }
        public ActionResult Create(string TenLoai)
        {
            if (ModelState.IsValid)
            {
                if (!string.IsNullOrEmpty(TenLoai))
                {
                    LoaiTin lt = db.LoaiTin.SingleOrDefault(x => x.TenLoai == TenLoai);
                    if (lt != null)
                        ModelState.AddModelError("", "Loại tin đã có");
                    else
                    {
                        LoaiTin t = new LoaiTin();
                        t.TenLoai = TenLoai;
                        db.LoaiTin.Add(t);
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                }
                else
                    ModelState.AddModelError("", "Vui lòng nhập tên loại");
            }
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int MaLoai)
        {
            var LT = db.LoaiTin.Find(MaLoai);
            if (LT == null)
                return HttpNotFound();
            foreach (var x in db.Tin.ToList())
            {
                if (x.MaLoai == MaLoai)
                {
                    foreach (var a in db.HinhAnh.ToList())
                    {
                        if (a.MaTin == x.MaTin)
                            db.HinhAnh.Remove(a);
                    }
                    db.Tin.Remove(x);
                }
            }
            db.LoaiTin.Remove(LT);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}