using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppClient
{
    internal class Program
    {
        static void Main(string[] args)
        {

            ConsoleAppClient.ServiceReference1.WebService1SoapClient service =
            new ConsoleAppClient.ServiceReference1.WebService1SoapClient();

            double new_grade = service.Grade(25, "C");
            Console.WriteLine("The grade after conversion is        " + new_grade.ToString() + " Fahrenheit");
            Console.ReadKey();


            double new_money = service.Convertinatoru(100, "euro");
            Console.WriteLine("The money after conversion is        " + new_money.ToString() + " lei");
            Console.ReadKey();

            List<string> elements = service.PrintElements();
            foreach (var element in elements)
            {
                Console.WriteLine(element);
            }
            Console.ReadKey();

            string timpu = service.Date_Time();
            Console.WriteLine("The time is        " + timpu);
            Console.ReadKey();
        }
    }
}
