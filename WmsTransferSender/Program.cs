using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WmsTransferSender.Services;

namespace WmsTransferSender
{
    class Program
    {
        static void Main(string[] args)
        {
            Init();
            if (args.Length == 0)
            {
                System.Console.WriteLine("Please enter a argument.");
            }
            else if (args[0] == "Product")
            {
                new ProductToWmsServices().StartProcessing();
            }
            else if (args[0] == "ReceiptPlans")
            {
                new ReceiptPlansToWmsServices().StartProcessing();
            }
            else if (args[0] == "SalesOrder")
            {
                new SalesOrderToWmsServices().StartProcessing();
            }
            Console.ReadKey();
        }

        [Obsolete]
        private static void Init()
        { 
            _ = new WmsTransferSender.Mappers();
        }
    }
}
