using System;
using System.Collections.Generic;
using System.Text;
using System.Linq.Expressions;
using ADT.Models;
using ADT.Repository.IRepository;
using ADT.Service.IService;
using SqlSugar;

namespace ADT.Service
{
    public class Sys_UserService : ISys_UserService
    {
        private ISys_UserRepository _Sys_UserRepositoryS;
        private ISys_UserRoleRepository _Sys_UserRoleRepositoryS;
        public Sys_UserService(ISys_UserRepository Sys_UserRepositoryS, ISys_UserRoleRepository Sys_UserRoleRepositoryS)
        {
            _Sys_UserRepositoryS = Sys_UserRepositoryS;
            _Sys_UserRoleRepositoryS = Sys_UserRoleRepositoryS;
        }
        #region 通用模板功能
        /// <summary>
        /// 根据主值查询单条数据
        /// </summary>
        /// <param name="pkValue">主键值</param>
        /// <returns>泛型实体</returns>
        public sys_user FindById(object pkValue)
        {
            return _Sys_UserRepositoryS.FindById(pkValue);
        }

        /// <summary>
        /// 查询所有数据(无分页,请慎用)
        /// </summary>
        /// <returns></returns>
        public IEnumerable<sys_user> FindAll()
        {
            return _Sys_UserRepositoryS.FindAll();
        }

        /// <summary>
        /// 根据条件查询数据
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="orderBy">排序</param>
        /// <returns>泛型实体集合</returns>
        public IEnumerable<sys_user> FindListByClause(Expression<Func<sys_user, bool>> predicate, string orderBy)
        {
            return _Sys_UserRepositoryS.FindListByClause(predicate, orderBy);
        }
        /// <summary>
        /// 根据条件查询总数
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <returns></returns>
        public int FindCount(Expression<Func<sys_user, bool>> predicate)
        {
            return _Sys_UserRepositoryS.FindCount(predicate);
        }

        /// <summary>
        /// 根据条件分页
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <param name="page">第几页</param>
        /// <param name="row">每页显示多少条</param>
        /// <param name="orderBy">排序规则</param>
        /// <returns></returns>
        public IEnumerable<sys_user> FindPageListByClause(Expression<Func<sys_user, bool>> predicate, int page, int row, string orderBy)
        {
            return _Sys_UserRepositoryS.FindPageListByClause(predicate, page, row, orderBy);
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
        public IEnumerable<sys_user> FindPageListByClause(Expression<Func<sys_user, bool>> predicate, int page, int row, string orderBy, ref int totalNumber)
        {
            return _Sys_UserRepositoryS.FindPageListByClause(predicate, page, row, orderBy, ref totalNumber);
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
        public DataTable FindPageListByClauseData(Expression<Func<sys_user, bool>> predicate, int page, int row, string orderBy, ref int totalNumber)
        {
            return _Sys_UserRepositoryS.FindPageListByClauseData(predicate, page, row, orderBy, ref totalNumber);
        }

        /// <summary>
        /// 根据条件查询数据
        /// </summary>
        /// <param name="predicate">条件表达式树</param>
        /// <returns></returns>
        public sys_user FindByClause(Expression<Func<sys_user, bool>> predicate)
        {
            return _Sys_UserRepositoryS.FindByClause(predicate);
        }

        /// <summary>
        /// 写入实体数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public long Insert(sys_user entity)
        {
            return _Sys_UserRepositoryS.Insert(entity);
        }

        /// <summary>
        /// 更新实体数据
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool Update(sys_user entity)
        {
            return _Sys_UserRepositoryS.Update(entity);
        }

        /// <summary>
        /// 更新实体数据
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="updateColumns">修改字段表达式树</param>
        /// <returns></returns>
        public bool Update(sys_user entity, Expression<Func<sys_user, object>> updateColumns)
        {
            return _Sys_UserRepositoryS.Update(entity, updateColumns);
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Delete(sys_user entity)
        {
            return _Sys_UserRepositoryS.Delete(entity);
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="where">过滤条件</param>
        /// <returns></returns>
        public bool Delete(Expression<Func<sys_user, bool>> @where)
        {
            return _Sys_UserRepositoryS.Delete(@where);
        }

        /// <summary>
        /// 删除指定ID的数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeleteById(object id)
        {
            return _Sys_UserRepositoryS.DeleteById(id);
        }

        /// <summary>
        /// 删除指定ID集合的数据(批量删除)
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public bool DeleteByIds(object[] ids)
        {
            return _Sys_UserRepositoryS.DeleteByIds(ids);
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
        public PageList<sys_user> GetPageList(Expression<Func<sys_user, bool>> predicate, int page, int row, string orderBy)
        {
            PageList<sys_user> pageList = new PageList<sys_user>();
            pageList.page = page;
            pageList.pageCount = (pageList.total / row);
            int totalNumber = 0;
            pageList.rows = _Sys_UserRepositoryS.FindPageListByClause(predicate, page, row, orderBy, ref totalNumber);
            pageList.total = totalNumber;
            return pageList;
        }
        /// <summary>
        /// 修改用户并修改关联角色
        /// </summary>
        /// <param name="u"></param>
        /// <returns></returns>
        public bool UpdateUsers(view_sys_user_role u)
        {
            var model = new sys_user();
            model.User_ID = u.User_ID;
            model.User_LoginName = u.User_LoginName;
            model.User_Name = u.User_Name;
            model.User_Pwd = u.User_Pwd;
            model.User_Email = u.User_Email;
            var result = _Sys_UserRepositoryS.Update(model, p => new { p.User_LoginName, p.User_Name, p.User_Pwd, p.User_Email, p.User_CreateTime });
            if (result)
            {
                var rmodel = new sys_userrole();
                rmodel.UserRole_ID = u.UserRole_ID;
                rmodel.UserRole_RoleID = u.Role_ID;
                rmodel.UserRole_UserID = u.User_ID;
                _Sys_UserRoleRepositoryS.Update(rmodel, p => new { p.UserRole_RoleID, p.UserRole_UserID });
            }
            return result;
        }
        /// <summary>
        /// 创建用户并关联角色
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool InsertUsers(view_sys_user_role model)
        {
            var umodel = new sys_user();
            umodel.User_ID = Guid.NewGuid().ToString();
            umodel.User_CreateTime = DateTime.Now;
            umodel.User_Email = model.User_Email;
            umodel.User_IsDelete = 1;
            umodel.User_LoginName = model.User_LoginName;
            umodel.User_Name = model.User_Name;
            umodel.User_Pwd = model.User_Pwd;
            var result = _Sys_UserRepositoryS.Insert(umodel);
            if (result > 0)
            {
                var urmodel = new sys_userrole();
                urmodel.UserRole_CreateTime = DateTime.Now;
                urmodel.UserRole_ID = Guid.NewGuid().ToString();
                urmodel.UserRole_RoleID = model.Role_ID;
                urmodel.UserRole_UserID = umodel.User_ID;
                result = _Sys_UserRoleRepositoryS.Insert(urmodel);
                if (result <= 0)
                    _Sys_UserRepositoryS.Delete(umodel);
            }
            return result > 0;
        }
    }
}
