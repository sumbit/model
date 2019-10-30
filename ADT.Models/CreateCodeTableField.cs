using System;
using System.Collections.Generic;
using System.Text;

namespace ADT.Models
{
    public class CreateCodeTableField
    {
        /// <summary>
        /// 表或字段名称
        /// </summary>
        public string name { get; set; }
        /// <summary>
        /// 表或字段英文名称
        /// </summary>
        public string id { get; set; }
        /// <summary>
        /// 字段所属表名称
        /// </summary>
        public string pId { get; set; }
    }
    public class CreateCodeFeild
    {
        /// <summary>
        /// 字段名称
        /// </summary>
        public string colname { get; set; }
        /// <summary>
        /// 是否主键
        /// </summary>
        public string iskey { get; set; }
        /// <summary>
        /// 字段类型
        /// </summary>
        public string type { get; set; }
        /// <summary>
        /// 是否可以为空（NO-不可以、YES-可以）
        /// </summary>
        public string is_null { get; set; }
    }
    public class CreateCodeTable
    {
        /// <summary>
        /// 数据库名称
        /// </summary>
        public string TABLE_CATALOG { get; set; }
        /// <summary>
        /// 所属级别
        /// </summary>
        public string TABLE_SCHEMA { get; set; }
        /// <summary>
        /// 表名称
        /// </summary>
        public string TABLE_NAME { get; set; }
        /// <summary>
        /// 表类型
        /// </summary>
        public string TABLE_TYPE { get; set; }
    }
}
