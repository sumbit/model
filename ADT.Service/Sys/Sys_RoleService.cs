using System;
using System.Collections.Generic;
using System.Text;
using System.Linq.Expressions;
using ADT.Models;
using ADT.Repository.IRepository;
using ADT.Service.IService;

namespace ADT.Service
{
    public class Sys_RoleService : ISys_RoleService
    {
        private ISys_RoleRepository _Sys_RoleRepositoryS;
        public Sys_RoleService(ISys_RoleRepository Sys_RoleRepositoryS)
        {
            _Sys_RoleRepositoryS = Sys_RoleRepositoryS;
        }
		#region 通用模板功能
        /// <summary>
        /// 根据主值查询单条数据
        /// </summary>
        /// <param name="pkValue">主键值</param>
        /// <returns>泛型实体</returns>
        public sys_role FindById(object pkValue)
        {
            return _Sys_RoleRepositoryS.FindById(pkValue);
        }

        /// <summary>
        /// 查询所有数据(无分页,请慎用)
        /// </summary>
        /// <returns></returns>
        public IEnumerable<sys_role> FindAll()
        {
            return _Sys_RoleRepositoryS.FindAll();
        }

        /// <summary>
        /// 根据条件查询数据
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="orderBy">排序</param>
        /// <returns>泛型实体集合</returns>
        public IEnumerable<sys_role> FindListByClause(Expression<Func<sys_role, bool>> predicate, string orderBy)
        {
            return _Sys_RoleRepositoryS.FindListByClause(predicate, orderBy);
        }
        /// <summary>
        /// 根据条件查询总数
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <returns></returns>
        public int FindCount(Expression<Func<sys_role, bool>> predicate)
        {
            return _Sys_RoleRepositoryS.FindCount(predicate);
        }

        /// <summary>
        /// 根据条件分页
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="page">第几页</param>
        /// <param name="row">每页显示多少条</param>
        /// <param name="orderBy">排序规则</param>
        /// <returns></returns>
        public IEnumerable<sys_role> FindPageListByClause(Expression<Func<sys_role, bool>> predicate, int page, int row, string orderBy)
        {
            return _Sys_RoleRepositoryS.FindPageListByClause(predicate, page, row, orderBy);
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
        public IEnumerable<sys_role> FindPageListByClause(Expression<Func<sys_role, bool>> predicate, int page, int row, string orderBy, ref int totalNumber)
        {
            return _Sys_RoleRepositoryS.FindPageListByClause(predicate, page, row, orderBy, ref totalNumber);
        }

        /// <summary>
        /// 根据条件查询数据
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <returns></returns>
        public sys_role FindByClause(Expression<Func<sys_role, bool>> predicate)
        {
            return _Sys_RoleRepositoryS.FindByClause(predicate);
        }

        /// <summary>
        /// 写入实体数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public long Insert(sys_role entity)
        {
            return _Sys_RoleRepositoryS.Insert(entity);
        }

        /// <summary>
        /// 更新实体数据
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool Update(sys_role entity)
        {
            return _Sys_RoleRepositoryS.Update(entity);
        }

        /// <summary>
        /// 更新实体数据
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="updateColumns">修改字段表达式树</param>
        /// <returns></returns>
        public bool Update(sys_role entity, Expression<Func<sys_role, object>> updateColumns)
        {
            return _Sys_RoleRepositoryS.Update(entity, updateColumns);
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Delete(sys_role entity)
        {
            return _Sys_RoleRepositoryS.Delete(entity);
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="where">过滤条件</param>
        /// <returns></returns>
        public bool Delete(Expression<Func<sys_role, bool>> @where)
        {
            return _Sys_RoleRepositoryS.Delete(@where);
        }

        /// <summary>
        /// 删除指定ID的数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeleteById(object id)
        {
            return _Sys_RoleRepositoryS.DeleteById(id);
        }

        /// <summary>
        /// 删除指定ID集合的数据(批量删除)
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public bool DeleteByIds(object[] ids)
        {
            return _Sys_RoleRepositoryS.DeleteByIds(ids);
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
        public PageList<sys_role> GetPageList(Expression<Func<sys_role, bool>> predicate, int page, int row, string orderBy)
        {
            PageList<sys_role> pageList = new PageList<sys_role>();
            pageList.page = page;
            pageList.pageCount = (pageList.total / row);
            int totalNumber = 0;
            pageList.rows = _Sys_RoleRepositoryS.FindPageListByClause(predicate, page, row, orderBy, ref totalNumber);
            pageList.total = totalNumber;
            return pageList;
        }
    }
}
