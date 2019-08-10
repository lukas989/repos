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
            if (args.Length == 0)
            {
                System.Console.WriteLine("Please enter a argument.");
            }
            else if (args[0] == "Product")
            {
                new ProductToWmsServices().StartProcessing();
            }
        }
    }
}
