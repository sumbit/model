using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using ADT.Models;

namespace ADT.Repository.IRepository
{
    public interface ISys_MenuRepository : IBaseRepository<sys_menu>
    {
        /// <summary>
        /// ��ȡ�˵��͹�����
        /// </summary>
        /// <returns></returns>
        List<sys_menulistfunc> GetMenuAndFunctionTree(string RoleID = "");
        /// <summary>
        /// ����������ҳ����ѯ����
        /// </summary>
        /// <param name="predicate">�������ʽ��</param>
        /// <param name="page">�ڼ�ҳ</param>
        /// <param name="row">ÿҳ��ʾ������</param>
        /// <param name="orderBy">�������</param>
        /// <param name="totalNumber">����������ֵ��</param>
        /// <returns></returns>
        List<sys_menulist> GetMenuPageList(Expression<Func<sys_menu, bool>> predicate, int page, int row, string orderBy, ref int totalNumber);
    }
}
