using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ADT.Service.IService;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using ADT.Common;
using System.Data;
using Microsoft.AspNetCore.Authorization;

namespace WebSite.Areas.Admin.Controllers.Sys
{
    [Authorize]
    public class CreateCodeController : BaseController
    {
        private ICreateCodeService _createCodeService;
        private IHostingEnvironment _IHostingEnvironment = null;
        private string _WebRootPath = string.Empty;
        public CreateCodeController(ICreateCodeService createCodeService, IHostingEnvironment iHostingEnvironment)
        {
            _createCodeService = createCodeService;
            this._IHostingEnvironment = iHostingEnvironment;
            _WebRootPath = this._IHostingEnvironment.WebRootPath;
        }
        protected override void Init()
        {
            this.MenuID = "Z-160";
        }
        public IActionResult Index()
        {
            ViewData["Path"] = (_WebRootPath + "\\Content\\CreateFile\\").Replace("\\", "\\\\");
            return View();
        }
        /// <summary>
        /// 获取数据库中所有的表和字段
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetDatabaseAllTable()
        {
            return Json(new { status = 1, value = _createCodeService.GetDatabaseAllTable() });
        }

        /// <summary>
        /// 保存
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Save(IFormCollection fc)
        {
            var classType = fc["ClassType"].ToStr();
            var pathUrl = (fc["Url"].ToStr() == null ? _WebRootPath + "\\Content\\CreateFile\\" : fc["Url"].ToStr());
            var isall = fc["isall"].ToBool();
            var tableName = fc["Table"].ToStr() ?? "";
            if (classType == "Model")
            {
                if (System.IO.Directory.Exists(pathUrl + "\\Models\\"))
                {
                    var dir = new System.IO.DirectoryInfo(pathUrl + "\\Models\\");
                    var fileinfo = dir.GetFileSystemInfos();  //返回目录中所有文件和子目录
                    foreach (var i in fileinfo)
                    {
                        if (i is System.IO.DirectoryInfo)            //判断是否文件夹
                        {
                            var subdir = new System.IO.DirectoryInfo(i.FullName);
                            subdir.Delete(true);          //删除子目录和文件
                        }
                        else
                        {
                            System.IO.File.Delete(i.FullName);      //删除指定文件
                        }
                    }
                }
                if (!isall)
                {
                    _createCodeService.CreatedModel(tableName, pathUrl + "Models\\", "ADT.Models");
                }
                else
                {
                    var list = _createCodeService.GetAllTable();
                    foreach (var item in list)
                    {
                        _createCodeService.CreatedModel(item.TABLE_NAME, pathUrl + "Models\\", "ADT.Models");
                    }
                }
            }
            else
            {
                var template = _WebRootPath + "\\Content\\Template\\";
                var ipathUrl = pathUrl;
                var templates = string.Empty;//模板生成路径
                var templatei = string.Empty;//模板接口生成路径
                var classFileName = string.Empty;
                if (classType == "Service")
                {
                    pathUrl += "\\Service\\";
                    ipathUrl = $"{pathUrl}\\IService";
                    templates = $"{template}\\Service\\Service.txt";
                    templatei = $"{template}\\Service\\IService.txt";
                    classFileName = "Service";
                }
                else if (classType == "Repository")
                {
                    pathUrl += "\\Repository\\";
                    ipathUrl = $"{pathUrl}\\IRepository";
                    templates = $"{template}\\Repository\\Repository.txt";
                    templatei = $"{template}\\Repository\\IRepository.txt";
                    classFileName = "Repository";
                }
                else if (classType == "Model")
                {
                    pathUrl += "\\Models\\";
                    templates = $"{template}\\Model\\Model.txt";
                }
                if (!System.IO.File.Exists(templates) || (classType != "Model" && !System.IO.File.Exists(templatei)))
                    return Json(new { status = 200, msg = "模板文件不存在" });
                if (System.IO.Directory.Exists(pathUrl + "\\"))
                {
                    var dir = new System.IO.DirectoryInfo(pathUrl + "\\");
                    var fileinfo = dir.GetFileSystemInfos();  //返回目录中所有文件和子目录
                    foreach (var i in fileinfo)
                    {
                        if (i is System.IO.DirectoryInfo)            //判断是否文件夹
                        {
                            var subdir = new System.IO.DirectoryInfo(i.FullName);
                            subdir.Delete(true);          //删除子目录和文件
                        }
                        else
                        {
                            System.IO.File.Delete(i.FullName);      //删除指定文件
                        }
                    }
                    //System.IO.Directory.Delete(Url + "\\");
                }
                if (!System.IO.Directory.Exists(pathUrl))
                {
                    System.IO.Directory.CreateDirectory(pathUrl);
                }
                if (!System.IO.Directory.Exists(ipathUrl))
                {
                    System.IO.Directory.CreateDirectory(ipathUrl);
                }
                var Content = System.IO.File.ReadAllText(templates);
                var Content1 = string.Empty;
                if (classType != "Model")
                    Content1 = System.IO.File.ReadAllText(templatei);
                if (!isall)
                {
                    _createCodeService.CreateFileLogic(Content, tableName, classType, pathUrl, tableName + classFileName);
                    if (classType != "Model")
                        _createCodeService.CreateFileLogic(Content1, tableName, classType, ipathUrl, $"I{tableName}{classFileName}");
                }
                else
                {
                    var list = _createCodeService.GetAllTable();
                    foreach (var item in list)
                    {
                        _createCodeService.CreateFileLogic(Content, item.TABLE_NAME, classType, pathUrl, item.TABLE_NAME + classFileName);
                        if (classType != "Model")
                            _createCodeService.CreateFileLogic(Content1, item.TABLE_NAME, classType, ipathUrl, $"I{item.TABLE_NAME}{classFileName}");
                    }
                }
            }
            return Json(new { status = 1, data = fc["ClassType"].ToStr(), path = fc["Url"].ToStr() });
        }
    }
}