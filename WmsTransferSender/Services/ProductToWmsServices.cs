using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WmsTransferSender.Services
{
    class ProductToWmsServices
    {

        private WmsConnectionEntities db = new WmsConnectionEntities();

        internal void StartProcessing()
        {
            System.Console.WriteLine("Start processing product");

            //GET
            IQueryable<Products> products = getAllPrudectsToSend();


            foreach (var item in products)
            {
                //MAPPING


                //SEND


                //UPDATE

            }


            System.Console.WriteLine("End processing product");

        }

        private IQueryable<Products> getAllPrudectsToSend()
        {
            return db.Products.Where(x=>x.WmsUpdate != null);
        }
    }
}
