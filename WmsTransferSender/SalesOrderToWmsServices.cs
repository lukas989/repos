using System;
using System.Collections.Generic;
using Models;

namespace WmsTransferSender
{
    internal class SalesOrderToWmsServices
    {
        internal void StartProcessing()
        {
            System.Console.WriteLine("Start processing Sales Order");

            //GET
            List<SalesOrderToWms > salesOrders = getAllSalesOrderToSend();

            foreach (var salesOrder in salesOrders)
            {
                OrederImport orederImport = mapRecipt(salesOrder);

                //SEND
                var sendResult = sendToWms(orederImport);

                //UPDATE
                updateSalesOrder(salesOrder.SalesOrder, sendResult);
            }


            System.Console.WriteLine("End processing Sales Order");


        }

        private OrederImport mapRecipt(SalesOrderToWms salesOrder)
        {
            throw new NotImplementedException();
        }

        private object sendToWms(OrederImport orederImport)
        {
            throw new NotImplementedException();
        }

        private void updateSalesOrder(SalesOrders salesOrder, object sendResult)
        {
            throw new NotImplementedException();
        }

        private List<SalesOrderToWms> getAllSalesOrderToSend()
        {
            throw new NotImplementedException();
        }
    }
}