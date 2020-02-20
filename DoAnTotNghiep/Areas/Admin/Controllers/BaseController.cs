using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using DoAnTotNghiep.Models;

namespace DoAnTotNghiep.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        // GET: Admin/Base
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {

            var session = (ThanhVien)Session["KH"];
            if (session == null)
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "User", Action = "Index", Area = "Admin" }));
            }
            else
            {
                if(session.LevelAccess!=1)
                {
                    Session.Remove("KH");
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "User", Action = "Index", Area = "Admin" }));
                }
            }
            base.OnActionExecuting(filterContext);
        }
    }
}