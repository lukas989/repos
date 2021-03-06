﻿using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Models;
using Models.Wms;

namespace WebApplicationAPI.Controllers
{
    public class WmsController : ApiController
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();


        [HttpGet]
        [Route("api/Wms/ReceiptPlanLineConfirmWms")]
        public IQueryable<ReceiptPlanLineConfirmWms> ReceiptPlanLineConfirmWms()
        {
            return db.ReceiptPlanLineConfirmWms;
        }
        [HttpPut]
        [Route("api/Wms/ReceiptExport")]
        public IHttpActionResult ReceiptExport([FromBody]ReceiptExport receiptExport)
        {
            if (existReferenceNumber(receiptExport.Header.ReferenceNumber, WmsOperation.Receipt))
            {
                return BadRequest("ReferenceNumber exist:" + receiptExport.Header.ReferenceNumber);
            }

            foreach (ReceiptExportLine receiptExportLine in receiptExport.Lines)
            {
                int receivedQuantity = int.Parse(receiptExportLine.ReceivedQuantity);
                var vReceiptPlanLinesUnconfirmedList = db.VReceiptPlanLines.Where(x => x.ReceiptPlanId.ToString() == receiptExport.Header.ErCode && x.ProductId.ToString() == receiptExportLine.PartNumber && x.RecivedQty < x.ExpectedQty).ToList();
                foreach (VReceiptPlanLines vReceiptPlanLine in vReceiptPlanLinesUnconfirmedList)
                {
                    if (receivedQuantity > 0)
                    {
                        int confirmed = 0;
                        int unconfirmedReceiptPlanLine = vReceiptPlanLine.ExpectedQty - vReceiptPlanLine.RecivedQty;
                        if (unconfirmedReceiptPlanLine == 0)
                        {
                            break;
                        }
                        else if (unconfirmedReceiptPlanLine >= receivedQuantity)
                        {
                            confirmed = receivedQuantity;
                        }
                        else
                        {
                            confirmed = unconfirmedReceiptPlanLine;
                        }
                        var currentDateTime = DateTime.Now;

                        ReceiptPlanLineConfirmWms receiptPlanLineConfirmWms = new ReceiptPlanLineConfirmWms() { WmsDate = currentDateTime };
                        Mapper.Map<ReceiptExportHeader, ReceiptPlanLineConfirmWms>(receiptExport.Header, receiptPlanLineConfirmWms);
                        Mapper.Map<ReceiptExportLine, ReceiptPlanLineConfirmWms>(receiptExportLine, receiptPlanLineConfirmWms);
                        db.ReceiptPlanLineConfirmWms.Add(receiptPlanLineConfirmWms);

                        var receiptPlanLines = db.ReceiptPlanLines.FirstOrDefault(x => x.ReceiptPlanId == vReceiptPlanLine.ReceiptPlanId && x.ReceiptPlanLineNo == vReceiptPlanLine.ReceiptPlanLineNo);
                        receiptPlanLines.RecivedQty += confirmed;
                        receiptPlanLines.LastUpdate = currentDateTime;
                        receiptPlanLines.LastAuthor = "Wms";

                        var purchaseOrderLines = db.PurchaseOrderLines.FirstOrDefault(x => x.PurchaseOrderId == vReceiptPlanLine.PurchaseOrderId && x.PurchaseOrderLineNo == vReceiptPlanLine.PurchaseOrderLineNo);
                        purchaseOrderLines.RecivedQty += confirmed;
                        purchaseOrderLines.LastUpdate = currentDateTime;
                        purchaseOrderLines.LastAuthor = "Wms";
                        receivedQuantity -= confirmed;
                        db.SaveChanges();
                    }
                }
            }
            return Ok();
        }

        private bool existReferenceNumber(string referenceNumber, WmsOperation wmsOperation)
        {
            if (wmsOperation == WmsOperation.Receipt)
            {
                return db.ReceiptPlanLineConfirmWms.Any(x => x.ReferenceNumber == referenceNumber);
            }
            else if (wmsOperation == WmsOperation.Order)
            {
                return db.OrderLineConfirmWms.Any(x => x.ReferenceNumber == referenceNumber);
            }
            else
            {
                return true;
            }


        }

        [HttpPut]
        [Route("api/Wms/ItemExport")]
        public IHttpActionResult ItemExport([FromBody]ItemExport itemExport)
        {
            var product = db.Products.FirstOrDefault(x => x.ProductId == itemExport.PartNumber);
            Mapper.Map<ItemExport, Products>(itemExport, product);
            var currentDateTime = DateTime.Now;
            product.LastUpdate = currentDateTime;
            product.WmsUpdate = currentDateTime;
            product.LastAuthor = "Wms";
            db.SaveChanges();
            return Ok();
        }

        [HttpPut]
        [Route("api/Wms/OrderExport")]
        public IHttpActionResult OrderExport([FromBody]OrderExport orderExport)
        {
            if (existReferenceNumber(orderExport.Header.ReferenceNumber, WmsOperation.Order))
            {
                return BadRequest("ReferenceNumber exist:" + orderExport.Header.ReferenceNumber);
            }

            foreach (var orderExportLines in orderExport.OrderExportLines)
            {
                var currentDateTime = DateTime.Now;
                OrderLineConfirmWms orderLineConfirmWms = new OrderLineConfirmWms() { WmsDate = currentDateTime };
                Mapper.Map<OrderExportHeader, OrderLineConfirmWms>(orderExport.Header, orderLineConfirmWms);
                Mapper.Map<OrderExportLine, OrderLineConfirmWms>(orderExportLines, orderLineConfirmWms);
                db.OrderLineConfirmWms.Add(orderLineConfirmWms);

                var salesOrderLines = db.SalesOrderLines.FirstOrDefault(x => x.SalesOrderId.ToString() == orderExport.Header.OrderCode && x.SalesOrderLineNo.ToString() == orderExportLines.OrderLineNo);
                salesOrderLines.RecivedQty = Int32.Parse(orderExportLines.CheckedQuantity);
                salesOrderLines.LastUpdate = currentDateTime;
                salesOrderLines.LastAuthor = "Wms";
                db.SaveChanges();
            }
            return Ok();
        }

    }
}