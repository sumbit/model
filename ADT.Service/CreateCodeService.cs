using System;
using System.Collections.Generic;
using System.Text;
using ADT.Models;
using ADT.Repository.IRepository;
using ADT.Service.IService;

namespace ADT.Service
{
    public class CreateCodeService : ICreateCodeService
    {
        ICreateCodeRepository _createCodeRepository;
        public CreateCodeService(ICreateCodeRepository createCodeRepository)
        {
            _createCodeRepository = createCodeRepository;
        }
        /// <summary>
        /// 获取数据库中的所有表和字段
        /// </summary>
        /// <returns></returns>
        public List<CreateCodeTableField> GetDatabaseAllTable()
        {
            return _createCodeRepository.GetDatabaseAllTable();
        }

        /// <summary>
        /// 根据表获取列
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        public List<CreateCodeFeild> GetColByTable(string table)
        {
            return _createCodeRepository.GetColByTable(table);
        }

        /// <summary>
        /// 获取所有的表
        /// </summary>
        /// <returns></returns>
        public List<CreateCodeTable> GetAllTable()
        {
            return _createCodeRepository.GetAllTable();
        }
        /// <summary>
        /// 生成实体类
        /// </summary>
        /// <param name="TableName">表名或视图名</param>
        /// <param name="path">存放路劲</param>
        /// <param name="nameSpace">命名空间</param>
        public void CreatedModel(string TableName, string path, string nameSpace)
        {
            _createCodeRepository.CreatedModel(TableName, path, nameSpace);
        }
        /// <summary>
        /// 根据模板内容生成文件
        /// </summary>
        /// <param name="Content">模板内容</param>
        /// <param name="Table">替换内容</param>
        /// <param name="Type">模板类型</param>
        /// <param name="Url">文件存放路径</param>
        /// <param name="fileName">保存的文件名称</param>
        public void CreateFileLogic(string Content, string Table, string Type, string Url, string fileName)
        {
            var ClassName = Table;
            string filds = string.Empty;

            Content = Content.Replace("<#TableName#>", ClassName);
            if (Type == "Model")
            {
                var col = this.GetColByTable(Table);
                foreach (var item in col)
                {
                    var key = item.iskey == null ? "" : item.iskey;
                    var colname = item.colname == null ? "" : item.colname;
                    var type = item.type == null ? "" : item.type;
                    var is_null = item.is_null;

                    switch (type)
                    {
                        case "uniqueidentifier":
                            type = is_null.ToUpper() == "NO" ? "Guid" : "Guid?";
                            break;
                        case "bit":
                        case "int":
                            type = type = is_null.ToUpper() == "NO" ? "int" : "int?";
                            break;
                        case "datetime":
                            type = is_null.ToUpper() == "NO" ? "DateTime" : "DateTime?";
                            break;
                        case "float":
                            type = is_null.ToUpper() == "NO" ? "float" : "float?";
                            break;
                        case "money":
                            type = is_null.ToUpper() == "NO" ? "double" : "double?";
                            break;
                        case "decimal":
                            type = is_null.ToUpper() == "NO" ? "decimal" : "decimal?";
                            break;
                        default:
                            type = "string";
                            break;
                    }

                    if (!string.IsNullOrEmpty(key))
                    {
                        filds += "\t\t[Field(\"" + colname + "\", IsPrimaryKey = true)]" + "\r\n";
                    }
                    else
                    {
                        if (colname.Contains("_CreateTime") && type == "DateTime?")
                            filds += "\t\t[Field(\"创建时间\", IsIgnore = true)]" + "\r\n";
                        else
                            filds += "\t\t[Field(\"" + colname + "\")]" + "\r\n";
                    }
                    filds += "\t\tpublic " + type + " " + colname + " { get; set; }\r\n\r\n";
                }
                Content = Content.Replace("<#Filds#>", filds);
            }
            System.IO.File.WriteAllText(Url + "\\" + fileName + ".cs", Content);
        }
    }
}
