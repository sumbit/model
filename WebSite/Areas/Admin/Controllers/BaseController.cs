using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using ADT.Common;
using ADT.Models;
using ADT.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using SqlSugar;

namespace WebSite.Areas.Admin.Controllers
{
    [Area(areaName: "Admin")]
    public class BaseController : Controller
    {
        /// <summary>
        /// 主键ID
        /// </summary>
        public string KeyID { get; set; } = string.Empty;

        /// <summary>
        /// 菜单ID
        /// </summary>
        public string MenuID { get; set; } = string.Empty;

        /// <summary>
        /// 是否执行权限逻辑
        /// </summary>
        public bool IsExecutePowerLogic { get; set; } = true;

        /// <summary>
        /// 打印标题
        /// </summary>
        public string PrintTitle { get; set; } = "无标题";

        /// <summary>
        /// 帐户 信息 对象
        /// </summary>
        protected Sys_Account Account = new Sys_Account();

        /// <summary>
        /// 初始化
        /// </summary>
        protected virtual void Init() { }
        public BaseController()
        {
            this.Init();
        }
        /// <summary>
        /// Action 执行之前 发生
        /// </summary>
        /// <param name="filterContext"></param>
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (IsExecutePowerLogic || this.MenuID == "Home")
            {
                Console.WriteLine(filterContext.HttpContext.Request.Path.Value);
                var token = string.Empty;
                var cktoken = filterContext.HttpContext.Request.Cookies["authtoken"];
                var attoken = filterContext.HttpContext.Request.Headers["authtoken"].ToString();
                if (!string.IsNullOrEmpty(cktoken))
                {
                    //Console.WriteLine(cktoken);
                    token = cktoken;
                }
                if (!string.IsNullOrEmpty(attoken))
                    token = attoken;
                if (!string.IsNullOrEmpty(token))
                {
                    var userid = string.Empty;
                    var handers = new JwtSecurityTokenHandler().ReadJwtToken(token.Replace("Bearer ", ""));
                    foreach (var item in handers.Claims)
                    {
                        if (item.Type == "ID")
                            userid = item.Value;
                        //Console.WriteLine(item.Type);
                        //Console.WriteLine(item.Value);
                    }
                    if (!string.IsNullOrEmpty(Convert.ToString(CacheHelper.Get(userid))))
                    {
                        CacheHelper.Set(userid, "1", DateTime.Now.AddMinutes(120));
                        using (var db = SqlSugarHelper.GetInstance())
                        {
                            var model = db.Queryable<sys_user, sys_userrole>((u, ur) => new object[] {
                        JoinType.Inner, u.User_ID == ur.UserRole_UserID }
                            ).Where((u) => u.User_ID == userid)
                            .Select((u, ur) => new { u.User_ID, u.User_Name, ur.UserRole_RoleID }).First();
                            if (model != null)
                            {
                                Account.RoleID = model.UserRole_RoleID;
                                Account.UserID = model.User_ID;
                                Account.UserName = model.User_Name;
                                Account.IsSuperManage = model.UserRole_RoleID.ToStr().ToLower() == AppConfig.Admin_RoleID;
                                filterContext.RouteData.Values.Add("account", Account);
                                base.OnActionExecuting(filterContext);
                            }
                            else
                            {
                                throw new MessageBox("登陆超时，请重新登陆", EMsgStatus.无效权限401);
                            }
                        }
                    }
                    else
                    {
                        throw new MessageBox("请重新登陆", EMsgStatus.无效权限401);
                    }
                    //var model = _usersService.FindByClause(p => p.id == Guid.Parse(userid));
                    //if (model != null)
                    //{
                    //    usermodel = model;
                    //    base.OnActionExecuting(filterContext);
                    //}
                    //else
                    //{
                    //    filterContext.Result = new ContentResult()
                    //    {
                    //        ContentType = "application/json;",
                    //        Content = "no auth",
                    //        StatusCode = 401
                    //    };
                    //}
                }
                else
                {

                    base.OnActionExecuting(filterContext);
                }
            }
            else
            {
                base.OnActionExecuting(filterContext);
            }
        }

