using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ADT.Models;
using ADT.Service.IService;
using ADT.Common;
using System.Linq.Expressions;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Authorization;
using WebSite.Areas.Admin.Filter;
using WebSite.Models;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebSite.Areas.Admin.Controllers.Sys
{
    [Authorize]
    public class FunctionController : BaseController
    {
        private ISys_FunctionService _Sys_FunctionService;
        public FunctionController(ISys_FunctionService sys_FunctionService)
        {
            _Sys_FunctionService = sys_FunctionService;
        }
        protected override void Init()
        {
            this.MenuID = "Z-120";
        }
        [UsersRoleAuthFilter("Z-120", functionEnum.Have)]
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View();
        }
        [UsersRoleAuthFilter("Z-120", "Add,Edit")]
        public IActionResult Info(Guid id)
        {
            ViewBag.ID = id;
            return View();
        }
        [HttpPost]
        public ActionResult GetDataSource(string Function_Name, int page = 1, int row = 30)
        {
            Expression<Func<sys_function, bool>> exp = p => 1 == 1;
            if (!string.IsNullOrEmpty(Function_Name))
                exp = exp.And(p => p.Function_Name == Function_Name);
            var list = _Sys_FunctionService.GetPageList(exp, page, row, "Function_Num asc,Function_CreateTime desc");
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
                list = _Sys_FunctionService.FindByClause(p => p.Function_ID == ID);
            }
            else
            {
                list = new { };
            }
            return Json(list);
        }
        [HttpPost]
        public IActionResult Save(sys_function vmodel)
        {
            if (vmodel != null)
            {
                if (string.IsNullOrEmpty(vmodel.Function_Name))
                    throw new MessageBox("请输入功能名");
                if (string.IsNullOrEmpty(vmodel.Function_ID))
                {
                    vmodel.Function_ID = Guid.NewGuid().ToString();
                    vmodel.Function_CreateTime = DateTime.Now;
                    _Sys_FunctionService.Insert(vmodel);
                }
                else
                {
                    _Sys_FunctionService.Update(vmodel);
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
        [UsersRoleAuthFilter("Z-120", functionEnum.Delete)]
        public IActionResult Delete(string ID)
        {
            var list = JsonConvert.DeserializeObject<List<string>>(ID);
            var result = _Sys_FunctionService.Delete(p => list.Contains(p.Function_ID));
            if (result)
                return Json(new { status = 1 });
            else
                return Json(new { status = 0, msg = "删除失败" });
        }
    }
}
