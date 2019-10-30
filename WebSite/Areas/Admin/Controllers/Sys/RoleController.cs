using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ADT.Models;
using ADT.Service;
using ADT.Service.IService;
using System.Linq.Expressions;
using ADT.Common;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Authorization;
using WebSite.Areas.Admin.Filter;
using WebSite.Models;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebSite.Areas.Admin.Controllers.Sys
{
    [Authorize]
    public class RoleController : BaseController
    {
        private ISys_RoleService _sys_RoleService;
        public RoleController(ISys_RoleService sys_RoleService)
        {
            _sys_RoleService = sys_RoleService;
        }
        protected override void Init()
        {
            this.MenuID = "Z-110";
        }
        // GET: /<controller>/
        [UsersRoleAuthFilter("Z-110", functionEnum.Have)]
        public IActionResult Index()
        {
            return View();
        }
        [UsersRoleAuthFilter("Z-110", "Add,Edit")]
        public IActionResult Info(Guid id)
        {
            ViewBag.ID = id;
            return View();
        }
        [HttpPost]
        public ActionResult GetDataSource(string Role_Name, int page = 1, int row = 30)
        {
            Expression<Func<sys_role, bool>> exp = p => 1 == 1;
            if (!string.IsNullOrEmpty(Role_Name))
                exp = exp.And(p => p.Role_Name == Role_Name);
            var list = _sys_RoleService.GetPageList(exp, page, row, "Role_CreateTime desc");
            return Json(list);
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
                list = _sys_RoleService.FindByClause(p => p.Role_ID == ID);
            }
            else
            {
                list = new { };
            }
            return Json(list);
        }
        [HttpPost]
        public IActionResult Save(sys_role vmodel)
        {
            if (vmodel != null)
            {
                if (string.IsNullOrEmpty(vmodel.Role_Name))
                    throw new MessageBox("请输入角色名");
                if (string.IsNullOrEmpty(vmodel.Role_ID))
                {
                    vmodel.Role_ID = Guid.NewGuid().ToString();
                    vmodel.Role_CreateTime = DateTime.Now;
                    _sys_RoleService.Insert(vmodel);
                }
                else
                {
                    _sys_RoleService.Update(vmodel);
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
        [UsersRoleAuthFilter("Z-110", functionEnum.Delete)]
        public IActionResult Delete(string ID)
        {
            var list = JsonConvert.DeserializeObject<List<string>>(ID);
            foreach (var item in list)
            {
                var model = _sys_RoleService.FindByClause(p => p.Role_ID == item);
                if (model == null)
                    throw new MessageBox("该角色不存在");
                if (model.Role_IsDelete == 2)
                    throw new MessageBox("该角色不能删除");
                _sys_RoleService.Delete(p => p.Role_ID == item);
            }
            return Json(new { status = 1 });
        }
    }
}
