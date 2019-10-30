using ADT.Common;
using System;
using System.Linq;
using System.Text;

namespace ADT.Models
{
    ///<summary>
    ///
    ///</summary>
    public partial class Member
    {
           public Member(){


           }
           /// <summary>
           /// Desc:
           /// Default:newid()
           /// Nullable:False
           /// </summary>           
           public Guid Member_ID {get;set;}

           /// <summary>
           /// Desc:
           /// Default:
           /// Nullable:True
           /// </summary>       
           [Field("编号")]
           public string Member_Num {get;set;}

           /// <summary>
           /// Desc:
           /// Default:
           /// Nullable:True
           /// </summary>           
           [Field("会员名称")]
           public string Member_Name {get;set;}

           /// <summary>
           /// Desc:
           /// Default:
           /// Nullable:True
           /// </summary>              
           [Field("会员电话")]
           public int? Member_Phone {get;set;}

           /// <summary>
           /// Desc:
           /// Default:
           /// Nullable:True
           /// </summary>      
           [Field("性别")]
           public string Member_Sex {get;set;}

           /// <summary>
           /// Desc:
           /// Default:
           /// Nullable:True
           /// </summary>       
           [Field("生日")]
           public DateTime? Member_Birthday {get;set;}

           /// <summary>
           /// Desc:
           /// Default:
           /// Nullable:True
           /// </summary>           
           [Field("头像")]
           public string Member_Photo {get;set;}

           /// <summary>
           /// Desc:
           /// Default:
           /// Nullable:True
           /// </summary>           
           public Guid? Member_UserID {get;set;}

           /// <summary>
           /// Desc:
           /// Default:
           /// Nullable:True
           /// </summary>           
           [Field("介绍")]
           public string Member_Introduce {get;set;}

           /// <summary>
           /// Desc:
           /// Default:
           /// Nullable:True
           /// </summary>           
           [Field("文件")]
           public string Member_FilePath {get;set;}

           /// <summary>
           /// Desc:
           /// Default:DateTime.Now
           /// Nullable:True
           /// </summary>           
           public DateTime? Member_CreateTime {get;set;}

    }
}
