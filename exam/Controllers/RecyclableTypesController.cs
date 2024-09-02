using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using exam.Models;

namespace exam.Controllers
{
    public class RecyclableTypesController : Controller
    {
        private RecyclingDBEntities db = new RecyclingDBEntities();

        // GET: RecyclableTypes
        public ActionResult Index()
        {
            return View(db.RecyclableTypes.ToList());
        }

        // GET: RecyclableTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecyclableType recyclableType = db.RecyclableTypes.Find(id);
            if (recyclableType == null)
            {
                return HttpNotFound();
            }
            return View(recyclableType);
        }

        // GET: RecyclableTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: RecyclableTypes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Type,Rate,MinKg,MaxKg")] RecyclableType recyclableType)
        {
            if (ModelState.IsValid)
            {
                db.RecyclableTypes.Add(recyclableType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(recyclableType);
        }

        // GET: RecyclableTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecyclableType recyclableType = db.RecyclableTypes.Find(id);
            if (recyclableType == null)
            {
                return HttpNotFound();
            }
            return View(recyclableType);
        }

        // POST: RecyclableTypes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Type,Rate,MinKg,MaxKg")] RecyclableType recyclableType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(recyclableType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(recyclableType);
        }

        // GET: RecyclableTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecyclableType recyclableType = db.RecyclableTypes.Find(id);
            if (recyclableType == null)
            {
                return HttpNotFound();
            }
            return View(recyclableType);
        }

        // POST: RecyclableTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RecyclableType recyclableType = db.RecyclableTypes.Find(id);
            db.RecyclableTypes.Remove(recyclableType);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
