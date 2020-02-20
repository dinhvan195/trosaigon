using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DoAnTotNghiep.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Chưa nhập Email")]
        public string Email { set; get; }

        [Required(ErrorMessage = "Chưa nhập Password")]
        public string MatKhau { set; get; }

        public bool RememberMe { set; get; }
    }
}