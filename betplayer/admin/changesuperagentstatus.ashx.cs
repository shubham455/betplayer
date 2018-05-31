using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace betplayer.admin
{
    /// <summary>
    /// Summary description for changesuperagentstatus
    /// </summary>
    public class changesuperagentstatus : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hello World");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}