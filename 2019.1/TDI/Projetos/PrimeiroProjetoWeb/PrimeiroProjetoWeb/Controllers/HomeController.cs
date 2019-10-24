using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using PrimeiroProjetoWeb.Models;

namespace PrimeiroProjetoWeb.Controllers
{
    public class HomeController : Controller
    {
        private static readonly List<Usuario> ListaUsuarios = new List<Usuario>()
            {
                new Usuario()
                {
                    Id = 1,
                    Nome = "Abraão",
                    Idade = 19
                },
                new Usuario()
                {
                    Id = 2,
                    Nome = "Igor Bruno",
                    Idade = 21
                },
                new Usuario()
                {
                    Id = 3,
                    Nome = "Igor Terriaga",
                    Idade = 23
                }
            };

        public IActionResult Index() => View();
        public IActionResult Privacy() => View();

        public IActionResult Telefone()
        {
            ViewBag.horas = Horas();
            return View();
        }

        private string Horas() => DateTime.Now.ToString();

        public IActionResult DadosUsuario(int? id)
        {
            if (id.HasValue)
            {
                ViewBag.Hora = Horas();
                return View(ListaUsuarios.Find(u => u.Id == id));
            }
            else
            {
                Request.Method = "GET";
                Request.ContentType = "application/x-www-form-urlencoded";
                int x;
                if (String.IsNullOrEmpty(Request.Form["id"]) || String.IsNullOrWhiteSpace(Request.Form["id"]))
                    x = 0;
                else
                    x = int.Parse(Request.Form["id"]);

                if (x == 0)
                    return View();
                else
                    return View(ListaUsuarios.Find(u => u.Id == x));
            }
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error() => View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
