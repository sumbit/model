using System;
using System.Linq;

namespace ADT.Html
{
    using ADT.Html.Control;
    using ADT.Common;
    using System.Linq.Expressions;
    using Microsoft.AspNetCore.Html;
    public class UI
    {
        public static Control.Html _Html = new Control.Html();
        private static KOViewModelControl _KOViewModelControl = new KOViewModelControl();

        /// <summary>
        /// 解析表达式
        /// </summary>
        /// <param name="Field"></param>
        /// <returns></returns>
        private static dynamic AnalysisExpression<T>(Expression<Func<T, dynamic>> Field)
            where T : class, new()
        {
            var Name = "";
            var Title = "";

            var body = Field.Body;

            MemberExpression member = null;

            if (body is UnaryExpression)
            {
                var _UnaryExpression = body as UnaryExpression;
                member = _UnaryExpression.Operand as MemberExpression;
            }
            else if (body is ConstantExpression)
            {
                //var _ConstantExpression = body as ConstantExpression;

            }
            else if (body is MethodCallExpression)
            {
                //var _ConstantExpression = body as MethodCallExpression;
            }
            else if (body is MemberExpression)
            {
                member = body as MemberExpression;
            }



            if (member == null) throw new Exception("语法错误!");

            Name = member.Member.Name;

            var _FieldAttribute = member.Member.GetCustomAttributes(typeof(FieldAttribute), false).FirstOrDefault() as FieldAttribute;
            if (_FieldAttribute == null) throw new ArgumentNullException("属性 " + Name + " 找不到 自定义特性 ObjectRemarks.FieldAttribute ");

            Title = _FieldAttribute.Alias;

            return new { Name = Name, Title = Title };
        }

        /// <summary>
        /// Input 控件
        /// </summary>
        /// <param name="Title">标题</param>
        /// <param name="Name">字段名</param>
        /// <param name="Col"></param>
        /// <param name="Attribute">标签自定义属性</param>
        /// <param name="Validform">Validform表单验证规则</param>
        /// <param name="nullmsg">验证为空字符串时提示的内容</param>
        /// <param name="errormsg">验证失败时提示的内容</param>
        /// <returns></returns>
        public static HtmlString Input(string Title, string Name, int Col = 6, object Attribute = null, string Validform = null, string nullmsg = null, string errormsg = null)
        {
            return new HtmlString(_Html.Input(Title, Name, Attribute, Col, Validform, nullmsg, errormsg));
        }

        /// <summary>
        /// Input 控件 自定义属性 方法
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="Field"></param>
        /// <param name="Attribute">标签自定义属性</param>
        /// <param name="Col"></param>
        /// <returns></returns>
        public static HtmlString InputCustom<T>(Expression<Func<T, object>> Field, int Col = 6, object Attribute = null)
            where T : class, new()
        {
            var Obj = AnalysisExpression(Field);

            return new HtmlString(_Html.Input(Obj.Title, Attribute, Col));
        }

        /// <summary>
        /// Slect 控件
        /// </summary>
        /// <param name="Title">标题</param>
        /// <param name="Name">字段名</param>
        /// <param name="FuncOpetion"></param>
        /// <param name="Col"></param>
        /// <param name="Attribute">标签自定义属性</param>
        /// <param name="Validform">Validform表单验证规则</param>
        /// <param name="nullmsg">验证为空字符串时提示的内容</param>
        /// <param name="errormsg">验证失败时提示的内容</param>
        /// <returns></returns>
        public static HtmlString Select(string Title, string Name, Func<string> FuncOpetion, int Col = 6, object Attribute = null, string Validform = null, string nullmsg = null, string errormsg = null)
        {
            return new HtmlString(_Html.Select(Title, Name, FuncOpetion, Attribute, Col, Validform, nullmsg, errormsg));
        }

        /// <summary>
        /// Slect 控件 自定义属性 方法
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="Field"></param>
        /// <param name="Attribute"></param>
        /// <param name="FuncOpetion"></param>
        /// <param name="Col"></param>
        /// <returns></returns>
        public static HtmlString SelectCustom<T>(Expression<Func<T, object>> Field, Func<string> FuncOpetion, int Col = 6, object Attribute = null)
        where T : class, new()
        {
            var Obj = AnalysisExpression(Field);

            return new HtmlString(_Html.Select(Obj.Title, Attribute, FuncOpetion, Col));
        }

