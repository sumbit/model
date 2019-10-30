using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ADT.Service.IService;
using ADT.Models;
using Microsoft.Extensions.Options;
using System.Linq.Expressions;
using ADT.Common;
using Newtonsoft.Json;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebSite.Areas.Admin.Controllers.Demo
{
    public class NewsController : BaseController
    {
        private InewsService _newsService;
        private JwtSettings _jwtOptions;
        public NewsController(IOptions<JwtSettings> jwtSettings, InewsService newsService)
        {
            _newsService = newsService;
            _jwtOptions = jwtSettings.Value;
        }
        protected override void Init()
        {
            this.MenuID = "N-100";
        }
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Info(string id)
        {
            ViewBag.ID = id;
            return View();
        }
        [HttpPost]
        public ActionResult GetDataSource(string name, int page = 1, int row = 30)
        {
            Expression<Func<news, bool>> exp = p => 1 == 1;
            if (!string.IsNullOrEmpty(name))
                exp = exp.And(p => p.name == name);
            var list = _newsService.GetPageList(exp, page, row, "update_time desc");
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
                list = _newsService.FindByClause(p => p.id == ID);
            }
            else
            {
                list = new { };
            }
            return Json(list);
        }
        [HttpPost]
        public IActionResult Save(news vmodel)
        {
            if (vmodel != null)
            {
                if (string.IsNullOrEmpty(vmodel.name))
                    throw new MessageBox("请输入标题");
                if (!string.IsNullOrEmpty(vmodel.id))
                {
                    vmodel.update_time = DateTime.Now;
                    _newsService.Update(vmodel);
                }
                else
                {
                    vmodel.id = Guid.NewGuid().ToString();
                    vmodel.created_time = DateTime.Now;
                    vmodel.update_time = DateTime.Now;
                    _newsService.Insert(vmodel);
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
        public IActionResult Delete(string ID)
        {
            var list = JsonConvert.DeserializeObject<List<string>>(ID);
            var result = _newsService.Delete(p => list.Contains(p.id));
            if (result)
                return Json(new { status = 1 });
            else
                return Json(new { status = 0, msg = "删除失败" });
        }
    }
}
