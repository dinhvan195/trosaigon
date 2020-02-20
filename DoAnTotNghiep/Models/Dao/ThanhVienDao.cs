using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnTotNghiep.Models;

namespace DoAnTotNghiep.Models.Dao
{
    
    public class ThanhVienDao
    {
        DBTro db = new DBTro();
        public int Login(string Email, string MatKhau)
        {
            var result = db.ThanhVien.SingleOrDefault(x => x.Email == Email);

            if (result == null)
            {
                return 0;//ko có tk
            }
            else
            {
                if (result.MatKhau == MatKhau)
                {
                    return -1;//đúng mk
                }
                else
                {
                    return 1;// sai mk
                }
            }
        }
        public int ChangePassword(string Email, string MatKhauMoi,string MatKhauCu, string MatKhauNhapLai)
        {
            var result = db.ThanhVien.SingleOrDefault(x => x.Email == Email);
            if (MatKhauCu.Length == 0)
                return 0;
            else if (MatKhauMoi.Length == 0)
                return 1;
            else if (MatKhauNhapLai.Length == 0)
                return 2;
            else
            {
                if (result.MatKhau != MatKhauCu)
                {
                    return 3;
                }
                else
                {
                    if (MatKhauMoi == MatKhauNhapLai)
                        return -1;
                    else
                        return 4;
                }
            }
        }
        public int LoginAD(string Email, string MatKhau)
        {
            var result = db.ThanhVien.SingleOrDefault(x => x.Email == Email);

            if (result == null)
            {
                return 0;//ko có tk
            }
            else
            {
                if (result.LevelAccess == 1)//là admin
                {
                    if (result.MatKhau == MatKhau)
                    {
                        return -1;//đúng mk
                    }
                    else
                    {
                        return 1;// sai mk
                    }
                }
                else //ko phải admin
                {
                    return 2;
                }
            }
        }
    }
}