using ADT.Models;
using ADT.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebSite.Areas.Admin.Filter
{
    public class RegisterRoleMenu
    {
        private static List<view_sys_user_role_function> _funcList;
        /// <summary>
        /// 管理后台用户角色权限对应列表
        /// </summary>
        public static List<view_sys_user_role_function> funcList
        {
            get
            {
                if (_funcList == null || _funcList.Count == 0)
                {
                    AddRoleMenu();
                }
                return _funcList;
            }
        }
        /// <summary>
        /// 将后台中所有的角色权限都注册到信息中
        /// </summary>
        public static void AddRoleMenu()
        {
            using (var db = SqlSugarHelper.GetInstance())
            {
                _funcList = db.Queryable<view_sys_user_role_function>().ToList();
            }
        }
    }
}
