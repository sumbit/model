using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using ADT.Common;
using ADT.Models;
using ADT.Service.IService;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using SqlSugar;
using WebSite.Areas.Admin.Filter;
using WebSite.Models;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebSite.Areas.Admin.Controllers.Sys
{
    [Authorize]
    public class UserController : BaseController
    {
        private ISys_UserService _sys_UserService;
        private ISys_UserRoleService _sys_UserRoleService;
        private Iview_sys_user_roleService _view_sys_user_roleService;
        public UserController(ISys_UserService sys_UserService, ISys_UserRoleService sys_UserRoleService, Iview_sys_user_roleService view_sys_user_roleService)
        {
            _sys_UserService = sys_UserService;
            _sys_UserRoleService = sys_UserRoleService;
            _view_sys_user_roleService = view_sys_user_roleService;
        }
        protected override void Init()
        {
            this.MenuID = "Z-100";
        }
        [UsersRoleAuthFilter("Z-100", functionEnum.Have)]
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View();
        }
        [UsersRoleAuthFilter("Z-100", "Add,Edit")]
        public IActionResult Info(string id)
        {
            ViewBag.ID = id;
            return View();
        }
        [HttpPost]
        public ActionResult GetDataSource(string User_Name, string User_LoginName, int page = 1, int row = 30)
        {
            Expression<Func<view_sys_user_role, bool>> exp = p => 1 == 1;
            if (!string.IsNullOrEmpty(User_Name))
                exp = exp.And(p => p.User_Name == User_Name);
            if (!string.IsNullOrEmpty(User_LoginName))
                exp = exp.And(p => p.User_LoginName == User_LoginName);
            var list = _view_sys_user_roleService.GetPageList(exp, page, row, "User_CreateTime desc");
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
                list = _view_sys_user_roleService.FindByClause(p => p.User_ID == ID);
            }
            else
            {
                list = new { };
            }
            return Json(list);
        }
        [HttpPost]
        public IActionResult Save(view_sys_user_role vmodel)
        {
            if (vmodel != null)
            {
                if (string.IsNullOrEmpty(vmodel.User_Name))
                    throw new MessageBox("请输入用户名");
                if (string.IsNullOrEmpty(vmodel.User_LoginName))
                    throw new MessageBox("请输入登录名");
                if (string.IsNullOrEmpty(vmodel.User_ID) && string.IsNullOrEmpty(vmodel.User_Pwd))
                    throw new MessageBox("请输入登陆密码");
                if (string.IsNullOrEmpty(vmodel.Role_ID))
                    throw new MessageBox("请选择角色名称");
                if (string.IsNullOrEmpty(vmodel.User_ID))
                {
                    vmodel.User_Pwd = Tools.MD5Encryption(vmodel.User_Pwd);
                    _sys_UserService.InsertUsers(vmodel);
                }
                else
                {
                    var model = _sys_UserService.FindByClause(p => p.User_ID == vmodel.User_ID);
                    if (model != null)
                    {
                        if (!string.IsNullOrEmpty(vmodel.User_Pwd))
                            vmodel.User_Pwd = Tools.MD5Encryption(vmodel.User_Pwd);
                        _sys_UserService.UpdateUsers(vmodel);
                    }
                    else
                    {
                        throw new MessageBox("该用户不存在");
                    }
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
        [UsersRoleAuthFilter("Z-100", functionEnum.Delete)]
        public IActionResult Delete(string ID)
        {
            var list = JsonConvert.DeserializeObject<List<string>>(ID);
            foreach (var item in list)
            {
                var model = _sys_UserService.FindByClause(p => p.User_ID == item);
                if (model == null)
                    throw new MessageBox("该用户不存在");
                if (model.User_IsDelete == 2)
                    throw new MessageBox("该用户不能删除");
                _sys_UserService.Delete(p => p.User_ID == model.User_ID);
                _sys_UserRoleService.Delete(p => p.UserRole_UserID == model.User_ID);
            }
            return Json(new { status = 1 });
        }

        /// <summary>
        /// 导出EXCEL
        /// </summary>
        /// <param name="fc"></param>
        /// <param name="page"></param>
        /// <param name="rows"></param>
        /// <returns></returns>
        [HttpGet]
        [UsersRoleAuthFilter("Z-100", functionEnum.GetExcel)]
        public virtual IActionResult ExportExcel(int page = 1, int rows = 1000000)
        {
            int total = 0;
            DataTable dt = _sys_UserService.FindPageListByClauseData(null, page, rows, null, ref total);
            return File(DBToExcel(dt, new string[] { "id" }, null), "application/vnd.ms-excel", Guid.NewGuid().ToString() + ".xls");
        }
    }
}
