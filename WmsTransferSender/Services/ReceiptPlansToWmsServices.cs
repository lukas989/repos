using AutoMapper;
using Lib;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using WmsTransferSender.Models.Wms;

namespace WmsTransferSender
{
    internal class ReceiptPlansToWmsServices
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        internal void StartProcessing()
        {
            System.Console.WriteLine("Start processing product");

            //GET
            List<ReceiptPlans> receiptPlans = getAllReceiptPlansToSend();

            foreach (var receiptPlan in receiptPlans)
            {
                Receipt receipt = mapRecipt(receiptPlan);

                //SEND
                var sendResult = sendToWms(receipt);

                //UPDATE
                //updateReceiptPlan(receiptPlan, sendResult);
            }


            System.Console.WriteLine("End processing product");

        }

        private Receipt mapRecipt(ReceiptPlans receiptPlan)
        {
            Suppliers suppliers =  db.Suppliers.FirstOrDefault(x => x.SupplierId == receiptPlan.SupplierId);
            List<ReceiptPlanLines> receiptPlanLines = db.ReceiptPlanLines.Where(x => x.ReceiptPlanId == receiptPlan.ReceiptPlanId).ToList();

            Receipt receipt = new Receipt();
            receipt.ReceiptHeader = Mapper.Map<ReceiptPlans,ReceiptHeader>(receiptPlan);
            return receipt;
        }

        private void updateReceiptPlan(ReceiptPlans receiptPlan, bool sendResult)
        {
            if (sendResult)
            {
                receiptPlan.WmsUpdate = DateTime.Now;
                db.ReceiptPlans.Attach(receiptPlan);
                db.Entry(receiptPlan).Property(x => x.WmsUpdate).IsModified = true;
                db.SaveChanges();
                System.Console.WriteLine("receiptPlan:" + receiptPlan.ReceiptPlanId + "\nSend to Wms");
            }

        }

        private bool sendToWms(Receipt receipt)
        {
            HttpClientLib httpClientLib = new HttpClientLib();
            var result = httpClientLib.PutXmlAsync<Receipt>("wms", "ReceiptPlan", receipt).Result;
            return result;
        }

        private List<ReceiptPlans> getAllReceiptPlansToSend()
        {
            return db.ReceiptPlans.Where(x => x.WmsUpdate == null && x.ReceiptPlanStatusId == (int)ReceiptPlanStatusId.Ended).ToList();
        }
    }
}