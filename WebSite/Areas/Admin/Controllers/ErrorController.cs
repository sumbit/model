using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ADT.Common;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebSite.Areas.Admin.Controllers
{
    [Area(areaName: "Admin")]
    public class ErrorController : Controller
    {

        public IActionResult Index(ErrorModel _ErrorModel)
        {
            return View(_ErrorModel);
        }
        /// <summary>
        /// 异常拦截
        /// </summary>
        /// <returns></returns>
        public IActionResult Ajax()
        {
            var feature = HttpContext.Features.Get<IExceptionHandlerFeature>();
            var error = feature?.Error;

            var IsAjaxRequest = (HttpContext.Request.Headers["X-Requested-With"] == "XMLHttpRequest");

            //判断是否是自定义异常类型
            if (error is MessageBox)
            {
                if (IsAjaxRequest)
                {
                    return Json(MessageBox.errorModel);
                }

                var errorModel = new ErrorModel(error.Message);
                var sb = new StringBuilder();
                sb.Append("<script src=\"/HzyUI/lib/jquery/jquery-2.1.4.min.js\"></script>");
                sb.Append("<script src=\"/lib/layui/layui.all.js\"></script>");
                sb.Append("<script src=\"/Admin/js/admin.js\"></script>");
                sb.Append("<script type='text/javascript'>");
                var MsgText = errorModel.msg.Trim();
                MsgText = MsgText.Replace("'", "“");
                MsgText = MsgText.Replace("\"", "”");
                sb.Append("$(function(){ admin.alert('" + MsgText + "', '警告', '警告'" + (MessageBox.errorModel.status == 401 ? ",function(){window.top.location.href=\"/admin/login/out\";}" : "") + "); });");
                sb.Append("</script>");
                return Content(sb.ToString(), "text/html;charset=utf-8;");
            }
            else
            {
                //Tools.Log.WriteLog(error, HttpContext.Connection.RemoteIpAddress.ToString());//log4net 写入日志到 txt
                var errorModel = new ErrorModel(error);
                if (IsAjaxRequest)
                {
                    return Json(errorModel);
                }
                return View(AppConfig.ErrorPageUrl, errorModel);
                //return View("~/Views/Shared/Error.cshtml", error);
            }
        }
    }
}
