using System;
using System.Collections.Generic;
using System.Text;
using ADT.Models;
using ADT.Repository.IRepository;

namespace ADT.Repository
{
    public class newsRepository : BaseRepository<news>, InewsRepository
    {
    }
}
