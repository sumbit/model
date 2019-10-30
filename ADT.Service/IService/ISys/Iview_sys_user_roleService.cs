using System;
using System.Collections.Generic;
using System.Text;
using System.Linq.Expressions;
using ADT.Models;

namespace ADT.Service.IService
{
    public interface Iview_sys_user_roleService
    {
		#region 通用模板功能
		/// <summary>
        /// 根据主值查询单条数据
        /// </summary>
        /// <param name="pkValue">主键值</param>
        /// <returns>泛型实体</returns>
        view_sys_user_role FindById(object pkValue);
        /// <summary>
        /// 查询所有数据(无分页,请慎用)
        /// </summary>
        /// <returns></returns>
        IEnumerable<view_sys_user_role> FindAll();
        /// <summary>
        /// 根据条件查询数据
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="orderBy">排序</param>
        /// <returns>泛型实体集合</returns>
        IEnumerable<view_sys_user_role> FindListByClause(Expression<Func<view_sys_user_role, bool>> predicate, string orderBy);
        /// <summary>
        /// 根据条件查询总数
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <returns></returns>
        int FindCount(Expression<Func<view_sys_user_role, bool>> predicate);
        /// <summary>
        /// 根据条件分页
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="page">第几页</param>
        /// <param name="row">每页显示多少条</param>
        /// <param name="orderBy">排序规则</param>
        /// <returns></returns>
        IEnumerable<view_sys_user_role> FindPageListByClause(Expression<Func<view_sys_user_role, bool>> predicate, int page, int row, string orderBy);
        /// <summary>
        /// 根据条件分页及查询总数
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="page">第几页</param>
        /// <param name="row">每页显示多少条</param>
        /// <param name="orderBy">排序规则</param>
        /// <param name="totalNumber">总数（返回值）</param>
        /// <returns></returns>
        IEnumerable<view_sys_user_role> FindPageListByClause(Expression<Func<view_sys_user_role, bool>> predicate, int page, int row, string orderBy, ref int totalNumber);
        /// <summary>
        /// 根据条件查询数据
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <returns></returns>
        view_sys_user_role FindByClause(Expression<Func<view_sys_user_role, bool>> predicate);
        /// <summary>
        /// 写入实体数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        long Insert(view_sys_user_role entity);
        /// <summary>
        /// 更新实体数据
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        bool Update(view_sys_user_role entity);
        /// <summary>
        /// 更新自定义字段数据
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="updateColumns">修改字段表达式树</param>
        /// <returns></returns>
        bool Update(view_sys_user_role entity, Expression<Func<view_sys_user_role, object>> updateColumns);
        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        bool Delete(view_sys_user_role entity);
        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="where">过滤条件</param>
        /// <returns></returns>
        bool Delete(Expression<Func<view_sys_user_role, bool>> @where);
        /// <summary>
        /// 删除指定ID的数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        bool DeleteById(object id);
        /// <summary>
        /// 删除指定ID集合的数据(批量删除)
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        bool DeleteByIds(object[] ids);
		#endregion 通用模板功能
        /// <summary>
        /// 获取管理后台分页数据
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="page">第几页</param>
        /// <param name="row">煤业显示多少条</param>
        /// <param name="orderBy">排序条件</param>
        /// <returns></returns>
        PageList<view_sys_user_role> GetPageList(Expression<Func<view_sys_user_role, bool>> predicate, int page, int pageSize, string orderBy);
    }
}
