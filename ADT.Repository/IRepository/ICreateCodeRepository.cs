using System;
using System.Collections.Generic;
using System.Text;
using ADT.Models;

namespace ADT.Repository.IRepository
{
    public interface ICreateCodeRepository
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
    }
}
