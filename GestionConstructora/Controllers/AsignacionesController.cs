using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace GestionConstructora.Controllers
{
    public class AsignacionesController : Controller
    {
        private ConstructoraUHEntities db = new ConstructoraUHEntities();

        // GET: Asignaciones
        public ActionResult Index()
        {
            var asignaciones = db.Asignaciones.Include(a => a.Empleados).Include(a => a.Proyectos);
            return View(asignaciones.ToList());
        }

        // GET: Asignaciones/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Asignaciones asignaciones = db.Asignaciones.Find(id);
            if (asignaciones == null)
            {
                return HttpNotFound();
            }
            return View(asignaciones);
        }

        // GET: Asignaciones/Create
        public ActionResult Create()
        {
            ViewBag.Carnet = new SelectList(db.Empleados, "Carnet", "NombreCompleto");
            ViewBag.CodigoProyecto = new SelectList(db.Proyectos, "CodigoProyecto", "NombreProyecto");
            return View();
        }

        // POST: Asignaciones/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Carnet,CodigoProyecto,FechaAsignacion")] Asignaciones asignaciones)
        {
            if (ModelState.IsValid)
            {
                db.Asignaciones.Add(asignaciones);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Carnet = new SelectList(db.Empleados, "Carnet", "NombreCompleto", asignaciones.Carnet);
            ViewBag.CodigoProyecto = new SelectList(db.Proyectos, "CodigoProyecto", "NombreProyecto", asignaciones.CodigoProyecto);
            return View(asignaciones);
        }


        // Example method to generate a unique IdAsignacion
        private int GenerateUniqueIdAsignacion()
        {
            // Implement your logic to generate a unique IdAsignacion
            return new Random().Next(1, 1000000);
        }


        // GET: Asignaciones/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Asignaciones asignaciones = db.Asignaciones.Find(id);
            if (asignaciones == null)
            {
                return HttpNotFound();
            }
            ViewBag.Carnet = new SelectList(db.Empleados, "Carnet", "NombreCompleto", asignaciones.Carnet);
            ViewBag.CodigoProyecto = new SelectList(db.Proyectos, "CodigoProyecto", "NombreProyecto", asignaciones.CodigoProyecto);
            return View(asignaciones);
        }

        // POST: Asignaciones/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdAsignacion,Carnet,CodigoProyecto,FechaAsignacion")] Asignaciones asignaciones)
        {
            if (ModelState.IsValid)
            {
                db.Entry(asignaciones).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Carnet = new SelectList(db.Empleados, "Carnet", "NombreCompleto", asignaciones.Carnet);
            ViewBag.CodigoProyecto = new SelectList(db.Proyectos, "CodigoProyecto", "NombreProyecto", asignaciones.CodigoProyecto);
            return View(asignaciones);
        }

        // GET: Asignaciones/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Asignaciones asignaciones = db.Asignaciones.Find(id);
            if (asignaciones == null)
            {
                return HttpNotFound();
            }
            return View(asignaciones);
        }

        // POST: Asignaciones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Asignaciones asignaciones = db.Asignaciones.Find(id);
            db.Asignaciones.Remove(asignaciones);
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
