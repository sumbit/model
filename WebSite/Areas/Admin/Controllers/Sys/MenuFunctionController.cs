using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ADT.Common;
using ADT.Models;
using ADT.Service.IService;
using System.Linq.Expressions;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Microsoft.AspNetCore.Authorization;
using WebSite.Areas.Admin.Filter;
using WebSite.Models;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebSite.Areas.Admin.Controllers.Sys
{
    [Authorize]
    public class MenuFunctionController : BaseController
    {
        private ISys_MenuService _sys_MenuService;
        private ISys_FunctionService _sys_FunctionService;
        private ISys_MenuFunctionService _sys_MenuFunctionService;
        public MenuFunctionController(ISys_MenuService sys_MenuService, ISys_FunctionService sys_FunctionService, ISys_MenuFunctionService sys_MenuFunctionService)
        {
            _sys_MenuService = sys_MenuService;
            _sys_FunctionService = sys_FunctionService;
            _sys_MenuFunctionService = sys_MenuFunctionService;
        }
        protected override void Init()
        {
            this.MenuID = "Z-130";
        }
        // GET: /<controller>/
        [UsersRoleAuthFilter("Z-130", functionEnum.Have)]
        public IActionResult Index()
        {
            return View();
        }
        [UsersRoleAuthFilter("Z-130", "Add,Edit")]
        public IActionResult Info(Guid? id)
        {
            ViewBag.ID = id;
            var list = _sys_FunctionService.FindListByClause(null, "Function_Num asc");
            ViewData["list"] = list;
            return View();
        }
        [HttpPost]
        public ActionResult GetDataSource(string Menu_ID, string Menu_Name, int page = 1, int rows = 30)
        {
            Expression<Func<sys_menu, bool>> exp = m => 1 == 1;
            if (!string.IsNullOrEmpty(Menu_Name))
                exp = exp.And(m => m.Menu_Name == Menu_Name);
            if (Menu_ID == null)
                exp = exp.And(m => m.Menu_ParentID == null);
            else
                exp = exp.And(m => m.Menu_ParentID == Menu_ID);
            var list = _sys_MenuService.GetMenuPageList(exp, page, rows, "m.Menu_Num asc");
            return Json(list);
        }
        /// <summary>
        /// 获取菜单和功能树
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public IActionResult GetMenuAndFunctionTree()
        {
            return Json(new { status = 1, value = _sys_MenuService.GetMenuAndFunctionTree() });
        }

        /// <summary>
        /// 查询根据ID
        /// </summary>
        /// <param name="ID"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult Find(string ID)
        {
            dynamic list;
            if (!string.IsNullOrEmpty(ID))
            {
                var model = _sys_MenuService.FindByClause(p => p.Menu_ID == ID);
                //list = 
                var menu = _sys_MenuService.FindByClause(p => p.Menu_ID == model.Menu_ParentID);
                var Menu_Power = _sys_MenuFunctionService.FindListByClause(p => p.MenuFunction_MenuID == ID, "MenuFunction_CreateTime asc").Select(p => p.MenuFunction_FunctionID).ToList();
                var json = Tools.EntityToDictionary(new Dictionary<string, object>()
                {
                    {"model",model },
                    {"pname",menu!=null?menu.Menu_Name:""},
                    {"Menu_Power",Menu_Power }
                });
                list = json;
            }
            else
            {
                var model = new sys_menu();
                var json = Tools.EntityToDictionary(new Dictionary<string, object>()
                {
                    {"sss",model },
                    {"pname",""},
                    {"Menu_Power",new string[]{ } }
                });
                list = json;
            }
            return Json(list);
        }
        [HttpPost]
        public IActionResult Save(sys_menu vmodel, string Function_ID)
        {
            if (vmodel != null)
            {
                if (string.IsNullOrEmpty(vmodel.Menu_Num))
                    throw new MessageBox("请输入菜单编号");
                if (string.IsNullOrEmpty(vmodel.Menu_Name))
                    throw new MessageBox("请输入菜单名称");
                var FunctionList = JsonConvert.DeserializeObject<List<string>>(Function_ID);
                if (string.IsNullOrEmpty(vmodel.Menu_ID))
                {
                    vmodel.Menu_ID = Guid.NewGuid().ToString();
                    vmodel.Menu_CreateTime = DateTime.Now;
                    _sys_MenuService.Insert(vmodel);
                }
                else
                {
                    _sys_MenuService.Update(vmodel);
                    _sys_MenuFunctionService.Delete(p => p.MenuFunction_MenuID == vmodel.Menu_ID);
                }
                foreach (var item in FunctionList)
                {
                    _sys_MenuFunctionService.Insert(new sys_menufunction()
                    {
                        MenuFunction_ID = Guid.NewGuid().ToString(),
                        MenuFunction_FunctionID = item,
                        MenuFunction_MenuID = vmodel.Menu_ID,
                        MenuFunction_CreateTime = DateTime.Now
                    });
                }
            }
            else
            {
                return Json(new { status = 0, msg = "无效参数" });
            }
            return Json(new { status = 1, msg = "操作成功" });
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ID"></param>
        /// <returns></returns>
        [HttpPost]
        [UsersRoleAuthFilter("Z-130", functionEnum.Delete)]
        public IActionResult Delete(string ID)
        {
            var list = JsonConvert.DeserializeObject<List<string>>(ID);
            var result = _sys_MenuService.Delete(p => list.Contains(p.Menu_ID));
            if (result)
            {
                _sys_MenuFunctionService.Delete(p => list.Contains(p.MenuFunction_MenuID));
                return Json(new { status = 1 });
            }
            else
                return Json(new { status = 0, msg = "删除失败" });
        }
    }
}
