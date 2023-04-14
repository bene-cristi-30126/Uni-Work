using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WebApplication3
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public double Grade(double val, string valuta)
        {
            if (valuta.Equals("C"))
            {
                return val * 1.8 + 32;
            }
            else if (valuta.Equals("F"))
            {
                return (val - 32) / 1.8;
            }
            else
                return 0;

        }

        [WebMethod]
        public string Date_Time()
        {
            DateTime dateTime = DateTime.Now;
            return dateTime.ToString();
        }

        [WebMethod]
        public List<string> PrintElements()
        {
            List<string> elements = new List<string>(5);
            elements.Add("Churchill");
            elements.Add("Kent");
            elements.Add("Ela");
            elements.Add("Lautaro");
            elements.Add("California");

            return elements;
        }

        [WebMethod]
        public double Convertinatoru(double val, string valuta)
        {
            if (valuta.Equals("lei"))
            {
                return val / 5;
            }
            else if (valuta.Equals("euro"))
            {
                return val * 5;
            }
            else
                return 0;

        }

    }
}
