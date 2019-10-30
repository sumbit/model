using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ADT.Models;
using ADT.Service.IService;
using ADT.Common;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Authorization;
using WebSite.Areas.Admin.Filter;
using WebSite.Models;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebSite.Areas.Admin.Controllers.Sys
{
    [Authorize]
    public class RoleFunctionController : BaseController
    {
        private ISys_RoleService _sys_RoleService;
        private ISys_MenuService _sys_MenuService;
        private ISys_RoleMenuFunctionService _sys_RoleMenuFunctionService;
        public RoleFunctionController(ISys_RoleService sys_RoleService, ISys_MenuService sys_MenuService, ISys_RoleMenuFunctionService sys_RoleMenuFunctionService)
        {
            _sys_RoleService = sys_RoleService;
            _sys_MenuService = sys_MenuService;
            _sys_RoleMenuFunctionService = sys_RoleMenuFunctionService;
        }
        protected override void Init()
        {
            this.MenuID = "Z-140";
        }
        // GET: /<controller>/
        [UsersRoleAuthFilter("Z-140", functionEnum.Have)]
        public IActionResult Index()
        {
            var list = _sys_RoleService.FindListByClause(null, "Role_Num asc");
            ViewData["list"] = list;
            return View();
        }

        #region  基本操作，增删改查
        /// <summary>
        /// 获取角色菜单功能
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [UsersRoleAuthFilter("Z-140", "Add,Edit")]
        public IActionResult GetRoleMenuFunctionTree(string roleid)
        {
            return Json(new { status = 1, value = _sys_MenuService.GetRoleMenuFunctionTree(roleid) });
        }

        /// <summary>
        /// 保存角色功能
        /// </summary>
        /// <param name="json"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult Save(string rows, string roleid)
        {
            if (string.IsNullOrEmpty(roleid))
                throw new MessageBox("请选择角色");
            var rowslist = JsonConvert.DeserializeObject<List<sys_menufunction>>(rows);
            if (_sys_RoleMenuFunctionService.Delete(p => p.RoleMenuFunction_RoleID == roleid))
            {
                if (rowslist.Count > 0)
                {
                    var list = new List<sys_rolemenufunction>();
                    foreach (var item in rowslist)
                    {
                        var model = new sys_rolemenufunction();
                        model.RoleMenuFunction_ID = Guid.NewGuid().ToString();
                        model.RoleMenuFunction_RoleID = roleid;
                        model.RoleMenuFunction_MenuID = item.MenuFunction_MenuID;
                        model.RoleMenuFunction_FunctionID = item.MenuFunction_FunctionID;
                        model.RoleMenuFunction_CreateTime = DateTime.Now;
                        list.Add(model);
                    }
                    var result = _sys_RoleMenuFunctionService.InsertBatch(list);
                    if (result > 0)
                    {
                        RegisterRoleMenu.AddRoleMenu();
                        return Json(new { status = 1 });
                    }
                }
                else
                {
                    return Json(new { status = 1 });
                }
            }
            return Json(new { status = 0, msg = "设置失败" });
        }
        #endregion 基本操作，增删改查
    }
}
