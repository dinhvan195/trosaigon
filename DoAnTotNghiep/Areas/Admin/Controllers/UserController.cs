using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnTotNghiep.Models;
using DoAnTotNghiep.Models.Dao;
using DoAnTotNghiep.Areas.Admin.Models;

namespace DoAnTotNghiep.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        // GET: Admin/User
        DBTro db = new DBTro();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new ThanhVienDao();
                var result = dao.LoginAD(model.Email,model.MatKhau);
                if (result == -1)
                {
                    ThanhVien kh = db.ThanhVien.SingleOrDefault(x => x.Email == model.Email && x.MatKhau == model.MatKhau);

                    Session["KH"] = kh;
                    return RedirectToAction("Index", "ThongKe");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Email không tồn tại");
                }
                else if (result == 1)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng");
                }
                else if (result == 2)
                {
                    ModelState.AddModelError("", "Bạn không có quyền truy cập");
                }
            }
            return View("Index");
        }
    }
}