using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ADT.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebSite.Areas.Admin.Controllers.Demo
{
    public class MemberController : BaseController
    {
        private IHostingEnvironment _IHostingEnvironment = null;
        private string _WebRootPath = string.Empty;
        public MemberController(IHostingEnvironment IHostingEnvironment)
        {
            this._IHostingEnvironment = IHostingEnvironment;
            //获取网站路径
            _WebRootPath = this._IHostingEnvironment.WebRootPath;
        }

        protected override void Init()
        {
            this.MenuID = "A-100";
            this.PrintTitle = "我是一个 打印标题！";
        }
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Info()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Save(Member model, IFormFile Member_Photo_Files, IFormFile Member_FilePath_Fiels)
        {
            //接收图片
            if (Member_Photo_Files != null)
            {
                this.HandleUpFile(Member_Photo_Files, new string[] { ".jpg", ".gif", ".png" }, _WebRootPath, null, (_Path) =>
                {
                    model.Member_Photo = _Path;
                });
            }
            return Json(new { status = 1, ID = KeyID });
        }

        /// <summary>
        /// 查询根据ID
        /// </summary>
        /// <param name="ID"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Find(string ID)
        {
            return Json(new { });
        }
    }
}