        /// <summary>
        /// 查找带回 控件
        /// </summary>
        /// <param name="Title">标题</param>
        /// <param name="TextName">显示值字段名</param>
        /// <param name="ValueName">值字段名</param>
        /// <param name="Url">跳转地址</param>
        /// <param name="FindClick">查询函数</param>
        /// <param name="RemoveClick">关闭函数</param>
        /// <param name="Col"></param>
        /// <param name="Placeholder"></param>
        /// <param name="KO"></param>
        /// <param name="Readonly"></param>
        /// <returns></returns>
        public static HtmlString FindBack(string Title, string TextName, string ValueName, string Url, string FindClick, string RemoveClick, int Col = 6, string Placeholder = null, bool KO = true, bool Readonly = true)
        {

            var _New_Placeholder = (string.IsNullOrEmpty(Placeholder) ? "请选择 " + Title : Placeholder);

            return new HtmlString(_Html.FindBack(Title, TextName, ValueName, Url, FindClick, RemoveClick, Col, _New_Placeholder, KO, Readonly));
        }

        /// <summary>
        /// 上传图片 控件
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="Field"></param>
        /// <param name="Col"></param>
        /// <param name="Width"></param>
        /// <param name="Height"></param>
        /// <returns></returns>
        public static HtmlString UploadImage(string Title, string Name, int Col = 6, string Tips = "请点击此处选择图片文件")
        {
            return new HtmlString(_Html.UploadImage(Title, Name, Tips, Col));
        }

        /// <summary>
        /// 上传图片 控件
        /// </summary>
        /// <param name="Title">标题</param>
        /// <param name="Name">字段名称</param>
        /// <param name="Col"></param>
        /// <param name="Tips"></param>
        /// <returns></returns>
        public static HtmlString UploadFileAsync(string Title, string Name, int Col = 6, string Tips = "请点击此处选择图片文件")
        {
            return new HtmlString(_Html.UploadFileAsync(Title, Name, Tips, Col));
        }

        /// <summary>
        /// 上传文件 控件
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="Field"></param>
        /// <param name="Col"></param>
        /// <param name="Attribute"></param>
        /// <returns></returns>
        public static HtmlString UploadFile(string Title, string Name, int Col = 6, string DownloadName = null, string Tips = "请点击此处选择文件")
        {
            return new HtmlString(_Html.UploadFile(Title, Name, DownloadName, Col, Tips));
        }

        /// <summary>
        /// 上传图片 控件(多文件)
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="Field"></param>
        /// <param name="Col"></param>
        /// <param name="Width"></param>
        /// <param name="Height"></param>
        /// <returns></returns>
        public static HtmlString UploadImageMultiple(string Title, string Name, string EventChange, int Col = 6, string Tips = "请点击此处选则图片文件")
        {
            return new HtmlString(_Html.UploadImageMultiple(Title, Name, Col, EventChange, Tips));
        }

        /// <summary>
        /// 上传文件 控件(多文件)
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="Field"></param>
        /// <param name="Col"></param>
        /// <param name="Attribute"></param>
        /// <returns></returns>
        public static HtmlString UploadFileMultiple(string Title, string Name, string EventChange, int Col = 6, string Tips = "请点击此处选则文件")
        {
            return new HtmlString(_Html.UploadFileMultiple(Title, Name, Col, EventChange, Tips));
        }

        /// <summary>
        /// UEditor 编辑器
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="Field"></param>
        /// <param name="Col"></param>
        /// <param name="Width"></param>
        /// <param name="Height"></param>
        /// <returns></returns>
        public static HtmlString UEditor(string Title, string Name, int Col = 6, string Width = "100%", string Height = "300px")
        {
            return new HtmlString(_Html.UEditor(Title, Name, Col, Width, Height));
        }

        /// <summary>
        /// Textarea 大文本框
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="Field"></param>
        /// <param name="Col"></param>
        /// <param name="Width"></param>
        /// <param name="Height"></param>
        /// <returns></returns>
        public static HtmlString Textarea(string Title, string Name, int Col = 6, object Attribute = null, string Placeholder = null)
        {
            return new HtmlString(_Html.Textarea(Title, Name, Col, Attribute, Placeholder));

        }


        /// <summary>
        /// 创建 KO 实体
        /// </summary>
        /// <returns></returns>
        public static HtmlString CreateKOViewModel(params object[] Models)
        {
            return new HtmlString(_KOViewModelControl.ScriptStr(Models).ToString());
        }
    }
}
