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
            Mapper.Initialize(cfg => cfg.CreateMap<Products, Item>().ForMember(dest => dest.PartNumber, p => p.MapFrom(scr => scr.ProductId)));
        }
    }
}
