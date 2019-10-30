using System;
using System.Collections.Generic;
using System.Text;

namespace ADT.Models
{
    public class PageList<T>
    {
        /// <summary>
        /// 第几页
        /// </summary>
        public int page { get; set; }
        /// <summary>
        /// 总页数
        /// </summary>
        public int pageCount { get; set; }
        /// <summary>
        /// 数据总数
        /// </summary>
        public int total { get; set; }
        /// <summary>
        /// 列表数据
        /// </summary>
        public IEnumerable<T> rows { get; set; }
    }
}
