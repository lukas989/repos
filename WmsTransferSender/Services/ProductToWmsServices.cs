using AutoMapper;
using Lib;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WmsTransferSender.Models.Wms;

namespace WmsTransferSender.Services
{
    class ProductToWmsServices
    {

        private WmsConnectionEntities db = new WmsConnectionEntities();

        internal void StartProcessing()
        {
            System.Console.WriteLine("Start processing product");

            //GET
            List<Products> products = getAllPrudectsToSend();

            foreach (var product in products)
            {
                //MAPPING
                Item item = Mapper.Map<Products, Item>(product);

                //SEND
                var sendResult = sendToWms(item);

                //UPDATE
                updateProduct(product, sendResult);
            }


            System.Console.WriteLine("End processing product");

        }

        private void updateProduct(Products product, bool sendResult)
        {
            if (sendResult)
            {
                product.WmsUpdate = DateTime.Now;
                db.Products.Attach(product);
                db.Entry(product).Property(x => x.WmsUpdate).IsModified = true;
                db.SaveChanges();
            }
                
        }

        private bool sendToWms(Item item)
        {
            HttpClientLib httpClientLib = new HttpClientLib();
            var result = httpClientLib.PutXmlAsync<Item>("wms", "item", item).Result;
            return result;
        }

        private List<Products> getAllPrudectsToSend()
        {
            return db.Products.Where(x => x.WmsUpdate == null || x.WmsUpdate < x.LastUpdate).ToList();
        }
    }
}
