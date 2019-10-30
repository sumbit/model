using System;
using System.Collections.Generic;
using System.Text;
using System.Linq.Expressions;
using ADT.Models;
using ADT.Repository.IRepository;
using ADT.Service.IService;

namespace ADT.Service
{
    public class Sys_RoleMenuFunctionService : ISys_RoleMenuFunctionService
    {
        private ISys_RoleMenuFunctionRepository _Sys_RoleMenuFunctionRepositoryS;
        public Sys_RoleMenuFunctionService(ISys_RoleMenuFunctionRepository Sys_RoleMenuFunctionRepositoryS)
        {
            _Sys_RoleMenuFunctionRepositoryS = Sys_RoleMenuFunctionRepositoryS;
        }
        #region 通用模板功能
        /// <summary>
        /// 根据主值查询单条数据
        /// </summary>
        /// <param name="pkValue">主键值</param>
        /// <returns>泛型实体</returns>
        public sys_rolemenufunction FindById(object pkValue)
        {
            return _Sys_RoleMenuFunctionRepositoryS.FindById(pkValue);
        }

        /// <summary>
        /// 查询所有数据(无分页,请慎用)
        /// </summary>
        /// <returns></returns>
        public IEnumerable<sys_rolemenufunction> FindAll()
        {
            return _Sys_RoleMenuFunctionRepositoryS.FindAll();
        }

        /// <summary>
        /// 根据条件查询数据
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="orderBy">排序</param>
        /// <returns>泛型实体集合</returns>
        public IEnumerable<sys_rolemenufunction> FindListByClause(Expression<Func<sys_rolemenufunction, bool>> predicate, string orderBy)
        {
            return _Sys_RoleMenuFunctionRepositoryS.FindListByClause(predicate, orderBy);
        }
        /// <summary>
        /// 根据条件查询总数
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <returns></returns>
        public int FindCount(Expression<Func<sys_rolemenufunction, bool>> predicate)
        {
            return _Sys_RoleMenuFunctionRepositoryS.FindCount(predicate);
        }

        /// <summary>
        /// 根据条件分页
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="page">第几页</param>
        /// <param name="row">每页显示多少条</param>
        /// <param name="orderBy">排序规则</param>
        /// <returns></returns>
        public IEnumerable<sys_rolemenufunction> FindPageListByClause(Expression<Func<sys_rolemenufunction, bool>> predicate, int page, int row, string orderBy)
        {
            return _Sys_RoleMenuFunctionRepositoryS.FindPageListByClause(predicate, page, row, orderBy);
        }

        /// <summary>
        /// 根据条件分页及查询总数
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="page">第几页</param>
        /// <param name="row">每页显示多少条</param>
        /// <param name="orderBy">排序规则</param>
        /// <param name="totalNumber">总数（返回值）</param>
        /// <returns></returns>
        public IEnumerable<sys_rolemenufunction> FindPageListByClause(Expression<Func<sys_rolemenufunction, bool>> predicate, int page, int row, string orderBy, ref int totalNumber)
        {
            return _Sys_RoleMenuFunctionRepositoryS.FindPageListByClause(predicate, page, row, orderBy, ref totalNumber);
        }

        /// <summary>
        /// 根据条件查询数据
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <returns></returns>
        public sys_rolemenufunction FindByClause(Expression<Func<sys_rolemenufunction, bool>> predicate)
        {
            return _Sys_RoleMenuFunctionRepositoryS.FindByClause(predicate);
        }

        /// <summary>
        /// 写入实体数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public long Insert(sys_rolemenufunction entity)
        {
            return _Sys_RoleMenuFunctionRepositoryS.Insert(entity);
        }

        /// <summary>
        /// 批量写入实体数据
        /// </summary>
        /// <param name="entitylist">实体类集合</param>
        /// <returns></returns>
        public long InsertBatch(List<sys_rolemenufunction> entitylist)
        {
            return _Sys_RoleMenuFunctionRepositoryS.InsertBatch(entitylist);
        }

        /// <summary>
        /// 更新实体数据
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool Update(sys_rolemenufunction entity)
        {
            return _Sys_RoleMenuFunctionRepositoryS.Update(entity);
        }

        /// <summary>
        /// 更新实体数据
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="updateColumns">修改字段表达式树</param>
        /// <returns></returns>
        public bool Update(sys_rolemenufunction entity, Expression<Func<sys_rolemenufunction, object>> updateColumns)
        {
            return _Sys_RoleMenuFunctionRepositoryS.Update(entity, updateColumns);
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Delete(sys_rolemenufunction entity)
        {
            return _Sys_RoleMenuFunctionRepositoryS.Delete(entity);
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="where">过滤条件</param>
        /// <returns></returns>
        public bool Delete(Expression<Func<sys_rolemenufunction, bool>> @where)
        {
            return _Sys_RoleMenuFunctionRepositoryS.Delete(@where);
        }

        /// <summary>
        /// 删除指定ID的数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeleteById(object id)
        {
            return _Sys_RoleMenuFunctionRepositoryS.DeleteById(id);
        }

        /// <summary>
        /// 删除指定ID集合的数据(批量删除)
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public bool DeleteByIds(object[] ids)
        {
            return _Sys_RoleMenuFunctionRepositoryS.DeleteByIds(ids);
        }
        #endregion 通用模板功能
        /// <summary>
        /// 获取管理后台分页数据
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="page">第几页</param>
        /// <param name="row">煤业显示多少条</param>
        /// <param name="orderBy">排序条件</param>
        /// <returns></returns>
        public PageList<sys_rolemenufunction> GetPageList(Expression<Func<sys_rolemenufunction, bool>> predicate, int page, int row, string orderBy)
        {
            PageList<sys_rolemenufunction> pageList = new PageList<sys_rolemenufunction>();
            pageList.page = page;
            pageList.pageCount = (pageList.total / row);
            int totalNumber = 0;
            pageList.rows = _Sys_RoleMenuFunctionRepositoryS.FindPageListByClause(predicate, page, row, orderBy, ref totalNumber);
            pageList.total = totalNumber;
            return pageList;
        }
    }
}
