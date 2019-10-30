using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ADT.Common;
using ADT.Service.IService;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebSite.Areas.Admin.Controllers
{
    [Authorize]
    public class HomeController : BaseController
    {
        private ISys_MenuService _sys_MenuService;
        public HomeController(ISys_MenuService sys_MenuService)
        {
            _sys_MenuService = sys_MenuService;
        }

        protected override void Init()
        {
            this.MenuID = "Home";
            base.Init();
            this.IsExecutePowerLogic = false;
        }
        // GET: /<controller>/
        public IActionResult Index()
        {
            ViewData["MenuHtml"] = _sys_MenuService.GetSysMenu(Account);
            return View(Account);
        }

        public IActionResult Main()
        {
            return View();
        }
    }
}
