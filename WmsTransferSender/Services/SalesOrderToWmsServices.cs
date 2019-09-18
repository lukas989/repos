using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using Lib;
using Models;
using Models.Wms;

namespace WmsTransferSender
{
    internal class SalesOrderToWmsServices
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        internal void StartProcessing()
        {
            System.Console.WriteLine("Start processing Sales Order");

            //GET
            List<SalesOrderToWms> salesOrders = getAllSalesOrderToSend();

            foreach (var salesOrder in salesOrders)
            {
                Order order = mapRecipt(salesOrder);

                //SEND
                var sendResult = sendToWms(order);

                //UPDATE
                updateSalesOrder(salesOrder.SalesOrder, sendResult);
            }


            System.Console.WriteLine("End processing Sales Order");


        }

        private Order mapRecipt(SalesOrderToWms salesOrder)
        {
            Order order = new Order
            {
                Customer = Mapper.Map<Customers, Customer>(salesOrder.Customers),
                OrderHeader = Mapper.Map<SalesOrders, OrderHeader>(salesOrder.SalesOrder),
                OrderLines = Mapper.Map<List<SalesOrderLines>, List<OrderLine>>(salesOrder.SalesOrderLines)
            };
            order.OrderLines.ForEach(x => x.CurrencyId = salesOrder.SalesOrder.CurrencyId);
            return order;
        }

        private bool sendToWms(Order order)
        {
            HttpClientLib httpClientLib = new HttpClientLib();
            var result = httpClientLib.PutXmlAsync<Order>("wms", "Order", order).Result;
            return result;
        }

        private void updateSalesOrder(SalesOrders salesOrder, bool sendResult)
        {
            if (sendResult)
            {
                salesOrder.WmsUpdate = DateTime.Now;
                db.SalesOrders.Attach(salesOrder);
                db.Entry(salesOrder).Property(x => x.WmsUpdate).IsModified = true;
                db.SaveChanges();
                System.Console.WriteLine("salesOrder:" + salesOrder.SalesOrderId + "\nSend to Wms");
            }
        }

        private List<SalesOrderToWms> getAllSalesOrderToSend()
        {
            var salesOrderToWmsList = new List<SalesOrderToWms>();
            var salesOrders = db.SalesOrders.Where(x => x.WmsUpdate == null && x.SalesOrderStatusId == (int)SalesOrderStatusId.InProgres).ToList();
            foreach (var salesOrder in salesOrders)
            {
                var salesOrderList = db.SalesOrderLines.Where(x => x.SalesOrderId == salesOrder.SalesOrderId).ToList();
                var customers = db.Customers.Where(x => x.CustomerId == salesOrder.CustomerId).FirstOrDefault();

                var salesOrderToWms = new SalesOrderToWms()
                {
                    SalesOrder = salesOrder,
                    Customers = customers,
                    SalesOrderLines = salesOrderList
                };
                salesOrderToWmsList.Add(salesOrderToWms);
            }
            return salesOrderToWmsList;
        }
    }
}