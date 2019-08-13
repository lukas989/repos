using AutoMapper;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WmsTransferSender.Models.Wms;

namespace WmsTransferSender
{
    internal class Mappers
    {
        [Obsolete]
        public Mappers()
        {
            Mapper.Initialize(cfg =>
            {
                cfg.CreateMap<Products, Item>().ForMember(dest => dest.PartNumber, p => p.MapFrom(scr => scr.ProductId));

                cfg.CreateMap<ReceiptPlans, ReceiptHeader>().ForMember(dest => dest.ErCode, p => p.MapFrom(scr => scr.ReceiptPlanId)).BeforeMap((s, d) => d.LogisticSite = "WA");

                cfg.CreateMap<Suppliers, Supplier>().ForMember(dest => dest.SupplierName, p => p.MapFrom(scr => scr.Name)).ForMember(dest => dest.SupplierCode, p => p.MapFrom(scr => scr.SupplierId));

                cfg.CreateMap<VReceiptPlanLines, ReceiptLine>().ForMember(dest => dest.PartNumber, p => p.MapFrom(scr => scr.ProductId)).ForMember(dest => dest.ExpectedQuantity, p => p.MapFrom(scr => scr.ExpectedQty));

            }
            ); 
  
        }
    }
}
