using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnTotNghiep.Models;

namespace DoAnTotNghiep.Areas.Admin.Controllers
{
    public class ThongKeController : BaseController
    {
        // GET: Admin/ThongKe
        DBTro db = new DBTro();
        public ActionResult Index()
        {
            return View();
        }
    }
}