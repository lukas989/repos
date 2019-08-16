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
            List<ReceiptPlanToWms> receiptPlans = getAllReceiptPlansToSend();

            foreach (var receiptPlan in receiptPlans)
            {
                Receipt receipt = mapRecipt(receiptPlan);

                //SEND
                var sendResult = sendToWms(receipt);

                //UPDATE
                updateReceiptPlan(receiptPlan.ReceiptPlans, sendResult);
            }


            System.Console.WriteLine("End processing product");

        }

        private Receipt mapRecipt(ReceiptPlanToWms receiptPlan)
        {

            Receipt receipt = new Receipt
            {
                Supplier = Mapper.Map<Suppliers, Supplier>(receiptPlan.Supplier),
                ReceiptHeader = Mapper.Map<ReceiptPlans, ReceiptHeader>(receiptPlan.ReceiptPlans),
                ReceiptLines = Mapper.Map< List < VReceiptPlanLines > ,List<ReceiptLine>>(receiptPlan.VReceiptPlanLines)
            };

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

        private List<ReceiptPlanToWms> getAllReceiptPlansToSend()
        {
            var receiptPlanToWmsList = new List<ReceiptPlanToWms>();
            var receiptPlans = db.ReceiptPlans.Where(x => x.WmsUpdate == null && x.ReceiptPlanStatusId == (int)ReceiptPlanStatusId.Ended).ToList();
            foreach (var receiptPlan in receiptPlans)
            {
                var supplier = db.Suppliers.FirstOrDefault(x=> x.SupplierId == receiptPlan.SupplierId);
                var receiptplanlines = db.VReceiptPlanLines.Where(x => x.ReceiptPlanId == receiptPlan.ReceiptPlanId).ToList();
                var receiptPlanToWms = new ReceiptPlanToWms()
                {
                    ReceiptPlans = receiptPlan,
                    Supplier = supplier,
                    VReceiptPlanLines = receiptplanlines
                };
                receiptPlanToWmsList.Add(receiptPlanToWms);
            }

            return receiptPlanToWmsList;
        }
    }
}