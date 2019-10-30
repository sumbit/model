using System;
using System.Collections.Generic;
using System.Text;

namespace ADT.Models.Sys
{
    /// <summary>
    /// 系统配置实体
    /// </summary>
    public class Sys_Config
    {
        #region 邮箱配置
        /// <summary>
        /// 发件人账号
        /// </summary>
        public string Email_UserName { get; set; }
        /// <summary>
        /// 发件人密码
        /// </summary>
        public string Email_Password { get; set; }
        /// <summary>
        /// SMTP端口号
        /// </summary>
        public string Email_Port { get; set; }
        /// <summary>
        /// 发件人名称
        /// </summary>
        public string Email_Name { get; set; }
        /// <summary>
        /// 发件人SMTP地址
        /// </summary>
        public string Email_SMTP { get; set; }
        /// <summary>
        /// 是否开启SSL
        /// </summary>
        public bool Email_SSL { get; set; }
        /// <summary>
        /// 发件人地址
        /// </summary>
        public string Email_Host { get; set; }
        #endregion 邮箱配置
    }
}
