using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebSite.Models
{
    public enum logTypeEnum
    {
        登录 = 0,
        登出 = 1,
        增加 = 2,
        修改 = 3,
        删除 = 4,
        权限设置 = 5,
        禁用 = 6,
        启用 = 7,
        进度状态调整 = 8,
        初始化设置 = 9
    }

    /// <summary>
    /// 功能枚举
    /// </summary>
    public enum functionEnum
    {
        /// <summary>
        /// 导出
        /// </summary>
        GetExcel,
        /// <summary>
        /// 保存
        /// </summary>
        Save,
        /// <summary>
        /// 查看
        /// </summary>
        Info,
        /// <summary>
        /// 修改
        /// </summary>
        Edit,
        /// <summary>
        /// 添加
        /// </summary>
        Add,
        /// <summary>
        /// 删除
        /// </summary>
        Delete,
        /// <summary>
        /// 检索
        /// </summary>
        Search,
        /// <summary>
        /// 能否拥有该菜单
        /// </summary>
        Have
    }
}
