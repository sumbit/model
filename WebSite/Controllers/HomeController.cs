using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebSite.Models;
using ADT.Models;
using ADT.Service.IService;
using System.Data;
using System.Dynamic;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace WebSite.Controllers
{
    public class HomeController : Controller
    {
        private ICurrencyService _currencyService;
        public HomeController(ICurrencyService currencyService)
        {
            _currencyService = currencyService;
        }
        public IActionResult Index()
        {
            //return new NotFoundResult();
            //var model = _sys_RoleService.GetModelList(1);
            var model = new sys_role();
            model.Role_Name = "11111";
            model.Role_Num = "22222";
            //ViewBag.eat = "";
            //dynamic des = new ExpandoObject();
            //des.aaa = 1;
            //des.bbb = 2;
            var des = model;
            string sss = JsonConvert.SerializeObject(des);
            var ddd = JObject.Parse(sss);
            ddd.Add("test", "后续添加");
            ddd.Remove("Role_Num");
            //var list = _currencyService.DbAccess().Queryable<sys_user, sys_userrole>((s1, s2) => new object[] { SqlSugar.JoinType.Left, s1.User_ID == s2.UserRole_UserID }).Select((s1, s2) => new { s1, s2 }).ToList();
            return Json(ddd);
            //return View(model);
            //return View(model);
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }
        public IActionResult tojson()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("id");
            DataRow dr = dt.NewRow();
            dr["id"] = 1;
            dt.Rows.Add(dr);
            return Json(dt);
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
