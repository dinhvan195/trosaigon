using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnTotNghiep.Models;
using PagedList;

namespace DoAnTotNghiep.Areas.Admin.Controllers
{
    public class QTTinController : BaseController
    {
        DBTro db = new DBTro();
        public ActionResult Index(int? page)
        {
            var pageSize = 20;
            var pageNumber = (int)(page == null ? 1 : page);
            var dsTin = db.Tin.Where(x => x.KiemDuyet == true).ToList();
            return View(dsTin.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult DuyetTin()
        {
            var dsTin = db.Tin.Where(x=>x.KiemDuyet==false).ToList();
            return View(dsTin);
        }
        public ActionResult Delete(int MaTin)//Xóa bài viết
        {
            Tin tin = db.Tin.Find(MaTin);
            if (tin == null)
                return HttpNotFound();
            foreach(var x in db.HinhAnh.ToList())
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
            return RedirectToAction("Index");
        }
        public ActionResult Detail(int MaTin)
        {
            Tin p = db.Tin.Find(MaTin);
            if (p == null)
                return HttpNotFound();
            return View(p);
        }
        public ActionResult Duyet(int MaTin)
        {
            var tin = db.Tin.Find(MaTin);
            if (tin == null)
                return HttpNotFound();
            tin.KiemDuyet = true;
            db.SaveChanges();
            return RedirectToAction("DuyetTin");
        }
    }
}