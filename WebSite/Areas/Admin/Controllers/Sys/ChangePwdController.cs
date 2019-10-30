using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ADT.Common;
using Microsoft.AspNetCore.Mvc;
using ADT.Models;
using ADT.Service.IService;
using Microsoft.AspNetCore.Authorization;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebSite.Areas.Admin.Controllers.Sys
{
    [Authorize]
    public class ChangePwdController : BaseController
    {
        private ISys_UserService _sys_UserService;
        public ChangePwdController(ISys_UserService sys_UserService)
        {
            _sys_UserService = sys_UserService;
        }
        protected override void Init()
        {
            this.MenuID = "Z-150";
        }
        // GET: /<controller>/
        public IActionResult Index()
        {
            var model = _sys_UserService.FindByClause(p => p.User_ID == Account.UserID);
            ViewData["username"] = model.User_Name;
            return View();
        }

        [HttpPost]
        public IActionResult ChangePwd(string oldpwd, string newpwd, string newlypwd)
        {
            if (string.IsNullOrEmpty(oldpwd))
                throw new MessageBox("旧密码不能为空");
            if (string.IsNullOrEmpty(newpwd))
                throw new MessageBox("新密码不能为空");
            if (string.IsNullOrEmpty(newlypwd))
                throw new MessageBox("确认新密码不能为空");
            if (!newpwd.Equals(newlypwd))
                throw new MessageBox("两次密码不一致");
            var _Sys_UserM = _sys_UserService.FindByClause(p => p.User_ID == Account.UserID);
            if (!_Sys_UserM.User_Pwd.Equals(oldpwd.Trim()))//Tools.MD5Encrypt(oldpwd.Trim())))
                throw new MessageBox("旧密码不正确");
            _Sys_UserM.User_Pwd = Tools.MD5Encryption(newpwd);
            var result = _sys_UserService.Update(_Sys_UserM);
            if (!result)
            {
                return Json(new { status = 0, msg = "修改密码失败" });
            }
            return Json(new { status = 1 });
        }
    }
}
