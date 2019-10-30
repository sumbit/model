using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebSite.Areas.Admin.Controllers.Sys
{
    [Authorize]
    public class PowerControlController : Controller
    {
        // GET: /<controller>/
        public IActionResult Index()
        {
            return PartialView();
        }
    }
}
