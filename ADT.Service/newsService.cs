using System;
using System.Collections.Generic;
using System.Text;
using System.Linq.Expressions;
using ADT.Models;
using ADT.Repository.IRepository;
using ADT.Service.IService;

namespace ADT.Service
{
    public class newsService : InewsService
    {
        private InewsRepository _newsRepositoryS;
        public newsService(InewsRepository newsRepositoryS)
        {
            _newsRepositoryS = newsRepositoryS;
        }
		#region 通用模板功能
        /// <summary>
        /// 根据主值查询单条数据
        /// </summary>
        /// <param name="pkValue">主键值</param>
        /// <returns>泛型实体</returns>
        public news FindById(object pkValue)
        {
            return _newsRepositoryS.FindById(pkValue);
        }

        /// <summary>
        /// 查询所有数据(无分页,请慎用)
        /// </summary>
        /// <returns></returns>
        public IEnumerable<news> FindAll()
        {
            return _newsRepositoryS.FindAll();
        }

        /// <summary>
        /// 根据条件查询数据
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="orderBy">排序</param>
        /// <returns>泛型实体集合</returns>
        public IEnumerable<news> FindListByClause(Expression<Func<news, bool>> predicate, string orderBy)
        {
            return _newsRepositoryS.FindListByClause(predicate, orderBy);
        }
        /// <summary>
        /// 根据条件查询总数
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <returns></returns>
        public int FindCount(Expression<Func<news, bool>> predicate)
        {
            return _newsRepositoryS.FindCount(predicate);
        }

        /// <summary>
        /// 根据条件分页
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="page">第几页</param>
        /// <param name="row">每页显示多少条</param>
        /// <param name="orderBy">排序规则</param>
        /// <returns></returns>
        public IEnumerable<news> FindPageListByClause(Expression<Func<news, bool>> predicate, int page, int row, string orderBy)
        {
            return _newsRepositoryS.FindPageListByClause(predicate, page, row, orderBy);
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
        public IEnumerable<news> FindPageListByClause(Expression<Func<news, bool>> predicate, int page, int row, string orderBy, ref int totalNumber)
        {
            return _newsRepositoryS.FindPageListByClause(predicate, page, row, orderBy, ref totalNumber);
        }

        /// <summary>
        /// 根据条件查询数据
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <returns></returns>
        public news FindByClause(Expression<Func<news, bool>> predicate)
        {
            return _newsRepositoryS.FindByClause(predicate);
        }

        /// <summary>
        /// 写入实体数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public long Insert(news entity)
        {
            return _newsRepositoryS.Insert(entity);
        }

        /// <summary>
        /// 批量写入实体数据
        /// </summary>
        /// <param name="entitylist">实体类集合</param>
        /// <returns></returns>
        public long InsertBatch(List<news> entitylist)
		{
			return _newsRepositoryS.InsertBatch(entitylist);
		}

        /// <summary>
        /// 更新实体数据
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool Update(news entity)
        {
            return _newsRepositoryS.Update(entity);
        }

        /// <summary>
        /// 更新实体数据
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="updateColumns">修改字段表达式树</param>
        /// <returns></returns>
        public bool Update(news entity, Expression<Func<news, object>> updateColumns)
        {
            return _newsRepositoryS.Update(entity, updateColumns);
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Delete(news entity)
        {
            return _newsRepositoryS.Delete(entity);
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="where">过滤条件</param>
        /// <returns></returns>
        public bool Delete(Expression<Func<news, bool>> @where)
        {
            return _newsRepositoryS.Delete(@where);
        }

        /// <summary>
        /// 删除指定ID的数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeleteById(object id)
        {
            return _newsRepositoryS.DeleteById(id);
        }

        /// <summary>
        /// 删除指定ID集合的数据(批量删除)
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public bool DeleteByIds(object[] ids)
        {
            return _newsRepositoryS.DeleteByIds(ids);
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
        public PageList<news> GetPageList(Expression<Func<news, bool>> predicate, int page, int row, string orderBy)
        {
            PageList<news> pageList = new PageList<news>();
            pageList.page = page;
            pageList.pageCount = (pageList.total / row);
            int totalNumber = 0;
            pageList.rows = _newsRepositoryS.FindPageListByClause(predicate, page, row, orderBy, ref totalNumber);
            pageList.total = totalNumber;
            return pageList;
        }
    }
}
