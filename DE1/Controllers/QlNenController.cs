using DE1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DE1.Controllers
{
    public class QlNenController : Controller
    {
        DE1Entities db = new DE1Entities();

        // GET: QlNen
        public ActionResult Index()
        {
            List<QLNen> list = db.QLNens.Where(x => x.IsDelete == false).ToList();
            return View(list);
        }

        // GET: QlNen/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: QlNen/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: QlNen/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: QlNen/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: QlNen/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: QlNen/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
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
    }
}
