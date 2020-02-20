using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnTotNghiep.Models;
using PagedList;

namespace DoAnTotNghiep.Areas.Admin.Controllers
{
    public class QTThanhVienController : BaseController
    {
        // GET: Admin/QTThanhVien
        DBTro db = new DBTro();
        public ActionResult Index()
        {
            var dsTV = db.ThanhVien.ToList();
            return View(dsTV);
        }
        public ActionResult ViewProfile(int MaTV)
        {
            var TV = db.ThanhVien.Find(MaTV);
            return View(TV);
        }
        public ActionResult ChangeLevel(int MaTV)
        {
            var TV = db.ThanhVien.Find(MaTV);
            if (TV == null)
                return HttpNotFound();
            if (TV.LevelAccess == 1)
                TV.LevelAccess = 2;
            else
                TV.LevelAccess = 1;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int MaTV)//ok
        {
            ThanhVien tv = db.ThanhVien.Find(MaTV);
            if (tv == null)
                return HttpNotFound();

            foreach (var x in db.Tin.ToList())
            {
                if (x.MaTV == MaTV)
                {
                    foreach(var a in db.HinhAnh.ToList())
                    {
                        if(a.MaTin==x.MaTin)
                            db.HinhAnh.Remove(a);
                    }
                    db.Tin.Remove(x);
                }
            }
            db.ThanhVien.Remove(tv);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}