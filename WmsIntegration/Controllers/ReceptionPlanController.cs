using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WmsIntegration.Models;

namespace WmsIntegration.Controllers
{
    [Produces("application/json")]
    [Route("api/ReceptionPlan")]
    public class ReceptionPlanController : Controller
    {
        // PUT: api/ReceptionPlan
        [HttpPut]
        public void Put([FromBody]ReceptionPlanModel value)
        {

        }
    }
}