        /// <summary>
        /// Action 执行之后 发生
        /// </summary>
        /// <param name="filterContext"></param>
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            if (IsExecutePowerLogic && Account != null)
            {
                this.PowerLogic(filterContext);
            }
            base.OnActionExecuted(filterContext);
        }

        /// <summary>
        /// 权限逻辑
        /// </summary>
        /// <param name="context"></param>
        private void PowerLogic(ActionExecutedContext context)
        {
            //Console.WriteLine(context.HttpContext.Request.Headers["X-Requested-With"].ToString());
            if (!(context.HttpContext.Request.Headers["X-Requested-With"].ToString() == "XMLHttpRequest"))
            {
                using (var db = SqlSugarHelper.GetInstance())
                {
                    var _RouteValues = context.ActionDescriptor.RouteValues;
                    var _Area = _RouteValues["area"];
                    var _Controller = _RouteValues["controller"];
                    var _Action = _RouteValues["action"];

                    var _func_list = db.Queryable<sys_function>().OrderBy("Function_Num asc").ToList();
                    var _power_list = new Dictionary<string, object>();
                    //这里得判断一下是否是查找带回调用页面
                    string findback = context.HttpContext.Request.Query["findback"];

                    if (string.IsNullOrEmpty(findback))
                    {
                        //dynamic model = new ExpandoObject();
                        if (string.IsNullOrEmpty(MenuID))
                        {
                            throw new MessageBox("区域(" + _Area + "),控制器(" + _Controller + "):的程序中缺少菜单ID");
                        }

                        var _Menu = db.Queryable<sys_menu>().First(p => p.Menu_Num == MenuID);
                        if (_Menu == null || !_Menu.Menu_Url.ToStr().StartsWith("/" + _Area + "/" + _Controller + "/"))
                        {
                            throw new MessageBox("区域(" + _Area + "),控制器(" + _Controller + "):的程序中缺少菜单ID与该页面不匹配");
                        }

                        if (!Account.IsSuperManage)
                        {
                            var _role_menu_func_list = db.Queryable<sys_rolemenufunction>().ToList();
                            _power_list = new Dictionary<string, object>();
                            _func_list.ForEach(item =>
                            {
                                var ispower = _role_menu_func_list.FindAll(x =>
                                    x.RoleMenuFunction_RoleID == Account.RoleID &&
                                    x.RoleMenuFunction_MenuID == _Menu.Menu_ID &&
                                    x.RoleMenuFunction_FunctionID == item.Function_ID);

                                _power_list.Add(item.Function_ByName, (ispower.Count > 0));

                            });
                        }
                        else
                        {
                            var _menu_func_list = db.Queryable<sys_menufunction>().ToList();
                            _func_list.ForEach(item =>
                            {
                                //_power_list.Add(item.Function_ByName, true);
                                var ispower = _menu_func_list.FindAll(x => x.MenuFunction_MenuID == _Menu.Menu_ID && x.MenuFunction_FunctionID == item.Function_ID);
                                if (ispower.Count > 0)
                                    _power_list.Add(item.Function_ByName, true);
                                else
                                    _power_list.Add(item.Function_ByName, false);
                            });
                        }
                    }
                    else
                    {
                        _power_list = new Dictionary<string, object>();
                        _func_list.ForEach(item =>
                        {
                            _power_list.Add(item.Function_ByName, false);
                        });
                        _power_list["Have"] = true;
                        _power_list["Search"] = true;
                    }

                    if (Convert.ToBoolean(_power_list["Have"]) == false)
                        throw new MessageBox("没有权限访问该页面");
                    this.ViewData["PowerModel"] = _power_list.SerializeObject();
                    this.ViewData["thisWindowName"] = "adminIframe-/" + _Area + "/" + _Controller + "/" + _Action;
                    this.ViewData["formWindowName"] = "Form_" + _Area + _Controller + _Action;
                }
            }
        }

        /// <summary>
        /// 表数据转换为EXCEL
        /// </summary>
        /// <param name="dt">数据源</param>
        /// <param name="columns">表头字段</param>
        /// <param name="pccolumns">排除字段</param>
        /// <returns></returns>
        [NonAction]
        public virtual byte[] DBToExcel(DataTable dt, string[] columns, string[] pccolumns = null)
        {
            HSSFWorkbook workbook = new HSSFWorkbook();
            ISheet sheet = workbook.CreateSheet();

            //填充表头
            IRow dataRow = sheet.CreateRow(0);
            for (int i = 0; i < columns.Length; i++)
            {
                dataRow.CreateCell(i).SetCellValue(columns[i]);
            }

            //填充内容
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dataRow = sheet.CreateRow(i + 1);
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    if ((pccolumns == null || !pccolumns.Contains(dt.Columns[j].ColumnName)) && dt.Columns[j].ColumnName != "RowIndex")
                    {
                        dataRow.CreateCell(j).SetCellValue(dt.Rows[i][j].ToString());
                    }
                }
            }

            //保存
            using (MemoryStream ms = new MemoryStream())
            {
                workbook.Write(ms);
                return ms.ToArray();
            }
        }

        /// <summary>
        /// 处理上传文件
        /// </summary>
        /// <param name="_HttpPostedFileBase"></param>
        /// <param name="Format">文件格式</param>
        /// <param name="Check">执行前 验证回调</param>
        /// <param name="CallBack">如果有回调则保存 否则不保存</param>
        public void HandleUpFile(IFormFile _IFormFile, string[] Format, string _WebRootPath, Action<IFormFile> Check = null, Action<string> CallBack = null)
        {
            if (Check != null) Check(_IFormFile);

            string ExtensionName = Path.GetExtension(_IFormFile.FileName).ToLower().Trim();//获取后缀名

            if (Format != null && !Format.Contains(ExtensionName.ToLower()))
            {
                throw new MessageBox("请上传后缀名为：" + string.Join("、", Format) + " 格式的文件");
            }

            if (CallBack != null)
            {
                if (!Directory.Exists(_WebRootPath + "\\Content\\UpFile\\"))
                    Directory.CreateDirectory(_WebRootPath + "\\Content\\UpFile\\");
                string filePath = "/Content/UpFile/" + Guid.NewGuid() + ExtensionName;
                // 创建新文件
                using (FileStream fs = System.IO.File.Create(_WebRootPath + filePath))
                {
                    _IFormFile.CopyTo(fs);
                    // 清空缓冲区数据
                    fs.Flush();
                }

                CallBack(filePath);
            }
        }
    }
}