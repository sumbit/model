using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Internal;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebSite.Areas.Admin.Controllers
{
    [Authorize]
    public class UploadFileController : BaseController
    {
        private IHostingEnvironment _IHostingEnvironment = null;
        private string _WebRootPath = string.Empty;
        public UploadFileController(IHostingEnvironment IHostingEnvironment)
        {
            this._IHostingEnvironment = IHostingEnvironment;
            //获取网站路径
            _WebRootPath = this._IHostingEnvironment.WebRootPath;
        }
        protected override void Init()
        {
            base.Init();
            this.IsExecutePowerLogic = false;
        }
        // GET: /<controller>/
        [HttpPost]
        public IActionResult Index([FromForm] IFormCollection formCollection, string exits)
        {
            string path = "";
            if (string.IsNullOrEmpty(exits))
                return Json(new { code = 1, msg = "无效扩展名" });
            FormFileCollection filelist = (FormFileCollection)formCollection.Files;

            foreach (IFormFile file in filelist)
            {
                this.HandleUpFile(file, exits.Split('|'), _WebRootPath, null, (_Path) =>
                {
                    path = _Path;
                });
            }
            return Json(new { code = 0, data = path });
        }
    }
}
