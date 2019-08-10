using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.UI.WebControls;

namespace WmsSimulator.Controllers
{
    public class XmlController : ApiController
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();
        // PUT: api/Xml/5
        [HttpPut]
        public HttpResponseMessage Put(string content, HttpRequestMessage request)
        {

            if (String.IsNullOrWhiteSpace(content))
                return Request.CreateResponse(HttpStatusCode.BadRequest);

            XmlIn xmlIn = new XmlIn()
            {
                Content = content,
                Body = "TEST_2",
                EntryDate = DateTime.Now
             
            };

            db.XmlIn.Add(xmlIn);
            db.SaveChanges();

            return Request.CreateResponse(HttpStatusCode.OK);
        }
    }
}
