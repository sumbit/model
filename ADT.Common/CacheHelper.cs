using Microsoft.Extensions.Caching.Memory;
using System;
using System.Collections.Generic;
using System.Text;

namespace ADT.Common
{
    public class CacheHelper
    {
        static MemoryCache client = new MemoryCache(new MemoryCacheOptions());
        public static void Set<T>(string key, T value, DateTimeOffset exdt)
        {
            client.Set(key, value, exdt);
        }
        public static object Get(string key)
        {
            return client.Get(key);
        }
    }
}
