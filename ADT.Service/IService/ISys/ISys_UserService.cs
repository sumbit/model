using System;
using System.Collections.Generic;
using System.Text;
using System.Linq.Expressions;
using ADT.Models;
using SqlSugar;

namespace ADT.Service.IService
{
    public interface ISys_UserService
    {
        #region 通用模板功能
        /// <summary>
        /// 根据主值查询单条数据
        /// </summary>
        /// <param name="pkValue">主键值</param>
        /// <returns>泛型实体</returns>
        sys_user FindById(object pkValue);
        /// <summary>
        /// 查询所有数据(无分页,请慎用)
        /// </summary>
        /// <returns></returns>
        IEnumerable<sys_user> FindAll();
        /// <summary>
        /// 根据条件查询数据
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="orderBy">排序</param>
        /// <returns>泛型实体集合</returns>
        IEnumerable<sys_user> FindListByClause(Expression<Func<sys_user, bool>> predicate, string orderBy);
        /// <summary>
        /// 根据条件查询总数
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <returns></returns>
        int FindCount(Expression<Func<sys_user, bool>> predicate);
        /// <summary>
        /// 根据条件分页
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="page">第几页</param>
        /// <param name="row">每页显示多少条</param>
        /// <param name="orderBy">排序规则</param>
        /// <returns></returns>
        IEnumerable<sys_user> FindPageListByClause(Expression<Func<sys_user, bool>> predicate, int page, int row, string orderBy);
        /// <summary>
        /// 根据条件分页及查询总数
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="page">第几页</param>
        /// <param name="row">每页显示多少条</param>
        /// <param name="orderBy">排序规则</param>
        /// <param name="totalNumber">总数（返回值）</param>
        /// <returns></returns>
        IEnumerable<sys_user> FindPageListByClause(Expression<Func<sys_user, bool>> predicate, int page, int row, string orderBy, ref int totalNumber);
        /// <summary>
        /// 根据条件分页及查询总数
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="page">第几页</param>
        /// <param name="row">每页显示多少条</param>
        /// <param name="orderBy">排序规则</param>
        /// <param name="totalNumber">总数（返回值）</param>
        /// <returns></returns>
        DataTable FindPageListByClauseData(Expression<Func<sys_user, bool>> predicate, int page, int row, string orderBy, ref int totalNumber);
        /// <summary>
        /// 根据条件查询数据
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <returns></returns>
        sys_user FindByClause(Expression<Func<sys_user, bool>> predicate);
        /// <summary>
        /// 写入实体数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        long Insert(sys_user entity);
        /// <summary>
        /// 更新实体数据
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        bool Update(sys_user entity);
        /// <summary>
        /// 更新自定义字段数据
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="updateColumns">修改字段表达式树</param>
        /// <returns></returns>
        bool Update(sys_user entity, Expression<Func<sys_user, object>> updateColumns);
        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        bool Delete(sys_user entity);
        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="where">过滤条件</param>
        /// <returns></returns>
        bool Delete(Expression<Func<sys_user, bool>> @where);
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
        PageList<sys_user> GetPageList(Expression<Func<sys_user, bool>> predicate, int page, int pageSize, string orderBy);
        /// <summary>
        /// 创建用户并生成关联角色
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        bool InsertUsers(view_sys_user_role model);
        /// <summary>
        /// 修改用户并修改关联角色
        /// </summary>
        /// <param name="u"></param>
        /// <returns></returns>
        bool UpdateUsers(view_sys_user_role u);
    }
}
