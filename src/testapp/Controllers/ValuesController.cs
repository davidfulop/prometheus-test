using System;
using Microsoft.AspNetCore.Mvc;
using Prometheus;

namespace testapp.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        private static readonly Counter GetCount = Metrics.CreateCounter(
            "testapp_values_get_count", "Number of GET calls to /values.");

        [HttpGet]
        public ActionResult<string> Get()
        {
            GetCount.Inc();
            return DateTime.UtcNow.ToString();
        }
    }
}
