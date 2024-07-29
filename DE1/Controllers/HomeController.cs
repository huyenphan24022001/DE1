﻿using DE1.Models;
using Microsoft.IdentityModel.Tokens;
using Nest;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Net;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace DE1.Controllers
{
    public class HomeController : Controller
    {
        DE1Entities db = new DE1Entities();
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(FormCollection collection, User u)
        {
            string pass = u.Pass;
            string rePass = collection["RePassword"];
            if (!pass.Equals(rePass))
            {
                return RedirectToAction("Error", "Home", new { @MaError = "Mật khẩu không trùng khớp!" });
             
            }
            if (db.Users.SingleOrDefault(x => x.UserName.Equals(u.UserName)) != null)
            {

                return RedirectToAction("Error", "Home", new { @MaError = "Tên Username đã tồn tại!" });

              
            }
            if (u.CCCD.Length != 12)
            {
                return RedirectToAction("Error", "Home", new { @MaError = "CCCD phải có 12 ký tự" });

            }
            if (u.Phone.Length != 10)
            {
                return RedirectToAction("Error", "Home", new { @MaError = "Phone phải có 10 ký tự!" });

            }
            string hashedPassword = HashPassword(pass, "12345!#aB");
            User user = new User()
            {
                UserName = u.UserName,
                Pass = hashedPassword,
                Role = 2,
                FullName = u.FullName,
            };
            db.Users.Add(user);
            db.SaveChanges();
            return RedirectToAction("Success", "Home", new { Success = "Tạo tài khoản thành công" });
        }
        public ActionResult LogOut()
        {
            Session["Login"] = null;
            return View("Login");
        }
        public static string HashPassword(string password, string salt)
        {
            using (var sha256 = SHA256.Create())
            {
                var saltedPassword = password + salt;
                var passwordBytes = Encoding.UTF8.GetBytes(saltedPassword);
                var hashBytes = sha256.ComputeHash(passwordBytes);
                return Convert.ToBase64String(hashBytes);
            }
        }
        public bool checkToken()
        {
            var access_token = Session["access_token"];
            if (access_token == null)
            {
                //return RedirectToAction("Login");
                return false;
            }
            else
            {
                var tokenHandler = new JwtSecurityTokenHandler();
                var key = Encoding.ASCII.GetBytes(Convert.ToString(ConfigurationManager.AppSettings["config:JwtKey"]));
                tokenHandler.ValidateToken(access_token.ToString(), new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    ClockSkew = TimeSpan.Zero

                }, out SecurityToken validatedToken);

                // Corrected access to the validatedToken
                var jwtToken = (JwtSecurityToken)validatedToken;
                if (jwtToken.ValidTo < DateTime.UtcNow)
                {
                    return false;
                    //return RedirectToAction(Action);
                }
                
               
            }
            return true;
            //return RedirectToAction("Login");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Login user)
        {
            var securityKey = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(ConfigurationManager.AppSettings["config:JwtKey"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            string hashedPassword = HashPassword(user.Password, "12345!#aB");
            User u = db.Users.FirstOrDefault(x => x.UserName == user.UserName && x.Pass == hashedPassword && x.Role == 1); //pass: 12345
            
            
            if (u != null)
            {
                        var claims = new[]
                { new Claim("ID", u.ID.ToString()),
                    new Claim("UserName", u.UserName),
                    new Claim("Role", u.Role.ToString())
                    // Add more claims if needed
                };

                var accessToken = new JwtSecurityToken(
                    claims: claims,
                    expires: DateTime.UtcNow.AddHours(1), // Token expires in 1 hour
                    signingCredentials: credentials
                );

                var refreshToken = new JwtSecurityToken(
                    claims: claims,
                    expires: DateTime.UtcNow.AddDays(7), // Token expires in 7day
                    signingCredentials: credentials
                );
                var access_token = new JwtSecurityTokenHandler().WriteToken(accessToken);
                var refresh_token = new JwtSecurityTokenHandler().WriteToken(refreshToken);
                Models.Token to = new Models.Token()
                {
                    Users_ID = u.ID,
                    access_token = access_token,
                    refresh_token = refresh_token,
                };
                db.Tokens.Add(to);
                db.SaveChanges();
            
                Session["access_token"] = access_token;
                //Session["refresh_token"] = refresh_token;
                Session["Login"] = true;
                return RedirectToAction("Index", "Home");
            } else
            {
                ModelState.AddModelError("", "Login data is incorrect!");
            }
            return View();
        }
        // GET: QlNen
        public ActionResult Index(string TenNguoiMua, int? TrangThai = -1)
        {
            ViewBag.MaUsers = new SelectList(db.Users.Where(n=>n.Role == 2), "ID", "FullName");
            //check token còn thời gian k
            bool check =  checkToken();
            if (!check)
            {
                return RedirectToAction("Login");
            }
            bool status;
            if(TrangThai == 0) status = false;
            else status = true;
            var data = db.QLNens.AsQueryable();
            data = data.Where(x => x.IsDelete == false);
            if (!string.IsNullOrEmpty(TenNguoiMua))
                data = data.Where(x => x.FullName.Contains(TenNguoiMua));

            if (TrangThai != -1)
                data = data.Where(x => x.TinhTrang == status);
            return View(data.ToList());

        }

        //// GET: QlNen/Details/5
        //public ActionResult Details(int id)
        //{
        //    return View();
        //}

        // GET: QlNen/Create
        public ActionResult Create()
        {
            ViewBag.MaUsers = new SelectList(db.Users.Where(n => n.Role == 2), "ID", "FullName");
            //check token còn thời gian k
            bool check = checkToken();
            if (!check)
            {
                return RedirectToAction("Login");
            }
            return View();
        }

        // POST: QlNen/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection, QLNen qLNen)
        {
            try
            {
                //check token còn thời gian k
                bool check = checkToken();
                if (!check)
                {
                    return RedirectToAction("Login");
                }
                int UserID = Int32.Parse(collection["MaUsers"].ToString());
                string dai = collection["ChieuDai"].ToString();
                string rong = collection["ChieuRong"].ToString();
                qLNen.FullName = db.Users.SingleOrDefault(x => x.ID == UserID).FullName;
                qLNen.UserID = UserID;
                qLNen.IsDelete = false;
                qLNen.DienTich = dai + "x" + rong + "m";
                if (db.QLNens.SingleOrDefault(x => x.TenNen.Equals(qLNen.TenNen) ) == null)
                {
                    
                    db.QLNens.Add(qLNen);
                    
                    db.SaveChanges();
                    return RedirectToAction("Success", "Home", new { Success = "Thêm nền thành công" });
                }
                else
                {
                    return RedirectToAction("Error", "Home", new { @MaError = "Tên nền không được trùng"});
                }

              
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Details(int? id)
        {
            //check token còn thời gian k
            bool check = checkToken();
            if (!check)
            {
                return RedirectToAction("Login");
            }

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            QLNen nen = db.QLNens.Find(id);
            if (nen == null)
            {
                return HttpNotFound();
            }
            return View(nen);
        }


        public ActionResult Error(string MaError)
        {
            ViewBag.Error = MaError;
            return View();
        }

        public ActionResult Success(string Success)
        {
            ViewBag.Success = Success;
            return View();
        }
        // GET: QlNen/Edit/5
        public ActionResult Edit(int id)
        {
            //check token còn thời gian k
            bool check = checkToken();
            if (!check)
            {
                return RedirectToAction("Login");
            }

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            QLNen nen = db.QLNens.Find(id);
            if (nen == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaUsers = new SelectList(db.Users.Where(n=>n.Role == 2), "ID", "FullName", nen.UserID);
            return View(nen);
        }

        // POST: QlNen/Edit/5
        [HttpPost]
        public ActionResult Edit(QLNen nen, FormCollection collection)
        {
            //check token còn thời gian k
            bool check = checkToken();
            if (!check)
            {
                return RedirectToAction("Login");
            }

            if (nen.ID != null)
            {
                int UserID = Int32.Parse(collection["MaUsers"].ToString());
                string dai = collection["ChieuDai"].ToString();
                string rong = collection["ChieuRong"].ToString();
                nen.IsDelete = false;
                nen.DienTich = dai + "x" + rong + "m";
                nen.FullName = db.Users.SingleOrDefault(x => x.ID == UserID).FullName;
                nen.UserID = UserID;
                db.Entry(nen).State = EntityState.Modified;
                db.SaveChanges();
            }

            return RedirectToAction("Success", "Home", new { Success = "Sửa nền thành công" });


        }

        // GET: QlNen/Delete/5
        public ActionResult Delete(int id)
        {
            //check token còn thời gian k
            bool check = checkToken();
            if (!check)
            {
                return RedirectToAction("Login");
            }

            if (id == null)
            {
                return Json(new { mess = "fail" }, JsonRequestBehavior.AllowGet);
            }
            QLNen nen = db.QLNens.Find(id);
            if (nen == null)
            {
                return Json(new { mess = "fail" }, JsonRequestBehavior.AllowGet);
            }
            nen.IsDelete = true;
            db.SaveChanges();
            return Json(new { mess = "success" }, JsonRequestBehavior.AllowGet);
        }

        // POST: QlNen/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {

            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult CreateUser(FormCollection collection, User u)
        {
            return View();
        }
    }
}