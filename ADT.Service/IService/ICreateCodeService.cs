using System;
using System.Collections.Generic;
using System.Text;
using ADT.Models;

namespace ADT.Service.IService
{
    public interface ICreateCodeService
    {
        /// <summary>
        /// 获取数据库中的所有表和字段
        /// </summary>
        /// <returns></returns>
        List<CreateCodeTableField> GetDatabaseAllTable();

        /// <summary>
        /// 根据表获取列
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        List<CreateCodeFeild> GetColByTable(string table);

        /// <summary>
        /// 获取所有的表
        /// </summary>
        /// <returns></returns>
        List<CreateCodeTable> GetAllTable();
        /// <summary>
        /// 生成实体类
        /// </summary>
        /// <param name="TableName">表名或视图名</param>
        /// <param name="path">存放路劲</param>
        /// <param name="nameSpace">命名空间</param>
        void CreatedModel(string TableName, string path, string nameSpace);
        /// <summary>
        /// 根据模板内容生成文件
        /// </summary>
        /// <param name="Content">模板内容</param>
        /// <param name="Table">替换内容</param>
        /// <param name="Type">模板类型</param>
        /// <param name="Url">文件存放路径</param>
        /// <param name="fileName">保存的文件名称</param>
        void CreateFileLogic(string Content, string Table, string Type, string Url, string fileName);
    }
}
