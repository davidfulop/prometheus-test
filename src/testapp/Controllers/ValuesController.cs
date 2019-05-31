using System;
using Microsoft.AspNetCore.Mvc;

namespace testapp.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        [HttpGet]
        public ActionResult<string> Get()
        {
            return DateTime.UtcNow.ToString();
        }
    }
}
