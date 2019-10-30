using System;
using System.Collections.Generic;
using System.Text;
using ADT.Models;
using ADT.Repository.IRepository;

namespace ADT.Repository
{
    public class CreateCodeRepository : ICreateCodeRepository
    {
        /// <summary>
        /// 获取数据库中的所有表和字段
        /// </summary>
        /// <returns></returns>
        public List<CreateCodeTableField> GetDatabaseAllTable()
        {
            using (var db = SqlSugarHelper.GetInstance())
            {
                var sql = string.Empty;
                if (db.CurrentConnectionConfig.DbType == SqlSugar.DbType.SqlServer)
                {
                    sql = @"select TABLE_NAME+' [表]' name,TABLE_NAME id,null pId from INFORMATION_SCHEMA.TABLES
union all
select case when CHARACTER_MAXIMUM_LENGTH is null then COLUMN_NAME+' [字段类型:'+DATA_TYPE+']'
when CHARACTER_MAXIMUM_LENGTH is not null then COLUMN_NAME+' [字段类型:'+DATA_TYPE+'('+CONVERT(varchar(10),CHARACTER_MAXIMUM_LENGTH)+')]' end
 name,TABLE_NAME+'$~'+COLUMN_NAME id,TABLE_NAME from INFORMATION_SCHEMA.COLUMNS";
                }
                else
                {
                    var schema = DBConfigHelper.GetConfig("Schema");
                    sql = $"select Concat(TABLE_NAME,' [表]') name,TABLE_NAME id,null pId from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='{schema}' union all select case when CHARACTER_MAXIMUM_LENGTH is null then Concat(COLUMN_NAME,' [字段类型:',DATA_TYPE,']') when CHARACTER_MAXIMUM_LENGTH is not null then Concat(COLUMN_NAME,' [字段类型:',DATA_TYPE,'(',CHARACTER_MAXIMUM_LENGTH,')]') end  name,Concat(TABLE_NAME, '$~', COLUMN_NAME) id,TABLE_NAME from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = '{schema}'";
                }
                var entities = db.SqlQueryable<CreateCodeTableField>(sql).ToList();
                return entities;
            }
        }

        /// <summary>
        /// 根据表获取列
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        public List<CreateCodeFeild> GetColByTable(string table)
        {
            using (var db = SqlSugarHelper.GetInstance())
            {
                var sql = string.Empty;
                if (db.CurrentConnectionConfig.DbType == SqlSugar.DbType.SqlServer)
                {
                    sql = $"select a.COLUMN_NAME colname,case when a.COLUMN_NAME=b.COLUMN_NAME then '主键' end iskey,a.DATA_TYPE type,a.IS_NULLABLE is_null from INFORMATION_SCHEMA.COLUMNS a left join INFORMATION_SCHEMA.KEY_COLUMN_USAGE b on a.TABLE_NAME=b.TABLE_NAME where a.TABLE_NAME='{table}' ";
                }
                else
                {
                    var schema = DBConfigHelper.GetConfig("Schema");
                    sql = $"select a.COLUMN_NAME colname,case when a.COLUMN_NAME=b.COLUMN_NAME then '主键' end iskey,a.DATA_TYPE type,a.IS_NULLABLE is_null from INFORMATION_SCHEMA.COLUMNS a left join INFORMATION_SCHEMA.KEY_COLUMN_USAGE b on a.TABLE_NAME=b.TABLE_NAME where a.TABLE_SCHEMA='{schema}' and a.TABLE_NAME='{table}'";
                }
                var entities = db.SqlQueryable<CreateCodeFeild>(sql).ToList();
                return entities;
            }
        }

        /// <summary>
        /// 获取所有的表
        /// </summary>
        /// <returns></returns>
        public List<CreateCodeTable> GetAllTable()
        {
            using (var db = SqlSugarHelper.GetInstance())
            {
                var sql = string.Empty;
                if (db.CurrentConnectionConfig.DbType == SqlSugar.DbType.SqlServer)
                {
                    sql = @"SELECT * FROM INFORMATION_SCHEMA.TABLES";
                }
                else
                {
                    var schema = DBConfigHelper.GetConfig("Schema");
                    sql = $"SELECT * FROM INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='{schema}'";
                }
                var entities = db.SqlQueryable<CreateCodeTable>(sql).ToList();
                return entities;
            }
        }

        /// <summary>
        /// 生成实体类
        /// </summary>
        /// <param name="TableName">表名或视图名</param>
        /// <param name="path">存放路劲</param>
        /// <param name="nameSpace">命名空间</param>
        public void CreatedModel(string TableName, string path, string nameSpace)
        {
            using (var db = SqlSugarHelper.GetInstance())
            {
                db.DbFirst.Where(TableName).CreateClassFile(path, nameSpace);
            }
        }
    }
}
